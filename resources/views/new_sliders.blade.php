<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<style>
    .swiper {
        width: 100%;
        height: 80vh;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #000;
        background-repeat: no-repeat !important;
        background-size: 100% 100%;
        background-position: center center;
    }

    .swiper-slide::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.2);
        z-index: 0;
        backdrop-filter: blur(2px);
    }

    .swiper-slide .content {
        position: relative;
        z-index: 1;
    }

    .swiper-slide .content h1 {
        color: #fff;
        font-size: 4rem;
        font-weight: 800;
    }

    .swiper-slide .content h3 {
        color: #fff;
        font-size: 2rem;
        font-weight: 800;
        margin-bottom: 30px;
    }

    .swiper-slide .content a {
        font-size: 16px;
        font-weight: 500;
        width: fit-content;
        margin-inline: auto;
        background-color: transparent;
        color: #fff;
        border: 2px solid #fff;
        border-radius: 50px;
        padding: 11px 40px;
        text-decoration: none;
    }

    .swiper-slide video {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .swiper-slide .content a:hover {
        background-color: #4D0101 !important;
        border-color: #4D0101 !important;
    }

    @media only screen and (max-width: 767px) {
        .swiper {
            width: 100%;
            height: 50vh;
        }

        .swiper-slide .content h1 {
            font-size: 2rem;
        }

        .swiper-slide .content h3 {
            font-size: 1rem;
        }

        .swiper-slide .content a {
            font-size: 14px;
            padding: 8px 30px;
        }
    }
</style>

<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        @forelse ($sliders as $key => $row)
            @if ($row->slider_type == 'photo')
                <div class="swiper-slide d-flex align-items-center {{ $row->centered ? 'justify-content-center' : 'px-3 px-md-5' }}"
                    style="background-image:url({{ asset('public/uploads/' . $row->slider_photo) }});">
                    <div
                        class="d-flex flex-column {{ $row->centered ? 'align-items-center' : 'align-items-baseline' }} p-2 content">
                        <h1>{{ $row->slider_heading }}</h1>
                        <h3>
                            {!! nl2br(e($row->slider_text)) !!}
                        </h3>
                        <a href="{{ $row->slider_button_url }}">
                            {{ $row->slider_button_text }}
                        </a>
                    </div>
                </div>
            @elseif ($row->slider_type == 'color')
                <div class="swiper-slide d-flex align-items-center {{ $row->centered ? 'justify-content-center' : 'px-3 px-md-5' }}"
                    style="background-color:#{{ $row->slider_color }};">
                    <div
                        class="d-flex flex-column {{ $row->centered ? 'align-items-center' : 'align-items-baseline' }} p-2 content">
                        <h1>{{ $row->slider_heading }}</h1>
                        <h3>
                            {!! nl2br(e($row->slider_text)) !!}
                        </h3>
                        <a href="{{ $row->slider_button_url }}">
                            {{ $row->slider_button_text }}
                        </a>
                    </div>
                </div>
            @else
                <div
                    class="swiper-slide d-flex align-items-center {{ $row->centered ? 'justify-content-center' : 'px-3 px-md-5' }}">
                    <video class="slider-item_video" width="100%" height="100%" playsinline="playsinline"
                        muted="muted" preload="yes" autoplay="autoplay" loop="loop" id="vjs_video_739_html5_api"
                        class="video-js" data-setup='{"autoplay":"any"}' controls>
                        <source src="{{ asset('public/uploads/' . $row->slider_mp4) }}" type="video/mp4" />
                    </video>
                    <div
                        class="d-flex flex-column {{ $row->centered ? 'align-items-center' : 'align-items-baseline' }} p-2 content">
                        <h1>{{ $row->slider_heading }}</h1>
                        <h3>
                            {!! nl2br(e($row->slider_text)) !!}
                        </h3>
                        <a href="{{ $row->slider_button_url }}">
                            {{ $row->slider_button_text }}
                        </a>
                    </div>
                </div>
            @endif
        @empty
            <div class="swiper-slide d-flex align-items-center {{ $row->centered ? 'justify-content-center' : 'px-3 px-md-5' }}"
                style="background-color:black;">
                <div
                    class="d-flex flex-column {{ $row->centered ? 'align-items-center' : 'align-items-baseline' }} p-2 content">
                    <h1>Test Heading</h1>
                    <h3>
                        Test Paragraph
                    </h3>
                    <a href="javascript:;">Read More</a>
                </div>
            </div>
        @endforelse
    </div>
</div>
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        autoplay: {
            delay: 5000,
        },
    });
</script>
