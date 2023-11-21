@extends('admin.admin_layouts')
@section('admin_content')
<style>
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
    }

    input:checked+.slider {
        background-color: #1cc88a;
    }

    input:focus+.slider {
        box-shadow: 0 0 1px #1cc88a;
    }

    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }

    .text-bold {
        font-weight: 700;
    }
</style>

    <h1 class="h3 mb-3 text-gray-800">Shop Settings</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">Update Shop Settings</h6>
        </div>
        <form action="{{ route('admin.shop.settings.save') }}" method="post">
            @csrf
            <div class="card-body">

                <div class="form-group d-flex flex-column">
                    <label for="text">Shop Heading</label>
                    <input name="shop_heading" type="text" value="{{ $general_setting->shop_heading }}"
                        class="form-control form-control-sm" placeholder="Enter Shop Heading">
                </div>

                <div class="form-group d-flex flex-column">
                    <label for="text">Shop Title</label>
                    <input name="shop_title" type="text" value="{{ $general_setting->shop_title }}"
                        class="form-control form-control-sm" placeholder="Enter Shop Title">
                </div>

                <div class="form-group d-flex flex-column">
                    <label for="text">Shop Subtitle</label>
                    <textarea name="shop_subtitle" class="form-control form-control-sm" placeholder="Enter Shop Subtitle">{{ $general_setting->shop_subtitle }}
                    </textarea>
                </div>


                <div class="form-group d-flex flex-column">
                    <label for="text">Header Reservation Text</label>
                    <input name="reservation_text" type="text" value="{{ $general_setting->reservation_text }}"
                        class="form-control form-control-sm" placeholder="Enter Header Reservation Text">
                </div>

                <div class="d-flex">
                    <label class="switch mb-3">
                        <input type="checkbox" name='reservation_status' @if ($general_setting->reservation_status=='true') checked @endif>
                        <span class="slider"></span>
                    </label>
                    <span class="mx-2 p-1 mt-1 text-bold">Check if you want to align the items to the center of slider?</span>
                </div>

                <button class="btn btn-success mt-4 d-block">Save Settings</button>
            </div>

        </form>
    </div>
    <script></script>
@endsection
