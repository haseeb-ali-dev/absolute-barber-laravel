<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Admin\Recipient;
use App\Models\Admin\Tag;
use Illuminate\Http\Request;

class RecipientController extends Controller
{

    public function index()
    {
        $data = Recipient::with('tags')->get();

        return view('admin.recipients.index', compact('data'));
    }

    public function create()
    {
        $tags = Tag::pluck('name', 'id')->toArray();

        return view('admin.recipients.create', compact('tags'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:500',
            'email' => 'required|max:500|unique:recipients,email',
            'tag_ids' => 'required'
        ]);

        $recipient = Recipient::create($data);

        $recipient->tags()->attach($data['tag_ids']);

        return redirect()->route('admin.recipient.index')->with('success', 'Recipient is created successfully');
    }

    public function edit(Recipient $recipient)
    {
        $tags = Tag::pluck('name', 'id')->toArray();

        return view('admin.recipients.edit')->with('data', $recipient)->with('tags', $tags);
    }

    public function update(Request $request, Recipient $recipient)
    {
        $data = $request->validate([
            'name' => 'required|max:500',
            'email' => 'required|max:500|unique:recipients,email,' . $recipient->id,
            'tag_ids' => 'required'
        ]);

        $recipient->update($data);

        $recipient->tags()->sync($data['tag_ids']);

        return redirect()->route('admin.recipient.index')->with('success', 'Recipient is updated successfully');
    }

    public function destroy(Recipient $recipient)
    {
        $recipient->tags()->detach();
        $recipient->campaigns()->detach();

        $recipient->delete();

        return redirect()->route('admin.recipient.index')->with('success', 'Recipient is deleted successfully');
    }
}
