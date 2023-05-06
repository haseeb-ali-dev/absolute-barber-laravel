@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Menus</h1>

    <form action="{{ url('admin/menu/update') }}" method="post">
        @csrf
        <div class="row">
            <div class="col-md-8">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 mt-2 font-weight-bold text-primary">View Menus</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Menu Name</th>
                                    <th>Menu Status</th>
                                    <th width='200'>Sub Menu</th>
                                </tr>
                                </thead>
                                <tbody>
                                    @foreach($menus as $row)
                                    <input type="hidden" name="menu_id[]" value="{{ $row->id }}">
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            <input type="text" name="menu_name[]" value="{{ $row->menu_name }}" class="form-control" required>
                                        </td>
                                        <td>
                                            <select name="menu_status[]" class="form-control">
                                                <option value="Show" @if($row->menu_status == 'Show') selected @endif>Show</option>
                                                <option value="Hide" @if($row->menu_status == 'Hide') selected @endif>Hide</option>
                                            </select>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                @if ($row->parent_id == null)
                                                    <button class="btn btn-sm btn-info" type="button" data-toggle="modal" data-target="#submenu-{{$row->id}}">
                                                        See and Change
                                                    </button>
                                                @endif
                                                @if (count($row->sub_menu) > 0)
                                                <div class="mt-1">
                                                    @foreach ($row->sub_menu as $sub)
                                                        <small class="p-1 m-1 border border-info border-3 d-inline-flex">{{ $sub->menu_name }}</small>
                                                    @endforeach
                                                </div>
                                                @endif
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <button type="submit" class="btn btn-success">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    {{-- To avoid main form submit and to load all modals--}}
    @foreach($menus as $row)
        @include('admin.menu.submenu',['row' => $row, 'option' => $options])
    @endforeach

@endsection
