    @extends('layouts.app')

    @section('content')
    <style>
        /* Add border, round the nav-link class, and create spacing between buttons */
        .nav-item .nav-link {
            border: 1px solid #000; /* Replace #000 with the desired border color */
            /* Remove border-radius to make the edges square */
            padding: 20px 20px; /* Adjust the padding as needed */
            text-align: center;
            font-weight: bold;
            font-size: 16px; /* Adjust the font size as needed */
            transition: background-color 0.3s, color 0.3s;
            margin-bottom: 5px; /* Add 5px bottom margin to create spacing between buttons */
        }

        .nav-item .nav-link.active {
            background-color: #000; /* Change to your desired active background color */
            color: #fff; /* Change to your desired active text color */
        }

        @media screen and (max-width: 767px) {
            #pills-tab {
                margin-top: 13%;
            }
        }

        .slider-item__backdrop {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Change the opacity value to adjust the darkness of the backdrop */
        }

        /* Adjust the style for the left-aligned categories */
        #categories-list {
            list-style: none;
            padding: 0;
        }

        #categories-list li {
            margin-bottom: 10px;
        }
    </style>



    @include('sliders')

    <div class="container pt_60">

    <!-- New section with a smaller image -->
<div class="row wow fadeInUp" data-wow-duration="1s" style="visibility: visible; animation-duration: 1s; animation-name: fadeInUp;">
    <div class="col-md-8 col-lg-7 col-xl-6 m-auto text-center">
        <div class="wsus__section_heading mb_45">
            <h4>Food Menu 2</h4>
            <h2>Our Popular Delicious Foods 2</h2>
            <span>
                <img src="https://rebeats.site/public/unifood/user/images/heading_shapes.png" alt="shapes" class="img-fluid w-50">
                <!-- Add a custom class (e.g., w-50) or inline styles to adjust the size -->
            </span>
            <p>Objectively pontificate quality models before intuitive information. Dramatically recaptiualize multifunctional 2.</p>
        </div>
    </div>
</div>


        <div class="row">
            <div class="col-md-3">
                <ul id="categories-list">
                    <li class="nav-item">
                        <a class="nav-link h4 active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
                            aria-controls="pills-home" aria-selected="true">All</a>
                    </li>
                    @foreach ($categories as $row)
                        <li class="nav-item">
                            <a class="nav-link h4" id="category-tab-{{$row->id}}" data-toggle="pill" href="#category-{{$row->id}}"
                                role="tab" aria-controls="pills-profile" aria-selected="false">{{$row->name}}</a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <div class="col-md-9">
                <!-- Rest of your content -->
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
                                {{-- {{ $products->links() }} --}}
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
                                {{-- {{ $products->links() }} --}}
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // Add click event to category tabs
            $('#categories-list a.nav-link').on('click', function (e) {
                e.preventDefault();

                // Remove active class from all tabs
                $('#categories-list a.nav-link').removeClass('active');

                // Add active class to the clicked tab
                $(this).addClass('active');

                // Show the corresponding tab content
                var targetTab = $(this).attr('href');
                $('.tab-pane').removeClass('show active');
                $(targetTab).addClass('show active');
            });
        });
    </script>
    @endsection
