@extends('admin.admin_layouts')
@section('admin_content')
    @php
        $status = ['draft' => 'Draft', 'sent' => 'Sent', 'pending' => 'Pending'];
        $selected_recipients = $data->recipients->modelKeys();
    @endphp
    <h1 class="h3 mb-3 text-gray-800">Add Campaign</h1>

    <form action="{{ route('admin.campaign.update', ['campaign' => $data]) }}" method="post">
        @csrf
        @method('PUT')
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
                    <input type="text" name="name" class="form-control" value="{{ $data->name ?? old('name') }}"
                        autofocus>
                </div>
                <div class="form-group">
                    <label for="">Campaign Status *</label>
                    <select name="status" class="form-control select2" required>
                        @foreach ($status as $key => $value)
                            <option value="{{ $key }}" @if ($data->status == $key) selected @endif>
                                {{ $value }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="">Campaign Description</label>
                    <select name="recipients_id[]" class="form-control select2" required multiple>
                        @foreach ($recipients as $key => $value)
                            <option value="{{ $key }}" @if (in_array($key, $selected_recipients)) selected @endif>
                                {{ $value }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>
@endsection
