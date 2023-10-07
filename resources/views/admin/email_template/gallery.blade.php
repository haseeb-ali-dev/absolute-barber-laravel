@extends('admin.admin_layouts')
@section('admin_content')
    <style>
        .edit-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: none;
        }

        .card-container {
            position: relative;
            overflow: hidden;
            width: 100%;
            height: 300px;
        }

        .card-container img {
            transition: filter 0.1s ease;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card-container:hover .edit-button {
            display: block;
        }

        .card-container:hover img {
            filter: blur(3px);
        }
    </style>
    <h1 class="h3 mb-3 text-gray-800">Email Templates Gallery</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Email Templates Gallery</h6>
        </div>
        <div class="card-body">
            <div class="d-flex" style="flex-wrap: wrap;">
                @foreach ($templates as $row)
                    <div class="card m-2" style="width: 245px;">
                        <div class="card-container">
                            <img src="{{ isset($row->thumbnail) ? asset('public/uploads/' . $row->thumbnail) : 'https://dummyimage.com/245x300/e8e8e8/000000.png&text=No+thumbnail+found' }}"
                                class="card-img-top" alt="Thumbnail">
                            <a href="{{ route('admin.email_template.select', ['template_id' => $row->id]) }}"
                                class="btn btn-success rounded-pill px-4 edit-button">Select</a>
                        </div>
                        <h6 class="text-center py-3">{{ $row->et_name }}</h6>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection
