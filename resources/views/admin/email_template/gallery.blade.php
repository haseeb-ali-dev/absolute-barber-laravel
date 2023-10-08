@extends('admin.admin_layouts')
@section('admin_content')
    @include('admin.email_template.gallery_css')
    <h1 class="h3 mb-3 text-gray-800">Email Templates Gallery</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Email Templates Gallery</h6>
            @if (session('is_super') == 1)
                <div class="float-right d-inline">
                    <a href="{{ url('admin/email-template/create') }}">
                        <button class="bn632-hover bn22"><i class="fa fa-plus mr-2"></i>Create New Template</button>
                    </a>
                </div>
            @endif
        </div>
        <div class="card-body">
            <div class="d-flex" style="flex-wrap: wrap;">
                @foreach ($templates as $row)
                    <div class="card m-2" style="width: 245px;">
                        <div class="card-container">
                            <img src="{{ isset($row->thumbnail) ? asset('public/uploads/' . $row->thumbnail) : 'https://dummyimage.com/245x300/e8e8e8/000000.png&text=No+thumbnail+found' }}"
                                class="card-img-top" alt="Thumbnail">

                            @if (session('is_super') == 1)
                                <div class="edit-button text-center">
                                    <a href="{{ URL::to('admin/email-template/edit/' . $row->id) }}"
                                        class="btn btn-primary rounded-pill px-4 btn-sm">Edit</a>

                                    <a href="{{ route('admin.email_template.delete', ['id' => $row->id]) }}"
                                        class="btn btn-danger rounded-pill px-4 btn-sm mt-2"
                                        onclick="return confirm('Are you to delete this template?')">Delete</a>
                                </div>
                            @else
                                <a href="{{ route('admin.email_template.select', ['template_id' => $row->id]) }}"
                                    class="btn btn-success rounded-pill px-4 edit-button">Select</a>
                            @endif
                        </div>
                        <h6 class="text-center py-3">{{ $row->et_name }}</h6>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection
