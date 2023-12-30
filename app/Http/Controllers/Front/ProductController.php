<?php

namespace App\Http\Controllers\Front;
use App\Http\Controllers\Controller;
use App\Models\Admin\Modifier;
use App\Models\Admin\Offering;
use App\Models\Admin\Product;
use App\Models\Admin\ProductCategory;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Session;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Transaction;

class ProductController extends Controller
{
    public function index()
    {
        $sliders = DB::table('sliders')->where('page','shop')->get();
        $g_setting = DB::table('general_settings')->where('id', 1)->first();
        $shop = DB::table('page_shop_items')->where('id', 1)->first();
        // $products = DB::table('products')->orderBy('product_order', 'asc')->where('product_status', 'Show')->get();
        $products = Product::with(['variant', 'modifiers'])->orderBy('product_order', 'asc')->where('product_status', 'Show')->get();
        $categories = ProductCategory::all();
        $is_shop=true;
        $services = Offering::all();
        return view('pages.shop', compact('shop','g_setting','products', 'categories', 'sliders','is_shop', 'services'));
    }


    public function detail($slug)
    {
        $g_setting = DB::table('general_settings')->where('id', 1)->first();
        $product_detail = DB::table('products')->where('product_slug', $slug)->first();
        if(!$product_detail) {
            return abort(404);
        }
        return view('pages.product_detail', compact('g_setting','product_detail'));
    }

    public function add_to_cart(Request $request)
    {
        $product_id = $request->input('product_id');
        $product_count = $request->input('product_count');
        $variant = $request->input('variant');
        $modifiers = $request->get('products_modifiers', []);

        // Handle variant
        if ($variant) {
            $product_id = $product_id . '--' . $variant;
        }

        // Check if items available in stock or not
        $product = Product::findOrFail($product_id);
        if(!$this->check_if_stock_available($product, $product_count)) {
            return redirect()->back()->with('error', 'Sorry! There are only '.$product->product_stock.' item(s) in stock');
        }

        // Add products according to count
        for ($i = 0; $i < $product_count; $i++) {
            session()->push('cart_product_id', $product_id);
            session()->push('cart_product_qty', 1);
            session()->push('cart_modifier_id' , $modifiers);
        }

        return redirect()->back()->with('success', 'Item(s) are added to the cart successfully!');
    }

    private function check_if_stock_available(Product $product, $count)
    {
        // Check if cart is empty
        if (!(Session::has('cart_product_id') && Session::has('cart_product_id'))) {
            return true;
        }

        // Calculate total quantity of given product either with variant or not
        $product_qtys = Session::get('cart_product_qty');
        $cart_product_total_qty = 0;

        foreach (Session::get('cart_product_id') as $index => $value) {
            // Handle variant if exists
            $product_arr = explode("--", $value);
            $session_product_id = isset($product_arr[0]) ? $product_arr[0] : $value;

            if ($product->id == $session_product_id) {
                $cart_product_total_qty += $product_qtys[$index];
            }
        }

        return $product->product_stock >= $cart_product_total_qty + $count;
    }

    public function cart()
    {
        $g_setting = DB::table('general_settings')->where('id', 1)->first();
        $modifiers = Modifier::all();
        $selected_modifiers = $modifiers->whereIn('id', session()->get('modifiers_added', []))->all();
        return view('pages.cart', compact('g_setting', 'modifiers', 'selected_modifiers'));
    }

    public function cart_item_delete($id, $index)
    {
        // Remove product ID
        $cart_product_id = session()->get('cart_product_id');
        if (array_key_exists($index, $cart_product_id)) {
            unset($cart_product_id[$index]);
            $cart_product_id = array_values($cart_product_id);

            // Handle general modifiers for empty cart
            if (count($cart_product_id) < 1) {
                Session::forget(['modifiers_added', 'modifiers_qtys', 'cart_product_id']);
            } else {
                Session::put('cart_product_id', $cart_product_id);
            }
        }
        // Remove product qty
        $cart_product_qty = session()->get('cart_product_qty');
        if (array_key_exists($index, $cart_product_qty)) {
            unset($cart_product_qty[$index]);
            $cart_product_qty = array_values($cart_product_qty);

            if (count($cart_product_qty) < 1) {
                Session::forget('cart_product_qty');
            } else {
                Session::put('cart_product_qty', $cart_product_qty);
            }
        }
        // Remove modifier ID array
        $cart_modifier_id = session()->get('cart_modifier_id');
        if (array_key_exists($index, $cart_modifier_id)) {
            unset($cart_modifier_id[$index]);
            $cart_modifier_id = array_values($cart_modifier_id);

            if (count($cart_modifier_id) < 1) {
                Session::forget('cart_modifier_id');
            } else {
                Session::put('cart_modifier_id', $cart_product_qty);
            }
        }

        Session::save();

        return redirect()->back()->with('success', 'Item is deleted from the cart successfully!');
    }

    public function update_cart(Request $request)
    {
        $error_flag = false;
        $data = $request->validate([
            'product_id' => 'required|array',
            'product_qty' => 'required|array',
            'products_modifiers' => 'sometimes|array',
            'products_modifiers.*' => 'required|array',
        ]);

        $cart_product_qty = session()->get('cart_product_qty');
        $cart_modifier_id = session()->get('cart_modifier_id');

        foreach(session()->get('cart_product_id') as $key => $value) {
            $product_arr = explode("--", $value);
            $session_product_id = isset($product_arr[0]) ? $product_arr[0] : $value;
            $product = Product::findOrFail($session_product_id);

            // Handle quantity w.r.t stock availibility
            $total_qty = $this->get_cart_product_qty_difference($session_product_id, $data['product_qty']);
            if($total_qty > $product->product_stock) {
                $error_flag = true;
            } else {
                $cart_product_qty[$key] = $data['product_qty'][$key];
                Session::put('cart_product_qty', $cart_product_qty);
            }

            // Handle empty modifiers
            if (isset($data['products_modifiers'][$key])) {
                $cart_modifier_id[$key] = $data['products_modifiers'][$key];
            } else {
                $cart_modifier_id[$key] = array();
            }
        }

        Session::put('cart_modifier_id', $cart_modifier_id);

        if($error_flag) {
            return redirect()->back()->with('error', 'Those quantity will not be updated that are more than stock.');
        }

        return redirect()->back()->with('success', 'Cart is updated successfully!');
    }

    private function get_cart_product_qty_difference($product_id, $new_qty)
    {
        $cart_product_qty = Session::get('cart_product_qty');
        $difference = 0;
        $total = 0;

        foreach (Session::get('cart_product_id') as $key => $value) {
            $product_arr = explode("--", $value);
            $session_product_id = isset($product_arr[0]) ? $product_arr[0] : $value;

            if ($product_id == $session_product_id) {
                $total += $cart_product_qty[$key];
                $difference += $new_qty[$key] - $cart_product_qty[$key];
            }
        }

        return $difference + $total;
    }

    public function checkout()
    {
        if(!session()->get('cart_product_id'))
        {
            return redirect()->to('/');
        }
        $g_setting = DB::table('general_settings')->where('id', 1)->first();
        $shipping_data = DB::table('shippings')->orderBy('shipping_order', 'asc')->get();

        if(!session()->get('shipping_id'))
        {
            session()->put('shipping_id', 0);
            session()->put('shipping_cost', '0');
        }

        if(!session()->get('coupon_id'))
        {
            session()->put('coupon_id', 0);
            session()->put('coupon_code', '');
            session()->put('coupon_amount', '0');
        }

        return view('pages.checkout', compact('g_setting', 'shipping_data'));
    }

    public function shipping_update(Request $request)
    {
        $shipping_id = $request->input('shipping_id');
        $shipping_detail = DB::table('shippings')->where('id', $shipping_id)->first();

        session()->put('shipping_id', $shipping_id);
        session()->put('shipping_cost', $shipping_detail->shipping_cost);

        return redirect()->back()->with('success', 'Shipping method is selected successfully!');
    }

    public function coupon_update(Request $request)
    {
        $coupon_code = $request->input('coupon_code');
        $today = date('Y-m-d');

        $coupon_detail = DB::table('coupons')->where('coupon_code', $coupon_code)->first();
		if(!$coupon_detail) {
            return redirect()->back()->with('error', 'Wrong coupon code!');
        }

        $coupon_id = $coupon_detail->id;
        $coupon_discount = $coupon_detail->coupon_discount;
        $coupon_type = $coupon_detail->coupon_type;

        if($coupon_detail->coupon_existing_use == $coupon_detail->coupon_maximum_use) {
            return redirect()->back()->with('error', 'Coupon code is maximum time used!');
        }

        if($today < $coupon_detail->coupon_start_date) {
            return redirect()->back()->with('error', 'Date of this coupon code is not come yet!');
        }

        if($today > $coupon_detail->coupon_end_date) {
            return redirect()->back()->with('error', 'Date of this coupon code is expired!');
        }

        if($coupon_type== 'Percentage') {
            $arr['coupon_amount'] = (session()->get('subtotal') * $coupon_discount)/100;
        } else {
            $arr['coupon_amount'] = $coupon_discount;
        }

        session()->put('coupon_code', $coupon_code);
        session()->put('coupon_amount', $arr['coupon_amount']);
        session()->put('coupon_id', $coupon_id);

        if(!session()->get('shipping_cost')) {
            $temp1 = 0;
        } else {
            $temp1 = session()->get('shipping_cost');
        }

        $final_price = (session()->get('subtotal')+$temp1)-session()->get('coupon_amount');
	    $arr['final_price'] = $final_price;

        return redirect()->back()->with('success', 'Coupon is selected successfully!');
    }

    public function avail_offering(Request $request)
    {
        $data = $this->validate_offering($request);
        Session::put('offering', $data);
        return redirect()->route('front.checkout_offering')->with('success', 'Service is added successfully');
    }

    public function checkout_offering()
    {
        if (!Session::has('offering')) {
            return redirect()->route('front.shop')->with('error', 'No service is added yet');
        }

        $session_offering = Session::get('offering');
        $offering = Offering::findOrFail($session_offering['offering_id']);

        $final_price = $session_offering['rate_type'] == 'regular'
            ? $offering->regular_rate
            : $offering->appointed_rate;

        return view('pages.service_checkout', compact('offering', 'final_price', 'session_offering'));
    }

    public function update_offering(Request $request)
    {
        $data = $this->validate_offering($request);
        $data["appointment_date"] =  $data["rate_type"] == "appointed" ? $data["appointment_date"] : null;
        $data["appointment_time"] =  $data["rate_type"] == "appointed" ? $data["appointment_time"] : null;

        Session::put('offering', $data);
        return redirect()->back()->with('success', 'Service is updated successfully');
    }

    public function payment_offering_cash()
    {
        if (!Session::has('offering')) {
            return redirect()->route('front.shop')->with('error', 'No service is added yet');
        }

        $data = $this->setup_order("cash");
        DB::table('service_orders')->insert($data);

        Session::forget("offering");
        return redirect()->route('front.shop')->with('succes', 'Service order is placed successfully through cash!');
    }

    public function payment_offering_paypal()
     {
        if (!Session::has('offering')) {
            return redirect()->route('front.shop')->with('error', 'No service is added yet');
        }

        $data = $this->setup_order("paypal");

        $apiContext = new \PayPal\Rest\ApiContext(
            new \PayPal\Auth\OAuthTokenCredential(
                env('PAYPAL_CLIENT_ID'), // ClientID
                env('PAYPAL_SECRET_KEY') // ClientSecret
            )
        );

        $paymentId = request('paymentId');
        $payment = Payment::get($paymentId, $apiContext);
        $execution = new PaymentExecution();
        $execution->setPayerId(request('PayerID'));
        $transaction = new Transaction();
        $amount = new Amount();
        $details = new Details();
        $details->setShipping(0)->setTax(0)->setSubtotal($data["net_amount"]);
        $amount->setCurrency('USD');
        $amount->setTotal($data["net_amount"]);
        $amount->setDetails($details);
        $transaction->setAmount($amount);
        $execution->addTransaction($transaction);
        $result = $payment->execute($execution, $apiContext);

        if($result->state == 'approved') {
            $paid_amount = $result->transactions[0]->amount->total;
            $fee_amount  = $result->transactions[0]->related_resources[0]->sale->transaction_fee->value;
            $net_amount  = $paid_amount-$fee_amount;

            $data["paid_amount"] = $paid_amount;
            $data["net_amount"] = $net_amount;
            $data["fee_amount"] = $fee_amount;

            DB::table('service_orders')->insert($data);

            Session::forget("offering");
            return redirect()->route('front.shop')->with('succes', 'Service order is placed successfully through cash!');
        } else {
            return redirect()->back()->with('error', 'Something went wrong while proceeding paypal payment');
        }
    }

    private function validate_offering(Request $request)
    {
        return $request->validate([
            'offering_id' => 'required',
            'client_fname' => 'required|max:50',
            'client_lname' => 'required|max:50',
            'client_email' => 'required|email',
            'client_phone' => 'required|max:50',
            'rate_type' => 'required|in:regular,appointed',
            'appointment_date' => 'nullable|date|after_or_equal:today',
            'appointment_time' => 'nullable'
        ]);
    }

    private function setup_order($type)
    {
        $data = Session::get('offering');
        $offering = Offering::findOrFail($data['offering_id']);

        $data["is_appointed"] = $data["rate_type"] == "appointed";
        $data["offering_name"] = $offering->name;
        $data["net_amount"] = $data["rate_type"] == "appointed" ? $offering->appointed_rate : $offering->regular_rate;

        if ($type == "cash") {
            $data["payment_type"] = "cash";
            $data["paid_amount"] = $data["net_amount"];
            $data["fee_amount"] = 0;
        } else {
            $data["payment_type"] = "paypal";
        }

        $data["appointment_date"] =  $data["rate_type"] == "appointed" ? $data["appointment_date"] : null;
        $data["appointment_time"] =  $data["rate_type"] == "appointed" ? $data["appointment_time"] : null;
        $data["order_no"] =  uniqid();

        unset($data["rate_type"]);
        return $data;
    }
}
