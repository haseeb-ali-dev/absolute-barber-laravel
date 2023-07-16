<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\ExcelContact;
use App\Models\LandingPageContact;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use DB;
use Maatwebsite\Excel\Facades\Excel;

class CustomerController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index()
    {
        $customers = Customer::all();
        return view('admin.customer.index', compact('customers'));
    }

    public function compose_document(){
        $customers = Customer::all();
        $documents = DB::table('composed_documents')->get();
        return view('admin.customer.compose_document', compact('customers', 'documents'));
    }

    public function save_compose_document(Request $request)
    {
        $data = $request->validate([
            'id' => 'nullable',
            'title' => 'required|max:500',
            'message' => 'required|min:10',
        ]);
        DB::table('composed_documents')->updateOrInsert(['id' => $data['id']], ['message' => $data['message'], 'title' => $data['title']]);
        return back()->with('success', 'Message '. ($data['id'] ? 'updated' : 'added') . ' successfully!');
    }
    public function delete_compose_document($id)
    {
        DB::table('composed_documents')->where('id', $id)->delete();
        return back()->with('success', 'Message deleted successfully!');
    }
    public function landing_page_messages()
    {
        // dd('1');
        $customers = LandingPageContact::all();
        return view('admin.customer.landing', compact('customers'));
    }

    public function import_excel_contacts(){

        $customers = ExcelContact::all();
        return view('admin.excel.excel_import', compact('customers'));
    }

    public function excel_import(Request $request){
        $data = $request->validate([
            'file' => 'required',
        ]);


        $file = $request->file('file');

        $data = Excel::toArray([], $file)[0];


        $data = array_filter($data, function($row) {
            return !empty(array_filter($row, function($value) {
                return !is_null($value);
            }));
        });

        // Re-index the array
        $data = array_values($data);
        unset($data['0']);

        if(sizeof($data)>0){
            foreach ($data as $key => $value) {
                $to_save = new ExcelContact;
                $to_save->name=$value['0'];
                $to_save->email=$value['1'];
                $to_save->phone=$value['2'];

                $to_save->save();
            }
        }

        return back()->with('success', 'Contacts Added successfully!');
    }


    public function send_message(Request $request)
    {
       $customer = Customer::where('id', $request->id)->first();
       return redirect('https://wa.me/'.$customer->customer_phone.'?text='.$request->message);
    }

    public function detail($id)
    {
        $customer_detail = DB::table('customers')->where('id',$id)->first();
        return view('admin.customer.detail', compact('customer_detail'));
    }

    public function make_active($id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $data['customer_status'] = 'Active';
        DB::table('customers')->where('id',$id)->update($data);

        return redirect()->route('admin.customer.index')->with('success', 'Customer status is changed to active successfully!');
    }

    public function make_pending($id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $data['customer_status'] = 'Pending';
        DB::table('customers')->where('id',$id)->update($data);

        return redirect()->route('admin.customer.index')->with('success', 'Customer status is changed to pending successfully!');
    }

    public function destroy($id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        DB::table('customers')->where('id', $id)->delete();

        return Redirect()->back()->with('success', 'Customer is deleted successfully!');
    }

    public function excel_delete()
    {

        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        DB::table('excel_contacts')->truncate();

        return Redirect()->back()->with('success', 'All Contacts deleted successfully!');
    }


    public function landing_contacts_delete()
    {

        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        DB::table('landing_page_contacts')->truncate();

        return Redirect()->back()->with('success', 'All Contacts deleted successfully!');
    }

    public function updateLandingPageContact(Request $request, $id)
    {
        $data = $request->validate([
            'email' => 'required|email',
            'phone' => 'required|max:25',
            'name' => 'required|max:224',
        ]);

        DB::table('landing_page_contacts')->where('id', $id)->update($data);

        return back()->with('success', 'Contact updated successfully');
    }

    public function deleteLandingPageContact($id)
    {
        DB::table('landing_page_contacts')->where('id', $id)->delete();

        return back()->with('success', 'Contact deleted successfully');
    }

}
