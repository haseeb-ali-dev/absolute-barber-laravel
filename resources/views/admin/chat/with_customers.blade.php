@extends('admin.admin_layouts')
@section('admin_content')
    @includeIf('admin.chat.stylings', ['type' => 'customer'])

    <h1 class="h3 mb-3 text-gray-800">Chat with Customers</h1>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 mt-2 font-weight-bold text-primary">View Messages</h6>
            <div class="float-right d-inline">
                <a href="{{ route('admin.chat.new.message', 'type=' . Crypt::encrypt('customer')) }}"
                    class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> New Message</a>
            </div>
        </div>
        <div class="card-body px-0">
            <div class="container-fluid chats">
                <div class="users-list">
                    <h5>Customers</h5>
                    @forelse ($users as $row)
                        <div class="user">
                            <a class="btn p-0 my-0"
                                href="{{ route('admin.customers.chat', 'id=' . Crypt::encrypt($row->id)) }}">{{ ucwords($row->customer_name) }}</a>
                        </div>
                    @empty
                        <small>No Chat Found</small>
                    @endforelse
                </div>
                <div class="chat-box">
                    <div class="container-fluid">
                        @if (isset($customer))
                            <h4>Chat with {{ $customer->customer_name }}</h4>
                            <div class="chat-container">
                                @foreach ($messages as $row)
                                    <div
                                        class="message @if ($row->sent_by === 'admin') admin-message @else customer-message @endif">
                                        <div class="message-content">
                                            <small class="username">
                                                {{ $row->sent_by === 'admin' ? session('name') : $customer->customer_name }}</small>
                                            <p class="message-text">{!! $row->msg !!}</p>
                                            <small class="message-time">
                                                {{ $row->created_at->format('M d, Y h:i A') }}
                                            </small>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                            <form action="{{ route('admin.chat.store') }}" method="post">
                                @csrf
                                <input type="hidden" name="type" value="{{ Crypt::encrypt('customer') }}">
                                <input type="hidden" name="sent_by" value="admin">
                                <input type="hidden" name="customer_id" value="{{ $customer->id }}">
                                <textarea name="msg" class="form-control" placeholder="Start typing here..."></textarea>
                                <button type="submit" class="btn btn-success mt-1">Send</button>
                            </form>
                        @else
                            <span>
                                No messages found
                                <a class="mx-2"
                                    href="{{ route('admin.chat.new.message', 'type=' . Crypt::encrypt('customer')) }}"><i
                                        class="fa fa-plus"></i> Please Start Chating
                                    here..</a>
                            </span>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
