@extends('layouts.app')

@section('content')

<style>
    .slider-item__backdrop {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); /* Change the opacity value to adjust the darkness of the backdrop */
}

</style>
<div class="slider homeSlider">
    <div class="slide-carousel owl-carousel">

        @forelse ($sliders as $row)

        @if ($row->slider_type == 'video')
        <div class="slider-item">
            <div style="position:absolute;top:0;left:0;width:100%;height:100%;background-color:rgba(0, 0, 0, {{$row->overlay}});"></div>

            @php
                $url = $row->slider_video;
                $video_id = substr($url, strrpos($url, '/') + 1);
            @endphp
            <iframe class="slider-item_video" width="100%" height="800" src="{{ $row->slider_video }}?autoplay=1&mute=1&loop=1&playlist={{ $video_id }}" frameborder="0" autoplay allowfullscreen></iframe>

            {{-- <video class="slider-item_video" width="100%" height="auto" playsinline="playsinline" muted="muted"
                preload="yes" autoplay="autoplay" loop="loop" id="vjs_video_739_html5_api" class="video-js"
                data-setup='{"autoplay":"any"}' controls>
                <source src="{{ $row->slider_video }}" type="video/mp4" />
            </video> --}}

            <div class="slider-item_video2" style="background:#{{ $theme_color->theme_color }};height: 800px;">
            </div>
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text" @if($row->centered) style="text-align: center;" @endif>
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>{{ $row->slider_heading }}</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            {!! nl2br(e($row->slider_text)) !!}
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;@if($row->centered == 0)margin-left:-10%;@endif">
                                        <ul>
                                            <li><a href="{{ $row->slider_button_url }}">{{ $row->slider_button_text
                                                    }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @elseif ($row->slider_type == 'photo')
        <div class="slider-item"
            style="background-image:url({{ asset('public/uploads/'.$row->slider_photo) }});height: 800px;">
            <div style="position:absolute;top:0;left:0;width:100%;height:100%;background-color:rgba(0, 0, 0, {{$row->overlay}});"></div>
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text" @if($row->centered) style="text-align: center;" @endif>
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>{{ $row->slider_heading }}</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            {!! nl2br(e($row->slider_text)) !!}
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;@if($row->centered == 0)margin-left:-10%;@endif">
                                        <ul>
                                            <li><a href="{{ $row->slider_button_url }}">{{ $row->slider_button_text
                                                    }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @elseif ($row->slider_type == 'color')
        <div class="slider-item" style="background-color:#{{$row->slider_color}};height: 800px;">
            <div style="position:absolute;top:0;left:0;width:100%;height:100%;background-color:rgba(0, 0, 0, {{$row->overlay}});"></div>
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text" @if($row->centered) style="text-align: center;" @endif>
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>{{ $row->slider_heading }}</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            {!! nl2br(e($row->slider_text)) !!}
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;@if($row->centered == 0)margin-left:-10%;@endif">
                                        <ul>
                                            <li><a href="{{ $row->slider_button_url }}">{{ $row->slider_button_text
                                                    }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @else
        <div class="slider-item">
            <div style="position:absolute;top:0;left:0;width:100%;height:100%;background-color:rgba(0, 0, 0, {{$row->overlay}});"></div>
            <video class="slider-item_video" width="100%" height="auto" playsinline="playsinline" muted="muted"
                preload="yes" autoplay="autoplay" loop="loop" id="vjs_video_739_html5_api" class="video-js"
                data-setup='{"autoplay":"any"}' controls>
                <source src="{{ asset('public/uploads/'.$row->slider_mp4) }}" type="video/mp4" />
            </video>
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text" @if($row->centered) style="text-align: center;" @endif>
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>{{ $row->slider_heading }}</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            {!! nl2br(e($row->slider_text)) !!}
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;@if($row->centered == 0)margin-left:-10%;@endif">
                                        <ul>
                                            <li><a href="{{ $row->slider_button_url }}">{{ $row->slider_button_text
                                                    }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endif
        @empty
        <div class="slider-item" style="background-color:black;height: 800px;">
            <div style="position:absolute;top:0;left:0;width:100%;height:100%;background-color:rgba(0, 0, 0, {{$row->overlay}});"></div>
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text" @if($row->centered) style="text-align: center;" @endif>
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>Test Heading</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            Test Paragraph
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;@if($row->centered == 0)margin-left:-10%;@endif">
                                        <ul>
                                            <li><a href="javascript:;">Read More</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endforelse

        {{-- <div class="slider-item"
            style="background-image:url({{ asset('public/uploads/'.$row->slider_photo) }});height: 900px;">
            <div class="slider-bg"></div>
            <div class="container">
                <div class="row"
                    style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                    <div class="col-md-9 col-sm-12">
                        <div class="slider-table">
                            <div class="slider-text">
                                <div class="text-animated" style="margin-top: 30%;">
                                    <h1>{{ $row->slider_heading }}</h1>
                                </div>
                                <div class="text-animated col-md-11">
                                    <p>
                                        {!! nl2br(e($row->slider_text)) !!}
                                    </p>
                                </div>
                                <div class="text-animated"
                                    style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;margin-left: -10%;">
                                    <ul>
                                        <li><a href="{{ $row->slider_button_url }}">{{ $row->slider_button_text }}</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> --}}

        {{-- video uploaded --}}
        {{-- <div class="slider-item">
            <video width="100%" height="auto" playsinline="playsinline" muted="muted" preload="yes" autoplay="autoplay"
                loop="loop" id="vjs_video_739_html5_api" class="video-js" data-setup='{"autoplay":"any"}' controls>
                <source src="http://www.bercodetech.com/prisma.mp4" type="video/mp4" />
            </video>
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text">
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>CONNECTING SHIPPERS & CARRIERS</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            Making the chaos of freight more efficient, we keep our carriers loaded and
                                            rolling and our shippers focused on their business. Bringing efficiencies to
                                            an inefficient market, PRISMA FREIGHTS will handle the coordination of your
                                            products and all of the logistics of transportation, leaving you to profit
                                            from the growth and expansion of your business.
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;margin-left: -10%;">
                                        <ul>
                                            <li><a href="#">Read more</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> --}}

        {{-- <div class="slider-item"
            style="background-image:linear-gradient(to right,#0a304196,#0a304196),url({{ asset('public/uploads/slider-2.png') }});height: 800px;">
            <div class="slider--item__inner">
                <div class="container">
                    <div class="row"
                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center; margin-top: -13%;">
                        <div class="col-md-9 col-sm-12">
                            <div class="slider-table">
                                <div class="slider-text">
                                    <div class="text-animated" style="margin-top: 30%;">
                                        <h1>CONNECTING SHIPPERS & CARRIERS</h1>
                                    </div>
                                    <div class="text-animated col-md-11">
                                        <p>
                                            Making the chaos of freight more efficient, we keep our carriers loaded and
                                            rolling and our shippers focused on their business. Bringing efficiencies to
                                            an inefficient market, PRISMA FREIGHTS will handle the coordination of your
                                            products and all of the logistics of transportation, leaving you to profit
                                            from the growth and expansion of your business.
                                        </p>
                                    </div>
                                    <div class="text-animated"
                                        style="display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;margin-left: -10%;">
                                        <ul>
                                            <li><a href="#">Read more</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div> --}}

    </div>
</div>


@if($page_home->why_choose_status == 'Show')
<div class="feature">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="heading wow fadeInUp">
                    <h2>{{ $page_home->why_choose_title }}</h2>
                    <h3>{{ $page_home->why_choose_subtitle }}</h3>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach($why_choose_items as $row)
            <div class="col-md-4">
                <div class="feature-item wow fadeInUp">
                    <div class="icon">
                        <img src="{{ asset('public/uploads/'.$row->photo) }}" alt="">
                    </div>
                    <h4>{{ $row->name }}</h4>
                    <p>
                        {!! nl2br(e($row->description)) !!}
                    </p>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
@endif


@if($page_home->special_status == 'Show')
<div class="special" style="background-image: url({{ asset('public/uploads/'.$page_home->special_bg) }});">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 wow fadeInLeft">
                <h2>{{ $page_home->special_title }}</h2>
                <h3>{{ $page_home->special_subtitle }}</h3>
                <p>
                    {!! nl2br(e($page_home->special_content)) !!}
                </p>
                <div class="read-more">
                    <a href="{{ $page_home->special_btn_url }}" class="btn btn-primary btn-arf">{{
                        $page_home->special_btn_text }}</a>
                </div>
            </div>
            <div class="col-md-6 wow fadeInRight">
                <div class="video-section"
                    style="background-image: url({{ asset('public/uploads/'.$page_home->special_video_bg) }})">
                    <div class="bg video-section-bg"></div>
                    <div class="video-button-container">
                        <a class="video-button"
                            href="https://www.youtube.com/watch?v={{ $page_home->special_yt_video }}"><span></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endif


@if($page_home->service_status == 'Show')
<div class="service">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="heading wow fadeInUp">
                    <h2>{{ $page_home->service_title }}</h2>
                    <h3>{{ $page_home->service_subtitle }}</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="service-carousel owl-carousel">
                    @foreach($services as $row)
                    <div class="service-item wow fadeInUp">
                        <div class="photo">
                            <a href="{{ url('service/'.$row->slug) }}"><img
                                    src="{{ asset('public/uploads/'.$row->photo) }}" alt=""></a>
                        </div>
                        <div class="text">
                            <h3><a href="{{ url('service/'.$row->slug) }}">{{ $row->name }}</a></h3>
                            <p>
                                {!! nl2br(e($row->short_description)) !!}
                            </p>
                            <div class="read-more">
                                <a href="{{ url('service/'.$row->slug) }}">Read More</a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endif





@if($page_home->project_status == 'Show')
<div class="project">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="heading wow fadeInUp">
                    <h2>{{ $page_home->project_title }}</h2>
                    <h3>{{ $page_home->project_subtitle }}</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="project-carousel owl-carousel">
                    @foreach($projects as $row)
                    <div class="project-item wow fadeInUp">
                        <div class="photo">
                            <a href="{{ url('project/'.$row->project_slug) }}"><img
                                    src="{{ asset('public/uploads/'.$row->project_featured_photo) }}" alt=""></a>
                        </div>
                        <div class="text">
                            <h3><a href="{{ url('project/'.$row->project_slug) }}">{{ $row->project_name }}</a></h3>
                            <p>
                                {!! nl2br(e($row->project_content_short)) !!}
                            </p>
                            <div class="read-more">
                                <a href="{{ url('project/'.$row->project_slug) }}">Read More</a>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endif


@if($page_home->team_member_status == 'Show')
<div class="team bg-lightblue">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="heading wow fadeInUp">
                    <h2>{{ $page_home->team_member_title }}</h2>
                    <h3>{{ $page_home->team_member_subtitle }}</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="team-carousel owl-carousel">

                    @foreach($team_members as $row)
                    <div class="team-item wow fadeInUp">
                        <div class="team-photo">
                            <a href="{{ url('team-member/'.$row->slug) }}" class="team-photo-anchor">
                                <img src="{{ asset('public/uploads/'.$row->photo) }}" alt="Team Member Photo">
                            </a>
                        </div>
                        <div class="team-text">
                            <h4><a href="{{ url('team-member/'.$row->slug) }}">{{ $row->name }}</a></h4>
                            <p>{{ $row->designation }}</p>
                        </div>
                    </div>
                    @endforeach

                </div>
            </div>
        </div>
    </div>
</div>
@endif

@include('pages.pricing_section')

@if($page_home->appointment_status == 'Show')
<div class="cta" style="background-image: url({{ asset('public/uploads/'.$page_home->appointment_bg) }});">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="cta-box text-center">
                    <h2>{{ $page_home->appointment_title }}</h2>
                    <p class="mt-3">
                        {!! nl2br(e($page_home->appointment_text)) !!}
                    </p>
                    <a href="{{ $page_home->appointment_btn_url }}" class="btn btn-primary">{{
                        $page_home->appointment_btn_text }}</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endif


@if($page_home->testimonial_status == 'Show')
<div class="testimonial"  style="background-image: url({{ asset('public/uploads/'.$page_home->testimonial_bg) }});">
    <div class="testimonial-bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="heading wow fadeInUp">
                    <h2>{{ $page_home->testimonial_title }}</h2>
                    <h3>{{ $page_home->testimonial_subtitle }}</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="testimonial-carousel owl-carousel">
                    @foreach($testimonials as $row)
                    <div class="testimonial-item wow fadeInUp">
                        <div class="photo">
                            <img src="{{ asset('public/uploads/'.$row->photo) }}" alt="">
                        </div>
                        <div class="text">
                            <p>
                                {!! nl2br(e($row->comment)) !!}
                            </p>
                            <h3>{{ $row->name }}</h3>
                            <h4>{{ $row->designation }}</h4>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endif

@include('pages.home_tools_section')


@if($page_home->latest_blog_status == 'Show')
<div class="blog-area">
    <div class="container wow fadeIn">

        <div class="row">
            <div class="col-md-12">
                <div class="heading wow fadeInUp">
                    <h2>{{ $page_home->latest_blog_title }}</h2>
                    <h3>{{ $page_home->latest_blog_subtitle }}</h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="blog-carousel owl-carousel">

                    @foreach($blogs as $row)
                    <div class="blog-item wow fadeInUp">
                        <a href="{{ url('blog/'.$row->blog_slug) }}">
                            <div class="blog-image">
                                <img src="{{ asset('public/uploads/'.$row->blog_photo) }}" alt="Blog Image">
                                <div class="date">
                                    <h3>{{ \Carbon\Carbon::parse($row->created_at)->format('d') }}</h3>
                                    <h4>{{ \Carbon\Carbon::parse($row->created_at)->format('M') }}</h4>
                                </div>
                            </div>
                        </a>
                        <div class="blog-text">
                            <h3><a href="{{ url('blog/'.$row->blog_slug) }}">{{ $row->blog_title }}</a></h3>
                            <p>
                                {!! nl2br(e($row->blog_content_short)) !!}
                            </p>
                            <div class="read-more">
                                <a href="{{ url('blog/'.$row->blog_slug) }}">Read More</a>
                            </div>
                        </div>
                    </div>
                    @endforeach

                </div>
            </div>
        </div>
    </div>
</div>
@endif


@if($page_home->newsletter_status == 'Show')
<div class="newsletter-area" style="background-image: url({{ asset('public/uploads/'.$page_home->newsletter_bg) }});">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 newsletter">
                <div class="newsletter-text wow fadeInUp">
                    <h2>{{ $page_home->newsletter_title }}</h2>
                    <p>
                        {!! nl2br(e($page_home->newsletter_text)) !!}
                    </p>
                </div>
                <div class="newsletter-button wow fadeInUp">
                    <form action="{{ route('front.subscription') }}" method="post"
                        class="frm_newsletter justify-content-center">
                        @csrf
                        <input type="text" placeholder="Enter Your Email" name="subs_email">
                        <input type="submit" value="Submit">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endif

{{-- @if (isset($theme_color->bg_music))
    <audio id="background-audio" muted loop>
        <source src="{{ asset('public/uploads/' . $theme_color->bg_music) }}" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
@endif

@if (isset($theme_color->bg_music))
    <script>
         $(document).ready(function () {
            $('html, body').click(function () {
                const audio = document.getElementById('background-audio');
                audio.muted = false
                audio.play();
            });
        });
    </script>
@endif --}}

@if (isset($theme_color->bg_music))
    <script type="text/javascript">
        window.onload = function() {
            var audio = document.createElement("AUDIO")
            document.body.appendChild(audio);
            audio.src = "{{ asset('public/uploads/' . $theme_color->bg_music) }}"


            document.body.addEventListener("mousemove", function () {
                audio.play()
            });

        }
    </script>
@endif


@endsection
