<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Admin\CouponDesign;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class CouponDesignController extends Controller
{
    public function index()
    {
        $designs = CouponDesign::unmodified()->get();
        $modified_designs = CouponDesign::modified()->get();
        return view('admin.coupon_design.index', compact('designs', 'modified_designs'));
    }

    public function create()
    {
        return view('admin.coupon_design.create');
    }

    public function store(Request $request)
    {
        if (env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }
        $data = $this->request_validate($request);
        if ($request->hasFile('thumbnail')) {
            $data['thumbnail'] = $this->upload_thumbnail($request);
        }
        CouponDesign::create($data);
        return redirect()->route('admin.coupon_design.index')->with('success', 'Coupon Design is created successfully!');
    }

    public function show($id)
    {
        try {
            $decrypted = Crypt::decrypt($id);
            $coupon = CouponDesign::find($decrypted);
            return view('admin.coupon_design.show', compact('coupon'));
        } catch (Exception $e) {
            return abort(404, $e->getMessage());
        }
    }

    public function edit(CouponDesign $couponDesign)
    {
        return view('admin.coupon_design.edit')->with('design', $couponDesign);
    }

    public function update(Request $request, CouponDesign $couponDesign)
    {
        if (env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }
        $data = $this->request_validate($request);
        if ($request->hasFile('thumbnail')) {
            $data['thumbnail'] = $this->upload_thumbnail($request);
        }
        $couponDesign->update($data);
        return redirect()->route('admin.coupon_design.index')->with('success', 'Coupon Design is updated successfully!');
    }

    public function destroy(CouponDesign $couponDesign)
    {
        $couponDesign->delete();
        return redirect()->route('admin.coupon_design.index')->with('success', 'Coupon Design is deleted successfully!');
    }

    public function modify(CouponDesign $couponDesign)
    {
        return view('admin.coupon_design.modify')->with('design', $couponDesign);
    }

    public function store_modified(Request $request, CouponDesign $couponDesign)
    {
        if (env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }
        $data = $this->request_validate($request);

        $newCouponDesign = $couponDesign->replicate();
        $newCouponDesign->content = $data['content'];
        $newCouponDesign->title = $data['title'];
        $newCouponDesign->modified_by = session('id');
        $newCouponDesign->expired_at = $data['expired_at'];
        $newCouponDesign->save();

        return redirect()->route('admin.coupon_design.index')->with('success', 'Coupon Design is saved as your design successfully!');
    }

    private function request_validate(Request $request)
    {
        $data = $request->validate([
            'content' => 'required',
            'title' => 'required',
            'thumbnail' => 'sometimes|mimes:jpg,jpeg,png|max:5000',
            'expired_at' => 'sometimes|date'
        ]);
        return $data;
    }
    private function upload_thumbnail(Request $request)
    {
        $ext = $request->file('thumbnail')->extension();
        $final_name = 'thumbnail_' . time() . '.' . $ext;
        $request->file('thumbnail')->move(public_path('uploads'), $final_name);
        return $final_name;
    }
}
