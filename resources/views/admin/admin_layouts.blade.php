<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Admin Panel</title>

    @include('admin.includes.styles')

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Sen:wght@400;700&display=swap" rel="stylesheet">

    @include('admin.includes.scripts')

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion  id="accordionSidebar">

         <!-- Sidebar - Brand -->
         <img class="img-profile" style="width: {{$general_settings_global->admin_logo_width}}px;height: {{$general_settings_global->admin_logo_height}}px;" src="{{ asset("public/uploads/$general_settings_global->admin_logo") }}">

        <!-- Divider -->
        <hr class="sidebar-divider my-0">


        @if(session('is_super') == 0)
        @php


        $url = Request::path();
        $conName = explode('/',$url);
        if(!isset($conName[3]))
        {
            $conName[3] = '';
        }
        if(!isset($conName[2]))
        {
            $conName[2] = '';
        }
        @endphp


        {{-- {{dd($conName)}} --}}
        @php

            if(Request::path()=='import_excel_contacts')
                {

                    $conName[1] = 'import_excel_contacts';
                }

                if(Request::path()=='admin_manual_messages')
                {

                    $conName[1] = 'admin_manual_messages';
                }
                if(Request::path()=='landing_page_messages')
                {

                    $conName[1] = 'landing_page_messages';
                }
                if(Request::path()=='compose_document')
                {

                    $conName[1] = 'compose_document';
                }
                if(Request::path()=='tools')
                {

                    $conName[1] = 'tools';
                }
                if(Request::path()=='file-manager')
                {

                    $conName[1] = 'file-manager';
                }
        @endphp
     

        <li  class="nav-item active">
            <a class="nav-link" href="{{ route('admin.tools') }}">
                {{-- <i class="fas fa-photo-video"></i> --}}
                <span>Bercotools</span>
            </a>
        </li> 
        
        <li  class="nav-item active">
            <a class="nav-link" href="{{ route('admin.profile_change') }}">
                {{-- <i class="fas fa-photo-video"></i> --}}
                <span>Profile</span>
            </a>
        </li>
        
        <li  class="nav-item active">
            <a class="nav-link" href="#">
                {{-- <i class="fas fa-photo-video"></i> --}}
                <span>MailBox</span>
            </a>
        </li>
        <!-- Admin Users Section -->
   
        <li class="nav-item  active ">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAdminUser" aria-expanded="true" aria-controls="collapseAdminUser">
                {{-- <i class="fas fa-user-secret"></i> --}}
                <span>Payments</span>
            </a>
            <div id="collapseAdminUser" class="collapse show" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="{{ route('admin.plan_payment') }}">Billing</a>
                    <a class="collapse-item" href="{{ route('admin.plan_payment_history') }}">Purchase History</a>
                    <a class="collapse-item" href="#">Invoice</a>
                </div>
            </div>
        </li>
        


        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

        @else

        <li class="nav-item active">
            <a class="nav-link" href="{{ route('superadmin.message.limit') }}">
                <i class="fas fa-sliders-h"></i>
                <span>Message Limits</span>
            </a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="{{ route('superadmin.landing_page_images') }}">
                <i class="fas fa-image"></i>
                <span>Landing Page Images</span>
            </a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="{{ route('superadmin.landing_page_left_images') }}">
                <i class="fas fa-photo-video"></i>
                <span>Left Side Images</span>
            </a>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="{{ route('superadmin.logo') }}">
                <i class="fas fa-photo-video"></i>
                <span>Admin Logo</span>
            </a>
        </li>


        <li class="nav-item active">
            <a class="nav-link" href="{{ route('admin.plan_payment') }}">
                <i class="fas fa-photo-video"></i>
                <span>Admin Billing</span>
            </a>
        </li>

        @endif
    </ul>
    <!-- End of Sidebar -->


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="btn btn-success btn-sm mt-3" href="{{ route('admin.tools') }}">
                            <i class="fa fa-arrow-left"></i> Back to Dashoboard
                        </a>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <a class="btn btn-info btn-sm mt-3" href="{{ url('/') }}" target="_blank">
                            Visit Website
                        </a>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ session('name') }}</span>
                            <img class="img-profile rounded-circle" src="{{ asset('public/uploads/'.session('photo')) }}">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">

                            @if(session('id') == 1)
                            <a class="dropdown-item" href="{{ route('admin.profile_change') }}">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Change Profile
                            </a>
                            @endif

                            <a class="dropdown-item" href="{{ route('admin.password_change') }}">
                                <i class="fas fa-unlock-alt fa-sm fa-fw mr-2 text-gray-400"></i> Change Password
                            </a>
                            <a class="dropdown-item" href="{{ route('admin.photo_change') }}">
                                <i class="fas fa-image fa-sm fa-fw mr-2 text-gray-400"></i> Change Photo
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="{{ route('admin.logout') }}">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- End of Topbar -->
            <!-- Begin Page Content -->
            <div class="container-fluid">

                @yield('admin_content')

            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

@include('admin.includes.scripts-footer')

</body>
</html>
