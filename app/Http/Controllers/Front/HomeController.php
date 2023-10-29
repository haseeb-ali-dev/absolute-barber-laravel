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
        $music = DB::table('musics')->get();
        $podcasts = DB::table('podcasts')->get();
    	$services = DB::table('services')->get();
    	$testimonials = DB::table('testimonials')->get();
    	$projects = DB::table('projects')->get();
    	$team_members = DB::table('team_members')->get();
    	$blogs = DB::table('blogs')->get();
		$theme_color = DB::table('general_settings')->first();
        $pricing_options = Pricing::all();

        if(isset($request['menu']))
        {
            return view('pages.index', compact('sliders','page_home','why_choose_items','services', 'testimonials','projects','team_members','blogs','theme_color', 'pricing_options','music','podcasts'));
        }
        else
        {
            if($theme_color->default_homepage == 'website')
            {
                return view('pages.index', compact('sliders','page_home','why_choose_items','services', 'testimonials','projects','team_members','blogs','theme_color', 'pricing_options','music','podcasts'));
            }
            else
            {
                return redirect()->route('front.shop');
            }
        }
    }
    public function pricing()
    {
        $theme_color = DB::table('general_settings')->where('id', 1)->first();
        $page_home = DB::table('page_home_items')->where('id',1)->first();
        $pricing_options = Pricing::all();

        return view('pages.pricing', compact('theme_color','page_home','pricing_options'));
    }
    public function home_tools()
    {
        $theme_color = DB::table('general_settings')->where('id', 1)->first();
        $page_home = DB::table('page_home_items')->where('id',1)->first();
        $sliders = DB::table('sliders')->where('page','tools')->get();

        return view('pages.home_tools', compact('theme_color','page_home','sliders'));
    }

    public function home_sounds()
    {
        $theme_color = DB::table('general_settings')->where('id', 1)->first();
        $music = DB::table('musics')->get();
        $page_home = DB::table('page_home_items')->where('id',1)->first();

        return view('pages.music', compact('theme_color','music','page_home'));
    }

    public function home_podcasts()
    {
        $theme_color = DB::table('general_settings')->where('id', 1)->first();
        $music = DB::table('podcasts')->get();
        $page_home = DB::table('page_home_items')->where('id',1)->first();
        $sliders = DB::table('sliders')->where('page','podcast')->get();

        return view('pages.podcast', compact('theme_color','music','page_home','sliders'));
    }



}
