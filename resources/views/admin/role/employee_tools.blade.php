@extends('admin.admin_layouts')
@section('admin_content')
    <style>
        .col {
            /* Set the width of the parent div */
            width: 200px;
            /* Set the height of the parent div */
            height: 45px;
        }

        .image {
            /* Set the maximum width and height to 100% of the parent div's dimensions */
            max-width: 100%;
            max-height: 100%;
        }

        .checkboxx {
            width: 20px;
            height: 20px;
        }
    </style>

    @php
        $tools = [
            ['key' => 'bercoweb', 'img' => asset("public/uploads/$general_settings_global->bercotool_1"), 'name' => 'Bercoweb', 'icon' => 'fas fa-cog', 'code' => 1],
            ['key' => 'bercostore', 'img' => asset("public/uploads/$general_settings_global->bercotool_2"), 'name' => 'Bercostore', 'icon' => 'fas fa-shopping-cart', 'code' => 2],
            [
                'key' => 'subscriber',
                'img' => asset("public/uploads/$general_settings_global->bercotool_3"),
                'name' => 'Subscriber Section',
                'icon' => 'fas fa-share-alt-square',
                'code' => 3,
            ],
            ['key' => 'administration', 'img' => asset("public/uploads/$general_settings_global->bercotool_4"), 'name' => 'Administration Users', 'icon' => 'fas fa-user-secret', 'code' => 4],
            ['route' => route('admin.landing_page_contact_setting'), 'img' => asset("public/uploads/$general_settings_global->bercotool_5"), 'icon' => 'fa fa-users', 'code' => 5],
            ['route' => route('admin.excel.import'), 'img' => asset("public/uploads/$general_settings_global->bercotool_6"), 'icon' => 'fas fa-users', 'code' => 6],
            ['route' => route('signature-pad.draw'), 'img' => asset("public/uploads/$general_settings_global->bercotool_7"), 'icon' => 'fa fa-sticky-note', 'code' => 7],
            ['route' => route('admin.landing_page_messages'), 'img' => asset("public/uploads/$general_settings_global->bercotool_8"), 'icon' => 'fas fa-users', 'code' => 8],
            ['route' => route('admin.compose_document'), 'img' => asset("public/uploads/$general_settings_global->bercotool_9"), 'icon' => 'fas fa-file', 'code' => 9],
            ['route' => route('file-manager.index'), 'img' => asset("public/uploads/$general_settings_global->bercotool_10"), 'icon' => 'fas fa-archive', 'code' => 10],
            ['key' => 'blogsection', 'img' => asset("public/uploads/$general_settings_global->bercotool_11"), 'name' => 'BercoBlog', 'icon' => 'fas fa-cog', 'code' => 11],
            ['route' => route('invoice-builder.index'), 'img' => asset("public/uploads/$general_settings_global->bercotool_12"), 'icon' => 'fas fa-cog', 'code' => 12],
            ['route' => route('admin.employees.chat'), 'img' => $general_settings_global->bercotool_13 ? asset("public/uploads/$general_settings_global->bercotool_13") : 'https://placehold.co/1600x400?text=Chat+with+Employees', 'icon' => 'fas fa-cog', 'code' => 13],
            ['route' => route('admin.customers.chat'), 'img' => $general_settings_global->bercotool_14 ? asset("public/uploads/$general_settings_global->bercotool_14") : 'https://placehold.co/1600x400?text=Chat+with+Customers', 'icon' => 'fas fa-cog', 'code' => 14],
            ['route' => route('admin.reservations'), 'img' => $general_settings_global->bercotool_15 ? asset("public/uploads/$general_settings_global->bercotool_15") : 'https://placehold.co/1600x400?text=Reservations', 'icon' => 'fas fa-cog', 'code' => 15],
            ['route' => route('admin.appointments'), 'img' => $general_settings_global->bercotool_16 ? asset("public/uploads/$general_settings_global->bercotool_16") : 'https://placehold.co/1600x400?text=Appointments', 'icon' => 'fas fa-cog', 'code' => 16],
            ['route' => route('admin.customer.index'), 'img' => $general_settings_global->bercotool_17 ? asset("public/uploads/$general_settings_global->bercotool_17") : 'https://placehold.co/1600x400?text=Registered+Customers', 'icon' => 'fas fa-cog', 'code' => 17],
            ['route' => route('admin.order.index'), 'img' => $general_settings_global->bercotool_18 ? asset("public/uploads/$general_settings_global->bercotool_18") : 'https://placehold.co/1600x400?text=Display+Orders', 'icon' => 'fas fa-cog', 'code' => 18],
            ['route' => route('admin.order.index'), 'img' => $general_settings_global->bercotool_19 ? asset("public/uploads/$general_settings_global->bercotool_19") : 'https://placehold.co/1600x400?text=Contact+Form+informaton', 'icon' => 'fas fa-cog', 'code' => 19],
            ['route' => route('admin.video_conference.index'), 'img' => $general_settings_global->bercotool_20 ? asset("public/uploads/$general_settings_global->bercotool_20") : 'https://placehold.co/1600x400?text=Video+Conference', 'icon' => 'fas fa-cog', 'code' => 20],
        ];
    @endphp

    <h1 class="h3 mb-3 text-gray-800">Assign Tools for Employees</h1>

    <form action="{{ route('admin.employee.tools.set') }}" method="post">
        @csrf
        <input type="hidden" name="user_id" value="{{ $id }}">
        <div class="row">
            <div class="col-md-10">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 mt-2 font-weight-bold text-primary">Assign Tools to Employee / User</h6>
                        <div class="float-right d-inline">
                            <a href="{{ route('admin.role.user') }}" class="btn btn-secondary btn-sm"><i
                                    class="fas fa-arrow-left mr-2"></i> View All</a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @foreach ($tools as $row)
                                <div class="col-md-4">

                                    <div class="d-flex align-items-center border my-2 py-2 px-3">

                                        <input type="checkbox" name="codes[]" value="{{ $row['code'] }}"
                                            @if (in_array($row['code'], $assigned)) checked @endif class="checkboxx">

                                        <div class="col">
                                            @if (isset($row['img']))
                                                <img src="{{ asset($row['img']) }}" alt="" class="image">
                                            @else
                                                <h3>{{ $row['name'] ?? 'No Name' }}</h3>
                                            @endif
                                        </div>
                                    </div>

                                </div>
                            @endforeach
                        </div>
                        <button type="submit" class="btn btn-success">Assign</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
@endsection
