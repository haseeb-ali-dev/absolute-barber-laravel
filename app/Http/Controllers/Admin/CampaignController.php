<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use App\Models\Admin\Campaign;
use App\Models\Admin\EmailTemplate;
use App\Models\Admin\Recipient;
use Illuminate\Http\Request;
use App\Mail\SendToRecipients;
use Illuminate\Support\Facades\Mail;
use App\Models\Admin\Subscriber;
use App\Models\LandingPageContact;
use App\Models\ExcelContact;
use Illuminate\Support\Facades\DB;
class CampaignController extends Controller
{
    public function index(Request $request)
    {
        $data = isset($request->status) ? Campaign::where('status', $request->status)->get() : Campaign::all();

        return view('admin.campaigns.index', compact('data'));
    }

    public function create()
    {
        $recipients = Recipient::pluck('name', 'id')->toArray();

        $templates = EmailTemplate::select('et_name', 'et_subject', 'id')->where('et_type', 'emailer')->get()->toArray();

        return view('admin.campaigns.create', compact('recipients', 'templates'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|max:500',
            'status' => 'required|max:500|in:draft,sent',
            'recipients_id' => 'required',
            'template_id' => 'required'
        ]);

        
        $campaign = Campaign::create($data);

        $campaign->recipients()->attach($data['recipients_id']);

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign is created successfully');
    }

    public function edit(Campaign $campaign)
    {   
        
        $recipients = Recipient::pluck('name', 'id')->toArray();

        $templates = EmailTemplate::select('et_name', 'et_subject', 'id')->where('et_type', 'emailer')->get()->toArray();
        $groups=DB::table('campaigns_recipients')
                    ->where('campaigns_id', $campaign->id)
                    ->get();    

        
        return view('admin.campaigns.edit')->with('data', $campaign)->with('recipients', $recipients)->with('templates', $templates)->with('groups', $groups);
    }

    public function update(Request $request, Campaign $campaign)
    {
        $data = $request->validate([
            'name' => 'required|max:500',
            'status' => 'required|max:500|in:draft,sent',
            // 'recipients_id' => 'required',
            'template_id' => 'required'
        ]);

        $campaign->update($data);

        // $campaign->recipients()->sync($data['recipients_id']);

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign is updated successfully');
    }

    public function destroy(Campaign $campaign)
    {
        $campaign->recipients()->detach();

        $campaign->delete();

        return redirect()->route('admin.campaign.index')->with('success', 'Campaign is deleted successfully');
    }

    public function send(Request $request, Campaign $campaign)
    {
        // try {

            $template = EmailTemplate::find($campaign->template_id);
            $subject = $template->et_subject;
            $message = $template->et_content;
           

            $groups=DB::table('campaigns_recipients')
            ->where('campaigns_id', $campaign->id)
            ->get();    
            
            foreach ($groups as  $group) {

                

                if($group->recipients_id=='recipients'){

                    $emails=DB::table('recipients')
                                ->get();

                    if (sizeof($emails) > 0) {

                        foreach ($emails as $row) {
        
                            $message = str_replace('[[recipient_name]]', $row->name, $message);
                            $message = str_replace('[[recipient_email]]', $row->email, $message);
                         
                            Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                        }
        
                        
                    }                
                              
                }


                if($group->recipients_id=='subscribers'){
                    
                    $emails=DB::table('subscribers')
                                ->get();
                  
                    if (sizeof($emails) > 0) {

                        foreach ($emails as $row) {
                            $message = str_replace('[[recipient_email]]', $row->subs_email, $message);
                            Mail::to($row->subs_email)->send(new SendToRecipients($subject, $message));
                        }
        
                       
                    }                
                              
                }
               


                if($group->recipients_id=='landing_page'){

                    $emails=DB::table('landing_page_contacts')
                                ->get();
                    

                    if (sizeof($emails) > 0) {

                        foreach ($emails as $row) {
                            $message = str_replace('[[recipient_name]]', $row->name, $message);
                            $message = str_replace('[[recipient_email]]', $row->email, $message);
                         
                            Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                        }
        
                        
                    }                
                              
                }

                if($group->recipients_id=='external_data'){

                    $emails=DB::table('excel_contacts')
                                ->get();
                    

                    if (sizeof($emails) > 0) {

                        foreach ($emails as $row) {
                            $message = str_replace('[[recipient_name]]', $row->name, $message);
                            $message = str_replace('[[recipient_email]]', $row->email, $message);
                         
                            Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                        }
        
                        
                    }                
                              
                }



            } //end foreach

            $campaign->update(['status' => 'sent']);
            return redirect()->back()->with('success', 'Campaign is started sending successfully');

            // if (sizeof($campaign->recipients) > 0) {

            //     foreach ($campaign->recipients as $row) {

            //         $message = str_replace('[[recipient_name]]', $row->name, $message);
            //         $message = str_replace('[[recipient_email]]', $row->email, $message);
            //         dd($message);
            //         Mail::to($row->email)->send(new SendToRecipients($subject, $message));
            //     }

            //     $campaign->update(['status' => 'sent']);
            // }

            // return redirect()->back()->with('success', 'Campaign is started sending successfully');

        // } catch (\Exception $e) {

        //     return redirect()->back()->with('error', 'Campaign is not working due to error ' . $e->getMessage());
        // }

    }

}
