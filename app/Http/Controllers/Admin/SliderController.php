<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use DB;

class SliderController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index()
    {
        $slider = Slider::all();
        return view('admin.slider.index', compact('slider'));
    }

    public function create()
    {
        return view('admin.slider.create');
    }

    public function store(Request $request)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $request->validate([
            'slider_type' => 'required',
            'slider_photo' => 'required_if:slider_type,photo|image|mimes:jpeg,png,jpg,gif|max:2400000',
            'slider_video' => 'required_if:slider_type,video',
            'slider_mp4' => 'required_if:slider_type,mp4|max:15360|mimes:mp4',
            'slider_color' => 'required_if:slider_type,color|max:100',
            'overlay' => 'required|numeric|max:1|min:0.1',
        ]);
        $slider = new Slider();
        $request['centered'] = isset($request['centered']) ? 1 : 0;
        $data = $request->only($slider->getFillable());

        if ($request['slider_type'] == 'photo')
        {
            $statement = DB::select("SHOW TABLE STATUS LIKE 'sliders'");
            // dd($statement);
            $ai_id = $statement[0]->Auto_increment;
            $ext = $request->file('slider_photo')->extension();
            $final_name = time().$ext;
            $request->file('slider_photo')->move(public_path('uploads'), $final_name);
            unset($data['slider_photo']);
            $data['slider_photo'] = $final_name;
        }

        if ($request['slider_type'] == 'mp4')
        {
            $ext = $request->file('slider_mp4')->extension();
            $final_name = time().'.'.$ext;
            $request->file('slider_mp4')->move(public_path('uploads'), $final_name);
            unset($data['slider_mp4']);
            $data['slider_mp4'] = $final_name;
        }

        $slider->fill($data)->save();

        return redirect()->route('admin.slider.index')->with('success', 'Slider is added successfully!');
    }

    public function edit($id)
    {
        $slider = Slider::findOrFail($id);
        return view('admin.slider.edit', compact('slider'));
    }

    public function update(Request $request, $id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $request->validate([
            'slider_type' => 'required',
            'slider_video' => 'required_if:slider_type,video',
            'slider_mp4' => 'required_if:slider_type,mp4|max:15360|mimes:mp4',
            'slider_color' => 'required_if:slider_type,color|max:100',
            'overlay' => 'required|numeric|max:1|min:0.1',
        ]);

        $slider = Slider::findOrFail($id);
        $request['centered'] = isset($request['centered']) ? 1 : 0;
        $data = $request->only($slider->getFillable());

        if ($request->hasFile('slider_photo')) {

            $request->validate([
                'slider_photo' => 'image|mimes:jpeg,png,jpg,gif|max:2048'
            ]);

            // unlink(public_path('uploads/'.$slider->slider_photo));

            // Uploading the file
            $ext = $request->file('slider_photo')->extension();
            $final_name = time().$ext;
            $request->file('slider_photo')->move(public_path('uploads/'), $final_name);

            unset($data['slider_photo']);
            $data['slider_photo'] = $final_name;
        }

        if ($request['slider_type'] == 'mp4')
        {
            $ext = $request->file('slider_mp4')->extension();
            $final_name = time().'.'.$ext;
            $request->file('slider_mp4')->move(public_path('uploads'), $final_name);
            unset($data['slider_mp4']);
            $data['slider_mp4'] = $final_name;
        }

        $slider->fill($data)->save();

        return redirect()->route('admin.slider.index')->with('success', 'Slider is updated successfully!');
    }

    public function destroy($id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $slider = Slider::findOrFail($id);
        // unlink(public_path('uploads/'.$slider->slider_photo));
        $slider->delete();

        // Success Message and redirect
        return Redirect()->back()->with('success', 'Slider is deleted successfully!');
    }

}
