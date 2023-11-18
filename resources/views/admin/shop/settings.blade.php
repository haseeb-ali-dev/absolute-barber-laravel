@extends('admin.admin_layouts')
@section('admin_content')
    <style>

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

                <button class="btn btn-success mt-4 d-block">Save Settings</button>
            </div>

        </form>
    </div>
    <script></script>
@endsection
