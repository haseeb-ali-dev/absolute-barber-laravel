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
@include('sliders')

    <div class="page-content">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    {!! $service->detail !!}
                </div>
            </div>
            <div class="row service pt_0 pb_0">
                @foreach($service_items as $row)
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="service-item wow fadeInUp mb_30">
                            <div class="photo">
                                <a href="{{ url('service/'.$row->slug) }}"><img src="{{ asset('public/uploads/'.$row->photo) }}" alt=""></a>
                            </div>
                            <div class="text">
                                <h3><a href="{{ url('service/'.$row->slug) }}">{{ $row->name }}</a></h3>
                                <p>{{ $row->short_description }}</p>
                                <div class="read-more">
                                    <a href="{{ url('service/'.$row->slug) }}">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <div class="row">
                <div class="col-md-12">
                    {{ $service_items->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
