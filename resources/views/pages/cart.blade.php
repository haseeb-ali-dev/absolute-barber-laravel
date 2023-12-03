@extends('layouts.app')

@section('content')
    {{-- <div class="page-banner" style="background-image: url({{ asset('public/uploads/'.$g_setting->banner_cart) }})">
        <div class="bg-page"></div>
        <div class="text">
            <h1>Cart</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cart</li>
                </ol>
            </nav>
        </div>
    </div> --}}

    <div class="page-content pt_50 pb_60">
        <div class="container">
            <div class="row cart">
                <div class="col-md-12">
                    @if(Session::has('cart_product_id'))
                    <form action="{{ url('cart/update') }}" method="post">
                        @csrf
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr class="table-info">
                                    <th>Serial</th>
                                    <th>Thumbnail</th>
                                    <th>Product Name</th>
                                    <th>Product Variant</th>
                                    <th>Unit Price</th>
                                    <th>Quantity</th>
                                    <th>Subtotal</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php
                                    $value = '';
                                    $itm = '';
                                    $arr_cart_product_id = array();
                                    $arr_cart_product_qty = array();
                                    $subtotal = 0;
                                @endphp
                                @php $i=0 @endphp
                                @foreach(Session::get('cart_product_id') as $value)
                                    @php
                                        $i++;
                                        $arr_cart_product_id[$i] = $value;
                                    @endphp
                                @endforeach

                                @php $i=0 @endphp
                                @foreach(Session::get('cart_product_qty') as $value)
                                    @php
                                        $i++;
                                        $arr_cart_product_qty[$i] = $value;
                                    @endphp
                                @endforeach
                                @php $tot1 = 0 @endphp
                                @for($i=1;$i<=count($arr_cart_product_id);$i++)

                                    @php
                                        $product_arr = explode("--", $arr_cart_product_id[$i]);
                                        $variant = isset($product_arr[1]) ? $product_arr[1] : null;
                                        $all_data = DB::table('products')->where('id', $product_arr[0])->get();
                                    @endphp

                                    @foreach ($all_data as $itm)
                                        @php
                                            $product_name = $itm->product_name;
                                            $product_slug = $itm->product_slug;
                                            $variant_options = json_decode($itm->variant_options, true);
                                            $variant_existed = isset($variant_options[$variant]);
                                            $product_current_price = isset($variant) && isset($variant_options) && $variant_existed
                                                ? $variant_options[$variant]
                                                : $itm->product_current_price;
                                            $product_featured_photo = $itm->product_featured_photo;
                                        @endphp
                                    @endforeach

                                    <input type="hidden" name="product_id[]" value="{{ $arr_cart_product_id[$i] }}">
                                    <tr>
                                        <td class="align-middle">{{ $i }}</td>
                                        <td class="align-middle"><img src="{{ asset('public/uploads/'.$product_featured_photo) }}"></td>
                                        <td class="align-middle">
                                            <a href="{{ url('product/'.$product_slug) }}">{{ $product_name }}</a>
                                        </td>
                                        <td class="align-middle">{{ isset($variant) && $variant_existed ? $variant : '-' }}</td>
                                        <td class="align-middle">USD {{ $product_current_price }}</td>
                                        <td class="align-middle">
                                            <input type="number" class="form-control" name="product_qty[]" step="1" min="1" max="" pattern="" pattern="[0-9]*" inputmode="numeric" value="{{ $arr_cart_product_qty[$i] }}">
                                        </td>
                                        <td class="align-middle">
                                            USD {{ $subtotal = $product_current_price * $arr_cart_product_qty[$i] }}
                                        </td>
                                        <td class="align-middle">
                                        <a href="{{ url('cart/delete/'.$arr_cart_product_id[$i]) }}" class="cart_button_arefin btn btn-xs btn-danger" onClick="return confirm('Are you sure?');"><i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>

                                    @php $tot1 = $tot1 + $subtotal; @endphp
                                @endfor

                                @php
                                    $session_modifiers = Session::get('modifiers_added', []);
                                    $total_price = 0.0;
                                @endphp
                                @if (count($session_modifiers) > 0)
                                    @php
                                        $query = DB::table('modifiers')->whereIn('id', $session_modifiers);
                                        $data = isset($query) ? $query->get() : [];
                                        $total_price = isset($query) ? $query->sum('unit_price') : 0.0;
                                    @endphp
                                    <tr>
                                        <td colspan="2" class="text-right h5">Modifiers: </td>
                                        <td colspan="4">
                                            @foreach ($data as $row)
                                                <span>{{ $row->name }} (USD {{ $row->unit_price }})
                                                    @if (!$loop->last)
                                                        <span class="px-2 h4">||</span>
                                                    @endif
                                                </span>
                                            @endforeach
                                        </td>
                                        <td>USD <span class="update_subtotal h4">{{ $total_price }}</span></td>
                                    </tr>
                                @endif

                                <tr>
                                    <td colspan="5" class="text-right">Total: </td>
                                    <td colspan="2">USD <span class="update_subtotal">{{ $tot1 + $total_price }}</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="cart-buttons">
                                <a href="#add_modifier" data-toggle="modal" class="btn btn-info btn-arf">
                                    <i class="far fa-star"></i>
                                    Please Add {{ count($session_modifiers) > 0 ? 'More' : '' }} Modifiers <i class="far fa-star"></i>
                                </a>
                            </div>
                            <div class="cart-buttons">
                                <a href="{{ route('front.shop') }}" class="btn btn-info btn-arf">Continue Shopping</a>
                                <input type="submit" value="Update Cart" class="btn btn-info btn-arf" name="form1">
                                <a href="{{ route('front.checkout') }}" class="btn btn-info btn-arf">Checkout</a>
                            </div>
                        </div>
                    </form>
                    @includeIf('pages.add_modifer', ['modifiers' => $modifiers, 'session_modifiers' => $session_modifiers])
                    @else
                        Cart is empty!
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
