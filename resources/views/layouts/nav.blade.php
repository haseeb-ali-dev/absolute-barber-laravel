@php
$navbar_color = \App\Models\Admin\GeneralSetting::where('id',1)->value('navbar_color');
$settings = \App\Models\Admin\GeneralSetting::where('id',1)->first();

$menus = \App\Models\Admin\Menu::whereNull('parent_id')->get();
@endphp

<!-- Start Navbar Area -->
<div class="navbar-area" id="stickymenu">

    <!-- Menu For Mobile Device -->
    <div class="mobile-nav">
        <a href="" class="logo">
            <img src="{{ asset('public/uploads/'.$g_setting->logo) }}" alt="" style="height: 90px;">
        </a>
    </div>

    <!-- Menu For Desktop Device -->
    <div class="main-nav" style="background: #{{$navbar_color}} !important;">
        <div class="container">
            <nav class="navbar navbar-expand-md navbar-light">
                <a class="navbar-brand" href="{{ url('/') }}">
                    <img src="{{ asset('public/uploads/'.$g_setting->logo) }}" alt="logo" style="width: {{ $g_setting->logo_width }}px !important;height: {{ $g_setting->logo_height }}px !important;">
                </a>
                <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">

                        @foreach($menus as $row)

                        @if($row->menu_status == 'Show')


                        @if($row->menu_name=='Home')
                            <li class="nav-item" style="margin-top: -1px;">
                        @else
                            <li class="nav-item">
                        @endif
                            @if (count($row->sub_menu) > 0)

                            <a style="color: #{{$settings['items_color']}}; text-align:right; " href="javascript:void(0);" class="nav-link dropdown-toggle">{{ $row->menu_name }}</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item">
                                    <a style="color: #{{$settings['items_color']}}; text-align:right; " href="{{ route($row->route) }}" class="nav-link">{{ $row->menu_name }}</a>
                                </li>

                                @foreach ($row->sub_menu as $sub)



                                @endforeach

                            </ul>

                            @else
                                    @if($row->menu_key=='Home')
                                        <a style="color: #{{$settings['items_color']}}; text-align:right; border-top:none;" href="{{ route($row->route, ['menu' => 1]) }}" class="nav-link">{{ $row->menu_name }}</a>
                                    @else
                                        <a style="color: #{{$settings['items_color']}}; text-align:right;" href="{{ route($row->route) }}" class="nav-link">{{ $row->menu_name }}</a>
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
                                    <a style="color: #{{$settings['items_color']}}; text-align:right;" href="{{ url('page/'.$row->dynamic_page_slug) }}" class="nav-link">{{
                                        $row->dynamic_page_name }}</a>
                                </li>

                                @endforeach

                        @endif
                        <li class="nav-item">
                            <a style="color: #{{$settings['items_color']}}; text-align:right;" href="{{ route('customer.registration') }}" class="nav-link">Register</a>
                        </li>
                        <li class="nav-item">
                            <a style="color: #{{$settings['items_color']}}; text-align:right;" href="{{ route('front.contact') }}" class="nav-link">Contact</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- End Navbar Area -->
