@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Appointments</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Appointments</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Information</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data as $row)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $row->name }}</td>
                                <td>{{ $row->email }}</td>
                                <td>{{ $row->phone }}</td>
                                <td>{{ $row->date }}</td>
                                <td>{{ $row->time }}</td>
                                <td>{{ $row->info }}</td>
                                <td>
                                    <div class="d-flex">
                                        {{-- <button class="btn btn-sm text-success py-0 edit-appointment-btn"
                                            data-url="{{ route('admin.booking.update', ['booking' => $row]) }}"
                                            data-name="{{ $row->name }}" data-email="{{ $row->email }}"
                                            data-phone="{{ $row->phone }}">
                                            <i class="fas fa-pencil-alt"></i> Edit
                                        </button>
                                        <form action="{{ route('admin.booking.delete', ['booking' => $row]) }}"
                                            method="post">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-sm text-danger py-0" type="button"
                                                onclick="if(confirm('Are you sure') == true){$(form).submit()}">
                                                <i class="far fa-trash-alt"></i> Delete
                                            </button>
                                        </form> --}}
                                        <form action="{{ route('admin.booking.status.update', ['booking' => $row]) }}"
                                            method="post">
                                            @csrf
                                            @method('PUT')
                                            <select name="status"
                                                class="btn btn-sm p-0 ml-2 @if ($row->status == 'pending') text-primary border-primary @elseif($row->status == 'cancel') text-danger border-danger @else text-success border-success @endif"
                                                onchange="if(confirm('Are you sure to change status') == true){$(form).submit()}">
                                                <option class="text-primary" value="pending"
                                                    @if ($row->status == 'pending') selected @endif>
                                                    Pending</option>
                                                <option class="text-danger" value="cancel"
                                                    @if ($row->status == 'cancel') selected @endif>
                                                    Cancel</option>
                                                <option class="text-success" value="accept"
                                                    @if ($row->status == 'accept') selected @endif>
                                                    Accept</option>
                                            </select>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="edit_appointment" tabindex="-1" role="dialog" aria-labelledby="edit_appointmentLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="edit_appointmentLabel">Edit Appointment</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="name">Name*</label>
                            <input type="text" class="form-control" name="name" placeholder="name">
                        </div>
                        <div class="form-group">
                            <label for="email">Email*</label>
                            <input type="email" class="form-control" name="email" placeholder="email">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone*</label>
                            <input type="test" class="form-control" name="phone" placeholder="phone">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary pull-right float-right">Update</button>
                            <button type="button" class="btn float-right" data-dismiss="modal" aria-label="Close">
                                Cancel
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('.edit-appointment-btn').click(function() {
            // Set values to form and its inputs
            $("#edit_appointment form").attr('action', $(this).data('url'));
            $("#edit_appointment input[name='name']").val($(this).data('name'));
            $("#edit_appointment input[name='email']").val($(this).data('email'));
            $("#edit_appointment input[name='phone']").val($(this).data('phone'));
            // Show modal
            $("#edit_appointment").modal('show');
        });
    </script>
@endsection
