<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\EmailTemplate;
use App\Models\Admin\Group;
use Illuminate\Http\Request;
use DB;
use App\Mail\SendToRecipients;
use Illuminate\Support\Facades\Mail;

class EmailTemplateController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index(Request $request)
    {
        $query = EmailTemplate::orderBy('id');

        $email_template = isset($request->et_type) ? $query->where('et_type', 'emailer')->get() : $query->where('et_type', null)->get();

        return view('admin.email_template.index', compact('email_template'));
    }

    public function edit($id)
    {
        $email_template = EmailTemplate::findOrFail($id);

        return view('admin.email_template.edit', compact('email_template', 'id'));
    }

    public function update(Request $request, $id)
    {
        if (env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $email_template = EmailTemplate::findOrFail($id);
        $data = $request->only($email_template->getFillable());

        $request->validate([
            'et_name' => 'required',
            'et_subject' => 'required',
            'et_content' => 'required',
            'thumbnail' => 'sometimes|mimes:jpg,jpeg,png|max:5000'
        ]);

        if ($request->hasFile('thumbnail')) {
            $ext = $request->file('thumbnail')->extension();
            $final_name = 'thumbnail_' . time() . '.' . $ext;
            $request->file('thumbnail')->move(public_path('uploads'), $final_name);
            $data['thumbnail'] = $final_name;
        }

        $email_template->fill($data)->save();

        if (session('is_super') == 1) {
            return redirect()->route('admin.email_template.gallery')->with('success', 'Email Template is created successfully!');

        } else {
            $params = isset($email_template->et_type) ? ['et_type' => $email_template->et_type] : null;

            return redirect()->route('admin.email_template.index', $params)->with('success', 'Email Template is updated successfully!');
        }
    }

    public function create()
    {
        return view('admin.email_template.create');
    }

    public function store(Request $request)
    {
        if (env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $email_template = new EmailTemplate;
        $data = $request->only($email_template->getFillable());

        $request->validate([
            'et_subject' => 'required',
            'et_content' => 'required',
            'et_name' => 'required',
            'thumbnail' => 'sometimes|mimes:jpg,jpeg,png|max:5000'
        ]);

        $data['et_type'] = 'emailer';

        if ($request->hasFile('thumbnail')) {
            $ext = $request->file('thumbnail')->extension();
            $final_name = 'thumbnail_' . time() . '.' . $ext;
            $request->file('thumbnail')->move(public_path('uploads'), $final_name);
            $data['thumbnail'] = $final_name;
        }

        $email_template->fill($data)->save();

        if (session('is_super') == 1) {
            return redirect()->route('admin.email_template.gallery')->with('success', 'Email Template is created successfully!');
        } else {
            return redirect()->route('admin.email_template.index', ['et_type' => 'emailer'])->with('success', 'Email Template is created successfully!');
        }
    }

    public function gallery()
    {
        $templates = EmailTemplate::unmodified()->get();
        $modified_templates = EmailTemplate::modified()->get();
        return view('admin.email_template.gallery', compact('templates', 'modified_templates'));
    }

    public function select($template_id)
    {
        $template = EmailTemplate::findOrFail($template_id);
        $custom_groups = Group::pluck('name', 'id')->toArray();
        return view('admin.email_template.select', compact('template', 'custom_groups'));
    }

    public function send(Request $request)
    {
        $request->validate([
            'et_name' => 'required',
            'et_subject' => 'required',
            'et_content' => 'required',
            'recipients_id' => 'required|array',
            'ref_template_id' => 'required',
            'modified' => 'sometimes'
        ]);

        $name = $request->et_name;
        $subject = $request->et_subject;
        $message = $request->et_content;
        $groups = $request->recipients_id;
        $errors = [];
        $total = 0;
        $successful = 0;
        $failed = 0;
        $fixed_groups = ['recipients', 'subscribers', 'landing_page', 'external_data'];

        foreach ($groups as $group) {
            try {
                if ($group == 'recipients') {
                    $emails = DB::table('recipients')->get();

                    if (sizeof($emails) > 0) {
                        foreach ($emails as $row) {
                            try {
                                $message = str_replace('[[recipient_name]]', $row->name, $message);
                                $message = str_replace('[[recipient_email]]', $row->email, $message);
                                Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                                $successful++;
                            } catch (\Exception $e) {
                                $errors[] = "Error sending email to recipient {$row->email}: " . $e->getMessage();
                                $failed++;
                            }
                        }
                    }
                }
                if ($group == 'subscribers') {
                    $emails = DB::table('subscribers')->get();

                    if (sizeof($emails) > 0) {
                        foreach ($emails as $row) {
                            try {
                                $message = str_replace('[[recipient_email]]', $row->subs_email, $message);
                                Mail::to($row->subs_email)->send(new SendToRecipients($subject, $message));
                                $successful++;
                            } catch (\Exception $e) {
                                $errors[] = "Error sending email to recipient {$row->subs_email}: " . $e->getMessage();
                                $failed++;
                            }
                        }
                    }
                }
                if ($group == 'landing_page') {
                    if (session()->has('landing_page_customer_ids')) {
                        $customer_ids = session()->get('landing_page_customer_ids', []);
                        $emails = DB::table('landing_page_contacts')->whereIn('id', $customer_ids)->get();
                    } else {
                        $emails = DB::table('landing_page_contacts')->get();
                    }

                    if (sizeof($emails) > 0) {
                        foreach ($emails as $row) {
                            try {
                                $message = str_replace('[[recipient_name]]', $row->name, $message);
                                $message = str_replace('[[recipient_email]]', $row->email, $message);
                                Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                                $successful++;
                            } catch (\Exception $e) {
                                $errors[] = "Error sending email to recipient {$row->email}: " . $e->getMessage();
                                $failed++;
                            }
                        }
                    }
                }
                if ($group == 'external_data') {
                    $emails = DB::table('excel_contacts')->get();

                    if (sizeof($emails) > 0) {
                        foreach ($emails as $row) {
                            try {
                                $message = str_replace('[[recipient_name]]', $row->name, $message);
                                $message = str_replace('[[recipient_email]]', $row->email, $message);
                                Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                                $successful++;
                            } catch (\Exception $e) {
                                $errors[] = "Error sending email to recipient {$row->email}: " . $e->getMessage();
                                $failed++;
                            }
                        }
                    }
                }
                if (!in_array($group, $fixed_groups)) {
                    $emails = DB::table('group_contacts')->where('group_id', $group)->get();

                    if (sizeof($emails) > 0) {
                        foreach ($emails as $row) {
                            try {
                                $message = str_replace('[[recipient_name]]', $row->name, $message);
                                $message = str_replace('[[recipient_email]]', $row->email, $message);
                                Mail::to($row->email)->send(new SendToRecipients($subject, $message));
                                $successful++;
                            } catch (\Exception $e) {
                                $errors[] = "Error sending email to recipient {$row->email}: " . $e->getMessage();
                                $failed++;
                            }
                        }
                    }
                }
            } catch (\Exception $e) {
                $errors[] = "Error processing group {$group}: " . $e->getMessage();
            }
        }
        $total = $successful + $failed;

        try {
            $custom_groups = Group::whereIn('id', $groups)->pluck('name')->toArray();

            $default_groups = array_filter($groups, function ($value) use ($fixed_groups) {
                return in_array($value, $fixed_groups);
            });

            $groups = array_merge($default_groups, $custom_groups);

            DB::table('sent_emails')->insert([
                'subject' => $subject,
                'message' => $message,
                'groups' => implode(",", $groups),
                'ref_template_id' => $request->ref_template_id,
                'total_sent' => $total,
                'successful' => $successful,
                'failed' => $failed,
                'module' => 'direct'
            ]);

            if (isset($request['modified']) && $request['modified'] == 'on') {
                $this->save_as_template($request->get('ref_template_id'), $message, $name);
            }

        } catch (\Exception $e) {
            $errors[] = "Error saving record in database: " . $e->getMessage();
        }

        if (!empty($errors)) {
            return redirect()->route('admin.email_template.gallery')->with('error', "After sending {$total} emails, these are some errors enlisted as: " . implode("<br>", $errors));
        }

        if (session()->has('landing_page_customer_ids')) {
            session()->forget('landing_page_customer_ids');

            return redirect()->route('landingpages.index')->with('success', "{$total} Emails are sent successfully to customers");
        } else {
            return redirect()->route('admin.email_template.gallery')->with('success', "{$total} Emails are sent successfully");
        }

    }
    public function delete($id)
    {
        $email_template = EmailTemplate::findOrFail($id);
        if ($email_template) {
            $email_template->delete();
        }
        return redirect()->route('admin.email_template.gallery')->with('info', "Template is deleted successfully");
    }

    private function save_as_template($id, $new_content, $new_name)
    {
        $previous_template = EmailTemplate::find($id);
        if ($previous_template) {
            $new_template = $previous_template->replicate();
            $new_template->et_content = $new_content;
            $new_template->et_name = $new_name;
            $new_template->modified_by = session('id');
            $new_template->save();
        }
    }

    public function preview(EmailTemplate $template)
    {
        return view('admin.email_template.preview', compact('template'));
    }

    public function reports()
    {
        $modules_hash = ['campaign' => 'Campaigns', 'direct' => 'Direct Sent Emails'];

        $reports = DB::table('sent_emails')->selectRaw('module, SUM(total_sent) as total, SUM(successful) as successful, SUM(failed) as failed')->groupBy('module')->get();

        $reports = $reports->filter(function ($report) use ($modules_hash) {
            $report->module = $modules_hash[$report->module];
            return $report;
        });

        return view('admin.reports.index', compact('reports'));
    }

}
