<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Status;
use Illuminate\Http\Request;

class StatusController extends Controller
{
    public function index()
    {
        $data = Status::active()->get();
        return view('admin.status.index', compact('data'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required|max:250|unique:status,title',
        ]);

        Status::create($data);

        return back()->with('success', 'Status is created successfully!');
    }

    public function update(Request $request, Status $status)
    {
        $data = $request->validate([
            'title' => 'required|max:250|unique:status,title,' . $status->id,
        ]);

        $status->update($data);

        return back()->with('success', 'Status is updated successfully!');
    }

    public function destroy(Status $status)
    {
        $status->deleteOrFail();

        return back()->with('success', 'Status is deleted successfully!');
    }
}
