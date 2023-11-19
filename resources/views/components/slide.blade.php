<style>
    .main-container {
        width: 100%;
        height: 100%;
        position: relative;
        overflow: hidden;
    }

    .content-container {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: #fff;
        z-index: 2;
    }

    .main-container img,
    .main-container video,
    .main-container .solid-color,
    .main-container .embed-responsive {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 0;
    }

    .main-container video {
        background-color: #2c2b2b;
    }

    .overlay-{{ $key }} {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, {{ $slide->overlay }});
        /* backdrop-filter: blur(2px); */
        z-index: 1;
    }

    @media (max-width: 767px) {
        .content-container {
            width: 100%;
        }
    }
</style>

<div class="swiper-slide">
    <div class="main-container">
        <div class="overlay-{{ $key }}"></div>

        @if ($slide->slider_type == 'photo')
            <!-- Image -->
            <img src="{{ asset('public/uploads/' . $slide->slider_photo) }}" alt="Image" class="img-fluid">
        @endif

        @if ($slide->slider_type == 'mp4')
            <!-- Video -->
            <video playsinline="playsinline" muted="muted" preload="yes" autoplay="autoplay" loop="loop"
                id="vjs_video_739_html5_api" class="video-js" data-setup='{"autoplay":"any"}' controls>
                <source src="{{ asset('public/uploads/' . $slide->slider_mp4) }}" type="video/mp4" />
            </video>
        @endif

        @if ($slide->slider_type == 'color')
            <!-- Color -->
            <div class="solid-color" style="background-color: #{{ $slide->slider_color }} !important;"></div>
        @endif

        @if ($slide->slider_type == 'video')
            <!-- YouTube Video -->
            @php
                $url = $slide->slider_video;
                $video_id = substr($url, strrpos($url, '/') + 1);
            @endphp
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" width="100%" height="auto"
                    src="{{ $slide->slider_video }}?autoplay=1&mute=1&loop=1&playlist={{ $video_id }}"
                    frameborder="0" autoplay allowfullscreen></iframe>
            </div>
        @endif

        <!-- Content Container -->
        <div class="content-container @if ($slide->centered == 1) text-center @else px-4 @endif">
            <h1>{{ $slide->slider_heading }}</h1>
            <h3>{!! nl2br(e($slide->slider_text)) !!}</h3>
            <a href="{{ $slide->slider_button_url }}">{{ $format($slide->slider_button_text) }}</a>
        </div>
    </div>
</div>
