@extends('layouts.app')

@section('content')
<style>
    /* Add border to the nav-link class */
    .nav-item .nav-link {
        border: 1px solid #000; /* Replace #000 with the desired border color */
    }
</style>
{{-- <div class="page-banner" style="background-image: url({{ asset('public/uploads/'.$g_setting->banner_product) }})">
    <div class="bg-page"></div>
    <div class="text">
        <h1>{{ $shop->name }}</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{ $shop->name }}</li>
            </ol>
        </nav>
    </div>
</div> --}}

<div class="container pt_60">
    <div class="row">
        <div class="col-md-12">
            {!! $shop->detail !!}
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <ul style="margin-bottom: 6rem!important;" class="nav nav-pills nav-fill mb-5" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link h4 active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
                        aria-controls="pills-home" aria-selected="true" style="border-radius: 0 !important;">All</a>
                </li>
            
                @foreach ($categories as $row)
                <li class="nav-item">
                    <a class="nav-link h4" id="category-tab-{{$row->id}}" data-toggle="pill" href="#category-{{$row->id}}"
                        role="tab" aria-controls="pills-profile" aria-selected="false" style="border-radius: 0 !important;">{{$row->name}}</a>
                </li>
                @endforeach
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <div class="row">
                        @foreach($products as $row)
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="product-item">
                                <div class="photo"><a href="{{ url('product/'.$row->product_slug) }}"><img
                                            src="{{ asset('public/uploads/'.$row->product_featured_photo) }}"></a></div>
                                <div class="text">
                                    <h3><a href="{{ url('product/'.$row->product_slug) }}">{{ $row->product_name }}</a>
                                    </h3>
                                    <div class="price">

                                        @if($row->product_old_price != '')
                                        <del>USD {{ $row->product_old_price }}</del>
                                        @endif

                                        USD {{ $row->product_current_price }}
                                    </div>
                                    <div class="cart-button">

                                        @if($row->product_stock == 0)
                                        <a href="javascript:void(0);" class="stock-empty w-100-p text-center">Stock is
                                            empty</a>
                                        @else
                                        <form action="{{ route('front.add_to_cart') }}" method="post">
                                            @csrf
                                            <input type="hidden" name="product_id" value="{{ $row->id }}">
                                            <input type="hidden" name="product_qty" value="1">
                                            <button type="submit">Add to Cart</button>
                                        </form>
                                        @endif

                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach

                        <div class="col-md-12">
                            {{ $products->links() }}
                        </div>
                    </div>
                </div>

                @foreach ($categories as $main_row)
                <div class="tab-pane fade" id="category-{{$main_row->id}}" role="tabpanel"
                    aria-labelledby="category-tab-{{$main_row->id}}">
                    <div class="my-4">
                        <h4>{{$main_row->name}}</h4>
                        <small>{{$main_row->description}}</small>
                    </div>
                    <div class="row">
                        @forelse($main_row->products()->paginate(12) as $row)
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="product-item">
                                <div class="photo"><a href="{{ url('product/'.$row->product_slug) }}"><img
                                            src="{{ asset('public/uploads/'.$row->product_featured_photo) }}"></a></div>
                                <div class="text">
                                    <h3><a href="{{ url('product/'.$row->product_slug) }}">{{ $row->product_name }}</a>
                                    </h3>
                                    <div class="price">
                                        @if($row->product_old_price != '')
                                        <del>USD {{ $row->product_old_price }}</del>
                                        @endif
                                        USD {{ $row->product_current_price }}
                                    </div>
                                    <div class="cart-button">
                                        @if($row->product_stock == 0)
                                        <a href="javascript:void(0);" class="stock-empty w-100-p text-center">Stock is
                                            empty</a>
                                        @else
                                        <form action="{{ route('front.add_to_cart') }}" method="post">
                                            @csrf
                                            <input type="hidden" name="product_id" value="{{ $row->id }}">
                                            <input type="hidden" name="product_qty" value="1">
                                            <button type="submit">Add to Cart</button>
                                        </form>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        @empty
                        <h3 class="mx-auto my-5">No Products are added in this category</h3>
                        @endforelse
                        <div class="col-md-12">
                            {{ $products->links() }}
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>

{{-- <div class="page-content pt_60">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                {!! $shop->detail !!}
            </div>
        </div>
        <div class="row">

            @foreach($products as $row)
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="product-item">
                    <div class="photo"><a href="{{ url('product/'.$row->product_slug) }}"><img
                                src="{{ asset('public/uploads/'.$row->product_featured_photo) }}"></a></div>
                    <div class="text">
                        <h3><a href="{{ url('product/'.$row->product_slug) }}">{{ $row->product_name }}</a></h3>
                        <div class="price">

                            @if($row->product_old_price != '')
                            <del>USD {{ $row->product_old_price }}</del>
                            @endif

                            USD {{ $row->product_current_price }}
                        </div>
                        <div class="cart-button">

                            @if($row->product_stock == 0)
                            <a href="javascript:void(0);" class="stock-empty w-100-p text-center">Stock is empty</a>
                            @else
                            <form action="{{ route('front.add_to_cart') }}" method="post">
                                @csrf
                                <input type="hidden" name="product_id" value="{{ $row->id }}">
                                <input type="hidden" name="product_qty" value="1">
                                <button type="submit">Add to Cart</button>
                            </form>
                            @endif

                        </div>
                    </div>
                </div>
            </div>
            @endforeach

            <div class="col-md-12">
                {{ $products->links() }}
            </div>
        </div>
    </div>
</div> --}}
@endsection
