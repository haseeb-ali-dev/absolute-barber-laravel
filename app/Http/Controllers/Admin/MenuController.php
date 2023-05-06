<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Menu;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use DB;

class MenuController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin');
    }

    public function index()
    {
        $menus = Menu::orderBy('id', 'asc')->get();
        $options = Menu::doesntHave('sub_menu')->whereNull('parent_id')->get()->toArray();
        return view('admin.menu.index', compact('menus', 'options'));
    }

    public function update(Request $request)
    {
        if(env('PROJECT_MODE') == 0) {
            return redirect()->back()->with('error', env('PROJECT_NOTIFICATION'));
        }

        $i=0;
        foreach(request('menu_id') as $value)
        {
            $arr1[$i] = $value;
            $i++;
        }

        $i=0;
        foreach(request('menu_status') as $value)
        {
            $arr2[$i] = $value;
            $i++;
        }

        $i=0;
        foreach(request('menu_name') as $value)
        {
            $arr3[$i] = $value;
            $i++;
        }

        for($i=0;$i<count($arr1);$i++)
        {
            $data = array();
            $data['menu_status'] = $arr2[$i];
            $data['menu_name'] = $arr3[$i];
            DB::table('menus')->where('id', $arr1[$i])->update($data);
        }

        return redirect()->route('admin.menu.index')->with('success', 'Menu is updated successfully!');
    }

    public function addSubmenu(Request $request)
    {
        try {

            Menu::find($request['child_id'])->update(['parent_id' => $request['parent_id']]);

            return back()->with('success', 'Sub Menu is updated successfully!');

        } catch (\Exception $e) {

            return back()->with('error', $e);
        }
    }

    public function removeSubmenu($id)
    {
        try {

            Menu::find($id)->update(['parent_id' => null]);

            return back()->with('success', 'Sub Menu is removed successfully!');

        } catch (\Exception $e) {

            return back()->with('error', $e);
        }
    }
}
