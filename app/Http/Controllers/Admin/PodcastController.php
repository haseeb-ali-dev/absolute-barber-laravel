<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Podcast;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use DB;

class PodcastController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index()
    {
        $music = Podcast::all();
        return view('admin.podcast.index', compact('music'));
    }

    public function create()
    {
        return view('admin.podcast.create');
    }

    public function store(Request $request)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $music = new Podcast();
        $data = $request->only($music->getFillable());
        
        if($request->upload_type=='upload'){
            $ext = $request->file('image')->extension();
            $final_name = time().'.'.$ext;
            $request->file('image')->move(public_path('uploads/'), $final_name);
            $data['image'] = $final_name;


            $ext1 = $request->file('sound')->extension();
            $final_name1 = time().'.'.$ext1;
            $request->file('sound')->move(public_path('uploads/'), $final_name1);
            $data['sound'] = $final_name1;
            $music->fill($data)->save();

            return redirect()->route('admin.podcast.index')->with('success', 'Why Choose Us Item is added successfully!');
        }

        if($request->upload_type=='embed'){
           
            $music->fill($data)->save();

            return redirect()->route('admin.podcast.index')->with('success', 'Why Choose Us Item is added successfully!');
        }


        $statement = DB::select("SHOW TABLE STATUS LIKE 'why_choose_items'");
        $ai_id = $statement[0]->Auto_increment;
        $ext = $request->file('photo')->extension();
        $final_name = time().'.'.$ext;
        $request->file('photo')->move(public_path('uploads/'), $final_name);
        $data['photo'] = $final_name;

        $music->fill($data)->save();
        return redirect()->route('admin.why_choose.index')->with('success', 'Why Choose Us Item is added successfully!');
    }

    public function edit($id)
    {
        $music = Podcast::findOrFail($id);
        return view('admin.why_choose.edit', compact('why_choose'));
    }

    public function update(Request $request, $id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $music = Podcast::findOrFail($id);
        $data = $request->only($music->getFillable());

        if($request->hasFile('photo')) {
            $request->validate([
                'name'   =>  [
                    'required',
                    Rule::unique('why_choose_items')->ignore($id),
                ],
                'photo' => 'image|mimes:jpeg,png,jpg,gif|max:2048'
            ]);
            // unlink(public_path('uploads/'.$music->photo));
            $ext = $request->file('photo')->extension();
            $final_name = time().'.'.$ext;
            $request->file('photo')->move(public_path('uploads/'), $final_name);
            $data['photo'] = $final_name;
        } else {
            $request->validate([
                'name'   =>  [
                    'required',
                    Rule::unique('why_choose_items')->ignore($id),
                ]
            ]);
            $data['photo'] = $music->photo;
        }

        $music->fill($data)->save();
        return redirect()->route('admin.why_choose.index')->with('success', 'Why Choose Us Item is updated successfully!');
    }

    public function destroy($id)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $music = Podcast::findOrFail($id);
        // unlink(public_path('uploads/'.$music->photo));
        $music->delete();
        return Redirect()->back()->with('success', 'Music deleted successfully!');
    }
}
