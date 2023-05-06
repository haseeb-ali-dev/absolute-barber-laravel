@extends('admin.admin_layouts')

@section('admin_content')
    <style>.col {
        /* Set the width of the parent div */
        width: 300px;
        /* Set the height of the parent div */
        height: 70px;
      }
      
      .image {
        /* Set the maximum width and height to 100% of the parent div's dimensions */
        max-width: 100%;
        max-height: 100%;
      }</style>
    @php
    $total_post = DB::table('blogs')->count();
    $total_projects = DB::table('projects')->count();
    $total_services = DB::table('services')->count();
    $total_team_members = DB::table('team_members')->count();
    $total_photos = DB::table('photos')->count();
    $total_videos = DB::table('videos')->count();
    $total_completed_orders = DB::table('orders')->where('payment_status','Completed')->count();
    $total_pending_orders = DB::table('orders')->where('payment_status','Pending')->count();
    @endphp

    <div class="row">
        <div class="col-xl-12 col-md-12 mb-2">
            <h1 class="h3 mb-3 text-gray-800">Dashboard</h1>
        </div>
    </div>

    <!-- Box Start -->
    <div class="row dashboard-page">

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <a href="{{ route('admin.landing_page_contact_setting') }}"><img src="{{ asset('public/uploads/1_1.png') }}" alt="" class="image"></a>
                          </div>
                        <div class="col-auto">
                            <i class="fa fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <a href="{{ route('admin.excel.import') }}"><img src="{{ asset('public/uploads/2_2.png') }}" alt="" class="image"></a>
                          </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <a href="{{ route('signature-pad.draw') }}"><img src="{{ asset('public/uploads/3_3.png') }}" alt="" class="image"></a>
                          </div>
                        <div class="col-auto">
                            <i class="fa fa-sticky-note fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <a href="{{ route('admin.landing_page_messages') }}"><img src="{{ asset('public/uploads/4_4.png') }}" alt="" class="image"></a>
                          </div>
                        <div class="col-auto">
                            <i class="fas fa-users fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <a href="{{ route('admin.compose_document') }}"><img src="{{ asset('public/uploads/5_5.png') }}" alt="" class="image"></a>
                          </div>
                        <div class="col-auto">
                            <i class="fas fa-file fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <a href="{{ route('file-manager.index') }}"><img src="{{ asset('public/uploads/6_6.png') }}" alt="" class="image"></a>
                          </div>
                        <div class="col-auto">
                            <i class="fas fa-archive fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        

        

    </div>
    <!-- // Box End -->
@endsection
