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
    }

    public function store(Request $request)
    {
        //
    }

    public function show(CouponDesign $couponDesign)
    {
        //
    }

    public function edit(CouponDesign $couponDesign)
    {
        //
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
