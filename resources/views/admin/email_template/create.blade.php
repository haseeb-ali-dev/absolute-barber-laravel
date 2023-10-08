@extends('admin.admin_layouts')
@section('admin_content')
    <style>
        .custom-file-upload {
            display: inline-block;
            padding: 10px 20px;
            background-color: #36b9cc;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .custom-file-upload input[type="file"] {
            display: none;
        }

        .custom-file-upload:hover {
            background-color: #36b9cc;
        }
    </style>
    <h1 class="h3 mb-3 text-gray-800">Add Email Template</h1>

    <form action="{{ url('admin/email-template/store') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 mt-2 font-weight-bold text-primary">Add Email Template</h6>
                <div class="float-right d-inline">
                    @if (session('is_super') == 1)
                        <a href="{{ route('admin.email_template.gallery') }}"
                            class="btn btn-primary btn-sm rounded-pill px-3">
                            <i class="fa fa-arrow-left mr-2"></i> Back To Gallery</a>
                    @else
                        <a href="{{ route('admin.email_template.index', ['et_type' => 'emailer']) }}"
                            class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> View All</a>
                    @endif
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Template Name *</label>
                            <input type="text" name="et_name" class="form-control" value="{{ old('et_name') }}"
                                autofocus>
                        </div>

                        <div class="form-group">
                            <label for="">Subject *</label>
                            <input type="text" name="et_subject" class="form-control" value="{{ old('et_subject') }}"
                                autofocus>
                        </div>
                        <div class="form-group">
                            <label for="">Message *</label>
                            <textarea name="et_content" class="form-control editor" cols="30" rows="10" id="et_content">{{ old('et_content') }}</textarea>

                            <div class="d-flex justify-content-between">
                                <div>
                                    <div class="font-weight-bold mt_20 text-danger">Parameters You Can Use: </div>
                                    <div><button class="btn btn-sm btn-secondary my-1" type="button"
                                            onclick="addTag('[[recipient_name]]')">[[recipient_name]]</button> = Recipient
                                        Name
                                    </div>
                                    <div><button class="btn btn-sm btn-secondary my-1" type="button"
                                            onclick="addTag('[[recipient_name]]')">[[recipient_email]]</button> = Recipient
                                        Email
                                    </div>
                                </div>
                                <div class="form-group text-center mt_20">
                                    <label for="fileInput" class="custom-file-upload">
                                        <input type="file" id="fileInput" name="thumbnail" accept=".png, .jpg, .jpeg">
                                        Upload Gallery Image as thumbnail <i class="fa fa-file mx-3"></i>
                                    </label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Save</button>
            </div>
        </div>
    </form>

    <script>
        function addTag(tag_name) {
            $("#et_content").summernote('editor.saveRange');
            $("#et_content").summernote('editor.restoreRange');
            $("#et_content").summernote('editor.focus');
            $("#et_content").summernote('editor.insertText', tag_name);
        }
    </script>
@endsection
