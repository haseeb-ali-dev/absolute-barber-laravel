<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Offering;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

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
}
