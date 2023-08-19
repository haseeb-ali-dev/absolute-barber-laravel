<?php

namespace App\Http\Controllers\Front;
use App\Http\Controllers\Controller;
use App\Models\Admin\Pricing;
use Illuminate\Http\Request;
use DB;

class HomeController extends Controller
{
    public function index(Request $request)
    {
    	$sliders = DB::table('sliders')->where('page','home')->get();
    	$page_home = DB::table('page_home_items')->where('id',1)->first();
    	$why_choose_items = DB::table('why_choose_items')->get();
    	$services = DB::table('services')->get();
    	$testimonials = DB::table('testimonials')->get();
    	$projects = DB::table('projects')->get();
    	$team_members = DB::table('team_members')->get();
    	$blogs = DB::table('blogs')->get();
		$theme_color = DB::table('general_settings')->first();
        $pricing_options = Pricing::all();

        if(isset($request['menu']))
        {
            return view('pages.index', compact('sliders','page_home','why_choose_items','services', 'testimonials','projects','team_members','blogs','theme_color'));
        }
        else
        {
            if($theme_color->default_homepage == 'website')
            {
                return view('pages.index', compact('sliders','page_home','why_choose_items','services', 'testimonials','projects','team_members','blogs','theme_color', 'pricing_options'));
            }
            else
            {
                return redirect()->route('front.shop');
            }
        }
    }
}
