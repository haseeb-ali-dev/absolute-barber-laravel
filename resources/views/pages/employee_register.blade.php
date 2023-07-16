@extends('layouts.app')

@section('content')
<div class="page-banner" style="background-image: url({{ asset('public/uploads/'.$g_setting->banner_registration) }})">
    <div class="bg-page"></div>
    <div class="text">
        <h1>Employee Registration</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Employee Registration</li>
            </ol>
        </nav>
    </div>
</div>

<div class="page-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="reg-login-form">
                    <div class="inner">
                        <form action="{{ route('admin.role.user-store') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="role_id" value="{{ $role }}">
                            <input type="hidden" name="from" value="website">
                            <div class="form-group">
                                <label for="">Name *</label>
                                <input type="text" name="name" class="form-control" value="{{ old('name') }}" autofocus>
                            </div>
                            <div class="form-group">
                                <label for="">Email *</label>
                                <input type="email" name="email" class="form-control" value="{{ old('email') }}">
                            </div>
                            <div class="form-group">
                                <label for="">Photo *</label>
                                <div>
                                    <input type="file" name="photo" accept="image/png, image/gif, image/jpeg, image/jpg">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">Password *</label>
                                <input type="password" name="password" class="form-control"
                                    value="{{ old('password') }}">
                            </div>
                            <div class="form-group">
                                <label for="">Retype Password *</label>
                                <input type="password" name="re_password" class="form-control"
                                    value="{{ old('re_password') }}">
                            </div>
                            <button type="submit" class="btn btn-primary btn-arf">Register as Employee</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
