@extends('admin.admin_layouts')
@section('admin_content')
    <style>
        .select2-container--default .select2-selection--multiple {
            height: 40px;
        }
    </style>
    <h1 class="h3 mb-3 text-gray-800">Sending Email.....</h1>

    <form action="{{ route('admin.email_template.send') }}" method="post">
        @csrf
        <input type="hidden" name="ref_template_id" value="{{ $template->id }}">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 mt-2 font-weight-bold text-primary">Compose Email</h6>
                <div class="float-right d-inline">
                    <a href="{{ route('admin.email_template.gallery') }}" class="btn btn-primary btn-sm rounded-pill px-3">
                        <i class="fa fa-arrow-left mr-2"></i> Back To Gallery</a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">Email Subject *</label>
                            <input type="text" name="et_subject" class="form-control" value="{{ $template->et_subject }}"
                                autofocus>
                        </div>
                        <div class="form-group">
                            <label for="">Select Users Groups</label>
                            <select name="recipients_id[]" class="form-control select3" required multiple>
                                <optgroup label="Default Groups">
                                    <option value="recipients">Recipients</option>
                                    <option value="subscribers">Subscribers</option>
                                    <option value="landing_page">Landingpage Contacts</option>
                                    {{-- <option value="external_data">External Data</option> --}}
                                </optgroup>
                                @if (sizeOf($custom_groups) > 0)
                                    <optgroup label="Added Groups">
                                        @foreach ($custom_groups as $key => $value)
                                            <option value="{{ $key }}">{{ $value }}</option>
                                        @endforeach
                                    </optgroup>
                                @endif
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Email Message *</label>
                            <textarea name="et_content" class="form-control editor" cols="30" rows="10" id="et_content">{{ $template->et_content }}</textarea>

                            <div class="custom-control custom-switch float-right mt-2">
                                <input type="checkbox" class="custom-control-input" id="customSwitch1" name="modified">
                                <label class="custom-control-label" for="customSwitch1">Save this changes as
                                    template</label>
                            </div>

                            <div class="d-flex align-items-center mt_20">

                                <div class="font-weight-bold text-danger">Parameters You Can Use: </div>
                                <div><button class="btn btn-sm btn-secondary ml-4" type="button"
                                        onclick="addTag('[[recipient_name]]')">[[recipient_name]]</button> =
                                    Recipient
                                    Name
                                </div>
                                <div><button class="btn btn-sm btn-secondary ml-4" type="button"
                                        onclick="addTag('[[recipient_name]]')">[[recipient_email]]</button> =
                                    Recipient
                                    Email
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success px-5 rounded-pill float-right">
                    <i class="fa fa-paper-plane mr-2"></i> Send
                </button>
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
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $('.select2').select2({
            placeholder: 'Please Choose Status',
        });
        $('.select3').select2({
            placeholder: 'Please select recipients',
            multiple: true,
            allowClear: true,
            minimumResultsForSearch: 5
        });
    </script>
@endsection
