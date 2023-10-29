@php
$navbar_color = \App\Models\Admin\GeneralSetting::where('id',1)->value('navbar_color');
$settings = \App\Models\Admin\GeneralSetting::where('id',1)->first();

$menus = \App\Models\Admin\Menu::whereNull('parent_id')->get();
@endphp
<style>
    .main-nav nav .navbar-nav .nav-item .dropdown-menu li a:hover {
        background: #{{$settings['sub_items_hover_bg_color']}} !important;
    }
</style>
<!-- Start Navbar Area -->
<div class="navbar-area" id="stickymenu">

    <!-- Menu For Mobile Device -->
    <div class="mobile-nav">
        <div style="display: flex; justify-content: center; align-items: center;">
            <a href="" class="logo">
                <img src="{{ asset('public/uploads/'.$g_setting->logo) }}" alt="" style="height: 90px;">
            </a>
        </div>
    </div>


    <!-- Menu For Desktop Device -->
        <div class="main-nav" style="background: #{{$navbar_color}} !important;">
            <div class="container">
                <nav class="navbar navbar-expand-md navbar-light">
                    <a class="navbar-brand" href="{{ url('/') }}">
                        <img src="{{ asset('public/uploads/'.$g_setting->logo) }}" alt="logo" style="width: {{ $g_setting->logo_width }}px !important;height: {{ $g_setting->logo_height }}px !important;">
                    </a>
                    @if(!request()->is('*shop*') && !request()->is('*product*') && !request()->is('*cart*') && !request()->is('*checkout*') && !request()->is('*payment*'))
                        <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto" style="background: #{{$navbar_color}} !important;">

                                @foreach($menus as $row)

                                @if($row->menu_status == 'Show')


                                @if($row->menu_name=='Home')
                                    <li class="nav-item" style="margin-top: -1px;">
                                @else
                                    <li class="nav-item">
                                @endif
                                    @if (count($row->sub_menu) > 0)

                                    <a style="color: #{{$settings['items_color']}};" href="javascript:void(0);" class="nav-link dropdown-toggle">{{ $row->menu_name }}</a>

                                    <ul class="dropdown-menu" style="background-color: #{{$settings['sub_items_bg_color']}} !important;">

                                        @foreach ($row->sub_menu as $sub)

                                            @if($sub->menu_status == 'Show')
                                                <li class="nav-item">
                                                    <a style="color: #{{$settings['items_color']}};" href="{{ $sub->fixed ? route($sub->route) : url($sub->route) }}" class="nav-link" @if ($sub->menu_key == 'Shop') target='_blank' @endif>{{ $sub->menu_name }}</a>
                                                </li>
                                            @endif

                                        @endforeach

                                    </ul>

                                    @else
                                            @if($row->menu_key=='Home')
                                                <a style="color: #{{$settings['items_color']}}; border-top:none;" href="{{ route($row->route, ['menu' => 1]) }}" class="nav-link">{{ $row->menu_name }}</a>
                                            @else
                                                @if ($row->link==0)
                                                    <a style="color: #{{$settings['items_color']}};" href="{{ $row->fixed ? route($row->route) : route($row->route) }}" class="nav-link" @if ($row->menu_key == 'Shop') target='_blank' @endif>{{ $row->menu_name }}</a>
                                                @endif
                                                @if ($row->link==1)
                                                    
                                                    <a target="_blank" style="color: #{{$settings['items_color']}};" href="{{ filter_var($row->route, FILTER_VALIDATE_URL) ? $row->route : ($row->fixed ? route($row->route) : route($row->route)) }}" class="nav-link" @if ($row->menu_key == 'Shop') target='_blank' @endif>{{ $row->menu_name }}</a>

                                                @endif
                                                
                                            @endif
                                    @endif

                                </li>
                                @endif

                                @endforeach

                                {{-- Dynamic Pages --}}

                                @php
                                $dynamic_pages = DB::table('dynamic_pages')->get();
                               
                                @endphp

                                @if ($dynamic_pages)

                                @foreach($dynamic_pages as $row)

                                        <li class="nav-item">
                                            <a style="color: #{{$settings['items_color']}};" href="{{ url('page/'.$row->dynamic_page_slug) }}" class="nav-link">{{
                                                $row->dynamic_page_name }}</a>
                                        </li>

                                        @endforeach

                                @endif
                               
                                <li class="nav-item">
                                    <a style="color: #{{$settings['items_color']}};" href="{{ route('customer.registration') }}" class="nav-link">Register</a>
                                </li>
                                <li class="nav-item">
                                    <a style="color: #{{$settings['items_color']}};" href="{{ route('front.contact') }}" class="nav-link">Contact</a>
                                </li>
                            </ul>
                        </div>
                    @endif
                </nav>
            </div>
        </div>
</div>
<!-- End Navbar Area -->
