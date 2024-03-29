@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Projects</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Projects</h6>
            @if (session('id')==1)
                <div class="float-right d-inline">
                    <a href="{{ route('admin.project.create') }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add New</a>
                </div>
            @endif
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>SL</th>
                        <th>Featured Photo</th>
                        <th>Project Name</th>
                        <th>Manage PDF</th>
                        <th>Manage Tasks</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                        @foreach($project as $row)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td><img src="{{ asset('public/uploads/'.$row->project_featured_photo) }}" alt="" class="w_200"></td>
                            <td>{{ $row->project_name }}</td>
                            <td>
                                <a href="{{ URL::to('admin/project/gallery/'.$row->id) }}" class="btn btn-success btn-sm">Manage PDF</a>
                            </td>
                            <td>
                                <a href="{{ URL::to('admin/project/tasks/'.$row->id) }}" class="btn btn-info btn-sm rounded-pill text-center">
                                    Go to Tasks <i class="far fa-arrow-alt-circle-right"></i>
                                </a>
                            </td>
                            <td>
                                @if (session('id')==1)
                                    <a href="{{ URL::to('admin/project/edit/'.$row->id) }}" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i></a>
                                    <a href="{{ URL::to('admin/project/delete/'.$row->id) }}" class="btn btn-danger btn-sm" onClick="return confirm('Are you sure?');"><i class="fas fa-trash-alt"></i></a>
                                @else
                                     <a href="{{ URL::to('admin/project/edit/'.$row->id) }}" class="btn btn-warning btn-sm"><i class="fas fa-eye"></i></a>
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
