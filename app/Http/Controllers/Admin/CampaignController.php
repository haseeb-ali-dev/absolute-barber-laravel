<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Admin\Campaign;
use App\Models\Admin\Recipient;
use Illuminate\Http\Request;

class CampaignController extends Controller
{
    public function index()
    {
        $data = Campaign::all();

        return view('admin.campaigns.index', compact('data'));
    }

    public function create()
    {
        $recipients = Recipient::pluck('name', 'id')->toArray();

        return view('admin.campaigns.create', compact('recipients'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:500',
            'status' => 'required|max:500|in:draft,sent,pending',
            'recipients_id' => 'required'
        ]);

        $campaign = Campaign::create($data);

        $campaign->recipients()->attach($data['recipients_id']);

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign is created successfully');
    }

    public function edit(Campaign $campaign)
    {
        $recipients = Recipient::pluck('name', 'id')->toArray();

        return view('admin.campaigns.edit')->with('data', $campaign)->with('recipients', $recipients);
    }

    public function update(Request $request, Campaign $campaign)
    {
        $data = $request->validate([
            'name' => 'required|max:500',
            'status' => 'required|max:500|in:draft,sent,pending',
            'recipients_id' => 'required'
        ]);

        $campaign->update($data);

        $campaign->recipients()->sync($data['recipients_id']);

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign is updated successfully');
    }

    public function destroy(Campaign $campaign)
    {

        $campaign->recipients()->detach();

        $campaign->delete();

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign is deleted successfully');
    }
}
