@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Campaigns</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Campaigns</h6>
            <div class="float-right d-inline">
                <a href="{{ route('admin.campaign.create') }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add
                    New</a>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Campaign Name</th>
                            <th>Campaign Template</th>
                            <th>Campaign Status</th>
                            <th>Campaign Recipients</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data as $row)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $row->name }}</td>
                                <td style="font-style: italic;">
                                    {{ isset($row->template) ? $row->template->et_name . ' (Subject: ' . $row->template->et_subject . ')' : '--' }}
                                </td>
                                <td> <span class="badge badge-pill badge-info px-2 py-1">{{ $row->status }}</span></td>
                                <td>
                                    @forelse ($row->recipients as $recipient)
                                        <span class="badge badge-primary p-2"
                                            style="font-size: 14px;letter-spacing: 1px;">{{ $recipient->name . '  (' . $recipient->email . ')' }}</span>
                                    @empty
                                        <span>-</span>
                                    @endforelse
                                </td>
                                <td>
                                    <a href="{{ route('admin.campaign.edit', ['campaign' => $row]) }}"
                                        class="btn btn-warning btn-sm"><i class="fas fa-edit"></i></a>
                                    <form action="{{ route('admin.campaign.destroy', ['campaign' => $row]) }}"
                                        method="POST" class="d-inline-flex">
                                        @method('DELETE')
                                        @csrf
                                        <button type="button" class="btn btn-danger btn-sm"
                                            onclick="if(confirm('Are you sure?')){$(form).submit();}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                    @if ($row->status == 'sent')
                                        <span class="p-2 border border-success text-success">
                                            <i class="fas fa-check"></i> Already Sent
                                        </span>
                                    @else
                                        @if (isset($row->template))
                                            <form action="{{ route('admin.campaign.send', ['campaign' => $row]) }}"
                                                method="POST" class="d-inline-flex">
                                                @csrf
                                                <button type="button" class="btn btn-info btn-sm"
                                                    onclick="if(confirm('Are you sure to start this Campaign?')){$(form).submit();}">
                                                    <i class="fas fa-paper-plane"></i>
                                                    Send
                                                </button>
                                            </form>
                                        @else
                                            <small class="p-2 border">
                                                <i class="fas fa-exclamation-circle"></i> First Set Template
                                            </small>
                                        @endif
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
