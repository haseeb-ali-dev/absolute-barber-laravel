@extends('admin.admin_layouts')
@section('admin_content')
    @php
        $status = ['draft' => 'Draft', 'sent' => 'Sent'];
    @endphp
    <h1 class="h3 mb-3 text-gray-800">Add Campaign</h1>

    <form action="{{ route('admin.campaign.store') }}" method="post">
        @csrf
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 mt-2 font-weight-bold text-primary">Add Campaign</h6>
                <div class="float-right d-inline">
                    <a href="{{ route('admin.campaign.index') }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>
                        View All</a>
                </div>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="">Campaign Name *</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name') }}" autofocus>
                </div>
                <div class="form-group">
                    <label for="">Campaign Status *</label>
                    <select name="status" class="form-control select2" required>
                        <option value=""></option>
                        @foreach ($status as $key => $value)
                            <option value="{{ $key }}">{{ $value }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="">Email Template *</label>
                    <select name="template_id" class="form-control select2" required>
                        <option value=""></option>
                        @foreach ($templates as $row)
                            <option value="{{ $row['id'] }}">
                                {{ $row['et_name'] . ' (Subject: ' . $row['et_subject'] . ')' }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="">Campaign Description</label>
                    <select name="recipients_id[]" class="form-control select3" required multiple>
                        {{-- @foreach ($recipients as $key => $value)
                            <option value="{{ $key }}">{{ $value }}</option>
                        @endforeach --}}
                        <option value="recipients">Recipients</option>
                        <option value="subscribers">Subscribers</option>
                        <option value="landing_page">Landingpage Contacts</option>
                        <option value="external_data">External Data</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>

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
