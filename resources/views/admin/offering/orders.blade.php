@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Service Orders</h1>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Service Orders</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Order Number</th>
                            <th>Service Name</th>
                            <th>Client Detail (Name, Email, Phone)</th>
                            <th>Paid Amount</th>
                            <th>Fee Amount</th>
                            <th>Net Amount</th>
                            <th>Payment Type</th>
                            <th>Service Type</th>
                            <th>Appointment Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($orders as $row)
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center justify-content-between">
                                        {{ $loop->iteration }}
                                        @if (\Carbon\Carbon::parse($row->created_at)->diffInMinutes(now()) < 1440)
                                            <img src="{{ asset('public/frontend/images/new_order.gif') }}" alt="gif"
                                                width="35" height="35">
                                        @endif
                                    </div>
                                </td>
                                <td>{{ $row->order_no }}</td>
                                <td>{{ $row->offering_name }}</td>
                                <td>
                                    {{ $row->client_fname }} {{ $row->client_lname }}<br>
                                    {{ $row->client_email }}<br>
                                    {{ $row->client_phone }}
                                </td>
                                <td>${{ $row->paid_amount }}</td>
                                <td>${{ $row->fee_amount }}</td>
                                <td>${{ $row->net_amount }}</td>
                                <td>{{ ucwords($row->payment_type) }}</td>
                                <td>{{ $row->is_appointed ? 'Appointment' : 'Regular' }}</td>
                                <td>
                                    @if ($row->is_appointed)
                                        {{ \Carbon\Carbon::parse($row->appointment_date)->format('M d, Y') }}<br>
                                        {{ $row->appointment_time }}
                                    @else
                                        ---
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
