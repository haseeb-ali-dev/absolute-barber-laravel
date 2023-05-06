@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Messages (Contact Us)</h1>

    <div class="row">
        <div class="col-md-9">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 mt-2 font-weight-bold text-primary">View Messages</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>SL</th>
                                <th>Contact Name</th>
                                <th>Phone Number</th>
                                <th>Organization Name</th>
                                <th>Type</th>
                                <th>Message</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($messages as $row)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>{{ $row->phone }}</td>
                                    <td>{{ $row->organization }}</td>
                                    <td>{{ $row->option }}</td>
                                    <td>{{ $row->info }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 mt-2 font-weight-bold text-primary">Options</h6>
                    <div class="float-right d-inline">
                        <a href="javascript:;" class="btn btn-primary btn-sm" onclick="$('#create-option-form').toggle()"><i class="fa fa-plus"></i></a>
                    </div>
                </div>
                <div class="card-body">
                    <div id="create-option-form" style="display:none;">
                        <form action="{{route('admin.message.option.store')}}" method="post">
                            @csrf
                            <input type="text" name="name" class="form-control">
                            <input type="submit" value="Add" class="btn btn-sm btn-primary my-2">
                        </form>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($options as $row)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $row->name }}</td>
                                    <td>
                                        <form action="{{route('admin.message.option.delete', $row->id)}}" method="post">
                                            @csrf
                                            @method('DELETE')
                                            <button type="button" class="btn btn-sm text-danger border-0 far fa-trash-alt m-0" onclick="if(confirm('Are u sure?')){$(form).submit()}"></button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection
