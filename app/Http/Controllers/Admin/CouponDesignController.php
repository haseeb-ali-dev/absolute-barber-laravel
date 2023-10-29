<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Admin\CouponDesign;
use Illuminate\Http\Request;

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
        $data = $request->validate([
            'content' => 'required',
            'title' => 'required',
            'thumbnail' => 'sometimes|mimes:jpg,jpeg,png|max:5000'
        ]);
        if ($request->hasFile('thumbnail')) {
            $ext = $request->file('thumbnail')->extension();
            $final_name = 'thumbnail_' . time() . '.' . $ext;
            $request->file('thumbnail')->move(public_path('uploads'), $final_name);
            $data['thumbnail'] = $final_name;
        }
        CouponDesign::create($data);
        return redirect()->route('admin.coupon_design.index')->with('success', 'Coupon Design is created successfully!');
    }

    public function show(CouponDesign $couponDesign)
    {
        //
    }

    public function edit(CouponDesign $couponDesign)
    {
        
    }

    public function update(Request $request, CouponDesign $couponDesign)
    {
        //
    }

    public function destroy(CouponDesign $couponDesign)
    {
        //
    }
}
