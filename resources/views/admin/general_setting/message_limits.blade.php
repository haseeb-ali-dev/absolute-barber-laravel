@extends('admin.admin_layouts')
@section('admin_content')

<h1 class="h3 mb-3 text-gray-800">Message Limits Settings</h1>

<form action="{{ url('superadmin/message/limit') }}" method="post">
    @csrf
    <div class="card shadow mb-4">
        <div class="card-body">

            <input type="hidden" name="id" value="{{ $limits->id }}">

            <div class="form-group d-flex align-items-center">
                <label for="sms">SMS Limit</label>
                <input type="number" name="sms" id="sms" class="form-control form-control-sm mx-3" min="1"
                    value="{{ $limits->sms }}">
            </div>

            <div class="form-group d-flex align-items-center">
                <label for="whatsapp">Whatsapp Limit</label>
                <input type="number" name="whatsapp" id="whatsapp" class="form-control form-control-sm mx-3"
                    min="1" value="{{ $limits->whatsapp }}">
            </div>


            <button type="submit" class="btn btn-success">Update</button>
        </div>
    </div>
</form>

@endsection
