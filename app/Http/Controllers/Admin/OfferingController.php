<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\GeneralSetting;
use App\Models\Admin\Offering;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use DB;

class OfferingController extends Controller
{
    public function index()
    {
        $offerings = Offering::all();
        return view('admin.offering.index', compact('offerings'));
    }

    public function create()
    {
        return view('admin.offering.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|unique:offerings',
            'regular_rate' => 'required|numeric',
            'appointed_rate' => 'required|numeric',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'details' => 'nullable|string',
            'is_active' => 'sometimes',
        ]);

        $data['is_active'] = isset($data['is_active']) ? 1 : 0;

        Offering::create($data);

        return redirect()->route('admin.offering.index')
            ->with('success', 'Offering created successfully');
    }

    public function show($id)
    {
        $offering = Offering::findOrFail($id);
        return view('admin.offering.show', compact('offering'));
    }

    public function edit($id)
    {
        $offering = Offering::findOrFail($id);
        return view('admin.offering.edit', compact('offering'));
    }

    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'name' => 'required|string|unique:offerings,name,' . $id,
            'regular_rate' => 'required|numeric',
            'appointed_rate' => 'required|numeric',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'details' => 'nullable|string',
            'is_active' => 'sometimes',
        ]);

        $data['is_active'] = isset($data['is_active']) ? 1 : 0;

        $offering = Offering::findOrFail($id);
        $offering->update($data);

        return redirect()->route('admin.offering.index')
            ->with('success', 'Offering updated successfully');
    }

    public function destroy($id)
    {
        $offering = Offering::findOrFail($id);

        $this->removePhoto($offering->photo);

        $offering->delete();

        return redirect()->route('admin.offering.index')
            ->with('success', 'Offering deleted successfully');
    }

    protected function removePhoto($photoFileName)
    {
        if (!empty($photoFileName)) {
            $photoPath = public_path('uploads/') . $photoFileName;

            if (File::exists($photoPath)) {
                File::delete($photoPath);
            }
        }
    }

    public function orders()
    {
        $orders = DB::table('service_orders')->orderBy("id", "DESC")->get();
        return view('admin.offering.orders', compact('orders'));
    }

    public function settings()
    {
        // Payment Modes
        $settings['regular_modes'] = DB::table('service_payment_modes')->where('service_type', 'regular')->get();
        $settings['appointment_modes'] = DB::table('service_payment_modes')->where('service_type', 'appointed')->get();

        return view('admin.offering.settings', compact('settings'));
    }

    public function update_settings(Request $request, $type)
    {
        if ($type == "payment_modes") {
            $this->update_payment_modes($request);
            return back()->with('success', 'Setting Payment Modes are updated successfully!');

        } else if ($type == "timings") {
            $this->update_timings($request);
            return back()->with('success', 'Setting Shop Timings are updated successfully!');

        } else {
            return back()->with('error', 'This is invalid type of Setting');
        }
    }

    private function update_payment_modes(Request $request)
    {
        $ids = $request->get("payment_mode_ids", []);
        DB::table('service_payment_modes')->whereNotIn('id', $ids)->update(['enabled' => 0]);
        DB::table('service_payment_modes')->whereIn('id', $ids)->update(['enabled' => 1]);
    }

    private function update_timings(Request $request)
    {
        $data = $request->validate([
            'shop_open_time' => 'required|date_format:H:i',
            'shop_close_time' => 'required|date_format:H:i|after:shop_open_time',
            'shop_service_interval' => 'required|min:1|max:59'
        ], [
            'shop_close_time.after' => 'The closing time must be greater than the opening time.',
        ]);
        GeneralSetting::find(1)->update($data);
    }
}
