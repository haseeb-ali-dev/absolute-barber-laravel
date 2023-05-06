<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\ExcelContact;
use App\Models\LandingPageContact;
use Twilio\Rest\Client;
class TwillioController extends Controller
{
    public function admin_manual_messages(){

        return view('admin.manual.index');
    }

    public function send_customers_sms_action(Request $request)
    {


        $count=0;
            $data = $request->validate([
                'customer_ids' => 'required',
                'message' => 'required',
            ]);
            $customersIds = explode(",", $data['customer_ids']);
            if (count($customersIds) <= 0) {
                return back()->with('error', 'No customer selected to send message!');
            } else {


                $customers = Customer::whereIn('id', $customersIds)->get();
                $message1 = $request->message;
                foreach($customers as $row)
                {

                    // Your Account SID and Auth Token from twilio.com/console
                    $account_sid = env('TWILIO_ACCOUNT_SID');
                    $auth_token = env('TWILIO_AUTH_TOKEN');
                    // Your Twilio phone number
                    $twilio_number = env('TWILIO_PHONE_NUMBER');
                    // Recipient's phone number
                    $recipient_number = $row->customer_phone;
                    // Message body
                    $message_body = $message1;
                    // Create a Twilio client
                    $twilio = new Client($account_sid, $auth_token);

                    // Send the message
                    $message = $twilio->messages->create(
                        $recipient_number, // recipient's phone number
                        array(
                            'from' => $twilio_number, // your Twilio phone number
                            'body' => $message_body // message body
                        )
                    );

                    $count++;
                }

                DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['sms' => DB::raw('sms +' . $count)]);

                return back()->with('success', $count.' '.'Promotion SMS are sent successfully!');

            }

    }

    public function send_customers_sms_action_landing(Request $request)
    {


        $count=0;
            $data = $request->validate([
                'customer_ids' => 'required',
                'message' => 'required',
            ]);
            $customersIds = explode(",", $data['customer_ids']);
            if (count($customersIds) <= 0) {
                return back()->with('error', 'No customer selected to send message!');
            } else {


                $customers = LandingPageContact::whereIn('id', $customersIds)->get();
                $message1 = $request->message;
                foreach($customers as $row)
                {

                    // Your Account SID and Auth Token from twilio.com/console
                    $account_sid = env('TWILIO_ACCOUNT_SID');
                    $auth_token = env('TWILIO_AUTH_TOKEN');
                    // Your Twilio phone number
                    $twilio_number = env('TWILIO_PHONE_NUMBER');
                    // Recipient's phone number
                    $recipient_number = $row->phone;
                    // Message body
                    $message_body = $message1;
                    // Create a Twilio client
                    $twilio = new Client($account_sid, $auth_token);

                    // Send the message
                    $message = $twilio->messages->create(
                        $recipient_number, // recipient's phone number
                        array(
                            'from' => $twilio_number, // your Twilio phone number
                            'body' => $message_body // message body
                        )
                    );

                    $count++;
                }

                DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['sms' => DB::raw('sms +' . $count)]);

                return back()->with('success', $count.' '.'Promotion SMS are sent successfully!');

            }

    }


    public function admin_manual_sms(Request $request)
    {
            $data = $request->validate([
                'to' => 'required',
                'message' => 'required',
            ]);
            // Your Account SID and Auth Token from twilio.com/console
            $account_sid = env('TWILIO_ACCOUNT_SID');
            $auth_token = env('TWILIO_AUTH_TOKEN');
            // Your Twilio phone number
            $twilio_number = env('TWILIO_PHONE_NUMBER');
            // Recipient's phone number
            $recipient_number = $request->to;
            // Message body
            $message_body = $request->message;
            // Create a Twilio client
            $twilio = new Client($account_sid, $auth_token);

            // Send the message
            $message = $twilio->messages->create(
                $recipient_number, // recipient's phone number
                array(
                    'from' => $twilio_number, // your Twilio phone number
                    'body' => $message_body // message body
                )
            );

            DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['sms' => DB::raw('sms +' . 1)]);


                return back()->with('success', 'SMS sent successfully!');

    }





    public function send_customers_sms_action_excel(Request $request)
    {


        $count=0;
            $data = $request->validate([
                'customer_ids' => 'required',
                'message' => 'required',
            ]);
            $customersIds = explode(",", $data['customer_ids']);
            if (count($customersIds) <= 0) {
                return back()->with('error', 'No customer selected to send message!');
            } else {


                $customers = ExcelContact::whereIn('id', $customersIds)->get();

                $message1 = $request->message;
                foreach($customers as $row)
                {

                    // Your Account SID and Auth Token from twilio.com/console
                    $account_sid = env('TWILIO_ACCOUNT_SID');
                    $auth_token = env('TWILIO_AUTH_TOKEN');
                    // Your Twilio phone number
                    $twilio_number = env('TWILIO_PHONE_NUMBER');
                    // Recipient's phone number
                    $recipient_number = $row->phone;
                    // Message body
                    $message_body = $message1;
                    // Create a Twilio client
                    $twilio = new Client($account_sid, $auth_token);

                    // Send the message
                    $message = $twilio->messages->create(
                        $recipient_number, // recipient's phone number
                        array(
                            'from' => $twilio_number, // your Twilio phone number
                            'body' => $message_body // message body
                        )
                    );

                    $count++;
                }

                DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['sms' => DB::raw('sms +' . $count)]);

                return back()->with('success', $count.' '.'Promotion SMS are sent successfully!');

            }

    }


    public function send_customers_whatsapp_action(Request $request)
    {


        $count=0;
            $data = $request->validate([
                'customer_ids' => 'required',
                'message' => 'required',
            ]);
            $customersIds = explode(",", $data['customer_ids']);
            if (count($customersIds) <= 0) {
                return back()->with('error', 'No customer selected to send message!');
            } else {


                $customers = Customer::whereIn('id', $customersIds)->get();
                $message1 = $request->message;
                foreach($customers as $row)
                {

                    $sid    = env('TWILIO_ACCOUNT_SID');
                    $token  = env('TWILIO_AUTH_TOKEN');
                    $twilio = new Client($sid, $token);

                    $message = $twilio->messages
                    ->create("whatsapp:".$row->customer_phone, // to
                        array(
                        "from" => "whatsapp:".env('TWILIO_WHATSAPP_FROM'),
                        "body" => $message1
                        )
                    );

                    $count++;
                }

                DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['whatsapp' => DB::raw('whatsapp +' . $count)]);

                return back()->with('success', $count.' '.'Promotion Whatsapps are sent successfully!');

            }

    }


    public function send_customers_whatsapp_action_landing(Request $request)
    {


        $count=0;
            $data = $request->validate([
                'customer_ids' => 'required',
                'message' => 'required',
            ]);
            $customersIds = explode(",", $data['customer_ids']);
            if (count($customersIds) <= 0) {
                return back()->with('error', 'No customer selected to send message!');
            } else {


                $customers = LandingPageContact::whereIn('id', $customersIds)->get();
                $message1 = $request->message;
                foreach($customers as $row)
                {

                    $sid    = env('TWILIO_ACCOUNT_SID');
                    $token  = env('TWILIO_AUTH_TOKEN');
                    $twilio = new Client($sid, $token);

                    $message = $twilio->messages
                    ->create("whatsapp:".$row->phone, // to
                        array(
                        "from" => "whatsapp:".env('TWILIO_WHATSAPP_FROM'),
                        "body" => $message1
                        )
                    );

                    $count++;
                }

                DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['whatsapp' => DB::raw('whatsapp +' . $count)]);

                return back()->with('success', $count.' '.'Promotion Whatsapps are sent successfully!');

            }

    }


    public function admin_manual_whatsapp(Request $request)
    {

        $data = $request->validate([
            'to' => 'required',
            'message' => 'required',
        ]);

        $sid    = env('TWILIO_ACCOUNT_SID');
                    $token  = env('TWILIO_AUTH_TOKEN');
                    $twilio = new Client($sid, $token);

                    $message = $twilio->messages
                    ->create("whatsapp:".$request->to, // to
                        array(
                        "from" => "whatsapp:".env('TWILIO_WHATSAPP_FROM'),
                        "body" => $request->message
                        )
                    );

        DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['whatsapp' => DB::raw('whatsapp +' . 1)]);

        return back()->with('success', 'Whatsapps Message sent successfully!');

    }





    public function send_customers_whatsapp_action_excel(Request $request)
    {


        $count=0;
            $data = $request->validate([
                'customer_ids' => 'required',
                'message' => 'required',
            ]);
            $customersIds = explode(",", $data['customer_ids']);
            if (count($customersIds) <= 0) {
                return back()->with('error', 'No customer selected to send message!');
            } else {


                $customers = ExcelContact::whereIn('id', $customersIds)->get();
                $message1 = $request->message;
                foreach($customers as $row)
                {

                    $sid    = env('TWILIO_ACCOUNT_SID');
                    $token  = env('TWILIO_AUTH_TOKEN');
                    $twilio = new Client($sid, $token);

                    $message = $twilio->messages
                    ->create("whatsapp:".$row->phone, // to
                        array(
                        "from" => "whatsapp:".env('TWILIO_WHATSAPP_FROM'),
                        "body" => $message1
                        )
                    );

                    $count++;
                }

                DB::table('sent_messages')->updateOrInsert(['month' => now()->month], ['whatsapp' => DB::raw('whatsapp +' . $count)]);

                return back()->with('success', $count.' '.'Promotion Whatsapps are sent successfully!');

            }

    }




}
