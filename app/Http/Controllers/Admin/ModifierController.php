<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Modifier;
use Illuminate\Http\Request;

class ModifierController extends Controller
{
    public function index()
    {
        $data = Modifier::all();
        return view('admin.product_modifier.index', compact('data'));
    }

    public function modifier_json()
    {
        $data = Modifier::all();
        return response()->json(['data' => $data, 'status' => 'success']);
    }

    public function create()
    {
        return view('admin.product_modifier.create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:225|unique:modifiers,name',
            'unit_price' => 'required|numeric',
            'thumbnail' => 'sometimes|mimes:png,jpg,jpeg'
        ]);
        Modifier::create($data);
        return redirect()->route('admin.modifier.index')->with('success', 'Modifier created successfully');
    }

    public function edit(Modifier $modifier)
    {
        return view('admin.product_modifier.edit', compact('modifier'));
    }

    public function update(Request $request, Modifier $modifier)
    {
        $data = $request->validate([
            'name' => 'required|max:225|unique:modifiers,name,' . $modifier->id,
            'unit_price' => 'required|numeric',
            'thumbnail' => 'sometimes|mimes:png,jpg,jpeg'
        ]);
        $modifier->update($data);
        return redirect()->route('admin.modifier.index')->with('success', 'Modifier updated successfully');
    }

    public function destroy(Modifier $modifier)
    {
        // Delete file before delete
        if ($modifier->thumbnail) {
            $file_path = public_path('uploads/') . $modifier->thumbnail;
            unlink($file_path);
        }
        $modifier->delete();
        return back()->with('success', 'Modifier deleted successfully');
    }
}