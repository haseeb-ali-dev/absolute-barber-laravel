<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Group;
use Illuminate\Http\Request;

class GroupController extends Controller
{
    public function index()
    {
        return view('admin.group.index')->with('groups', Group::withCount('contacts')->get());
    }

    public function store(Request $request)
    {
        $data = $request->validate(['name' => 'required|max:255', 'detail' => 'sometimes']);

        Group::create($data);

        return back()->with('success', 'Group added successfully!');
    }

    public function update(Request $request, Group $group)
    {
        $data = $request->validate(['name' => 'required|max:255', 'detail' => 'sometimes']);

        $group->update($data);

        return back()->with('success', 'Group updated successfully!');
    }

    public function destroy(Group $group)
    {
        $group->delete();

        return back()->with('success', 'Group and its contacts deleted successfully!');
    }
}
