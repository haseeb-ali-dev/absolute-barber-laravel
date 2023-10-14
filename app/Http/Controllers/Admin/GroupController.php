<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Group;
use App\Models\Admin\GroupContact;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

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

    public function contacts()
    {
        return view('admin.group.contacts.index')->with('groups', Group::withCount('contacts')->with('contacts')->get());
    }

    public function import_contacts(Request $request)
    {
        try {
            $request->validate([
                'file' => 'required|mimes:xlsx,xls',
                'group_id' => 'required',
            ]);

            $file = $request->file('file');
            $data = Excel::toArray(null, $file)[0];

            if (!empty($data)) {
                $this->validateAndRemoveHeader($data[0]);
                $validatedData = $this->filterValidData($data, $request);

                if (count($validatedData) > 0) {
                    $this->saveValidData($validatedData, $request);
                    return back()->with('success', 'Group Contacts Added successfully!');
                } else {
                    return back()->with('error', 'No valid data found in the file.');
                }
            } else {
                return back()->with('error', 'The file is empty or invalid.');
            }
        } catch (\Exception $e) {
            return back()->with('error', 'Something went wrong due to ' . $e->getMessage());
        }
    }

    private function validateAndRemoveHeader(array $header)
    {
        if (count($header) < 3 || $header[0] !== 'Name' || $header[1] !== 'Email' || $header[2] !== 'Number') {
            throw new \Exception('Invalid file format. Please make sure the file has the correct headers.');
        }
        unset($header); // Remove the header row
    }

    private function filterValidData(array $data, Request $request)
    {
        $validatedData = [];
        foreach ($data as $row) {
            if (count($row) >= 3 && !empty($row[0]) && !empty($row[1]) && !empty($row[2])) {
                $validatedData[] = $row;
            }
        }
        return $validatedData;
    }

    private function saveValidData(array $data, Request $request)
    {
        foreach ($data as $row) {
            $contact = new GroupContact;
            $contact->group_id = $request->get('group_id', null);
            $contact->name = $row[0];
            $contact->email = $row[1];
            $contact->phone = $row[2];
            $contact->save();
        }
    }
}
