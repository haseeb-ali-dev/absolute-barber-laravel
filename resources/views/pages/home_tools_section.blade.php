@if ($page_home->team_member_status == 'Show')

<style>
    .team-photo {
        width: 250px; /* Adjust the width and height as needed */
        height: 250px;
        border-radius: 50%; /* Make the container circular */
        overflow: hidden;
    }

    .team-photo .tool_img {
        display: block;
        width: 100%;
        height: 100%;
        padding: 10px;
        border-radius: 50%; /* Make the container circular */
        overflow: hidden;
        border: 1px gray solid;
    }

    .team-photo .tool_img img {
        width: 100%;
        height: 100%;
        object-fit: contain; /* Ensure the image fits while maintaining aspect ratio */
    }
</style>

    @php
        $tools = [
            ['key' => 'bercoweb', 'img' => asset("public/uploads/$general_settings_global->bercotool_1"), 'name' => 'Bercoweb', 'code' => 1],
            ['key' => 'bercostore', 'img' => asset("public/uploads/$general_settings_global->bercotool_2"), 'name' => 'Bercostore', 'code' => 2],
            [
                'key' => 'subscriber',
                'img' => asset("public/uploads/$general_settings_global->bercotool_3"),
                'name' => 'Subscriber Section',
                'code' => 3,
            ],
            ['key' => 'administration', 'img' => asset("public/uploads/$general_settings_global->bercotool_4"), 'name' => 'Administration Users', 'code' => 4],
            ['route' => route('admin.landing_page_contact_setting'), 'img' => asset("public/uploads/$general_settings_global->bercotool_5"), 'code' => 5],
            ['route' => route('admin.excel.import'), 'img' => asset("public/uploads/$general_settings_global->bercotool_6"), 'code' => 6],
            ['route' => route('signature-pad.draw'), 'img' => asset("public/uploads/$general_settings_global->bercotool_7"), 'code' => 7],
            ['route' => route('admin.landing_page_messages'), 'img' => asset("public/uploads/$general_settings_global->bercotool_8"), 'code' => 8],
            ['route' => route('admin.compose_document'), 'img' => asset("public/uploads/$general_settings_global->bercotool_9"), 'code' => 9],
            ['route' => route('file-manager.index'), 'img' => asset("public/uploads/$general_settings_global->bercotool_10"), 'code' => 10],
            ['key' => 'blogsection', 'img' => asset("public/uploads/$general_settings_global->bercotool_11"), 'name' => 'BercoBlog', 'code' => 11],
            ['route' => route('invoice-builder.index'), 'img' => asset("public/uploads/$general_settings_global->bercotool_12"), 'code' => 12],
            ['route' => route('admin.employees.chat'), 'img' => $general_settings_global->bercotool_13 ? asset("public/uploads/$general_settings_global->bercotool_13") : 'https://placehold.co/1600x400?text=Chat+with+Employees', 'code' => 13],
            ['route' => route('admin.customers.chat'), 'img' => $general_settings_global->bercotool_14 ? asset("public/uploads/$general_settings_global->bercotool_14") : 'https://placehold.co/1600x400?text=Chat+with+Customers', 'code' => 14],
            ['route' => route('admin.reservations'), 'img' => $general_settings_global->bercotool_15 ? asset("public/uploads/$general_settings_global->bercotool_15") : 'https://placehold.co/1600x400?text=Reservations', 'code' => 15],
            ['route' => route('admin.appointments'), 'img' => $general_settings_global->bercotool_16 ? asset("public/uploads/$general_settings_global->bercotool_16") : 'https://placehold.co/1600x400?text=Appointments', 'code' => 16],
            ['route' => route('admin.customer.index'), 'img' => $general_settings_global->bercotool_17 ? asset("public/uploads/$general_settings_global->bercotool_17") : 'https://placehold.co/1600x400?text=Registered+Customers', 'code' => 17],
            ['route' => route('admin.order.index'), 'img' => $general_settings_global->bercotool_18 ? asset("public/uploads/$general_settings_global->bercotool_18") : 'https://placehold.co/1600x400?text=Display+Orders', 'code' => 18],
            ['route' => route('admin.order.index'), 'img' => $general_settings_global->bercotool_19 ? asset("public/uploads/$general_settings_global->bercotool_19") : 'https://placehold.co/1600x400?text=Contact+Form+informaton', 'code' => 19],
            ['route' => route('admin.video_conference.index'), 'img' => $general_settings_global->bercotool_20 ? asset("public/uploads/$general_settings_global->bercotool_20") : 'https://placehold.co/1600x400?text=Video+Conference', 'code' => 20],
            ['key' => 'emailer', 'img' => asset("public/uploads/$general_settings_global->bercotool_21"), 'name' => 'Emailer', 'code' => 21],
            ['route' => route('admin.project.index'), 'img' => $general_settings_global->bercotool_22 ? asset("public/uploads/$general_settings_global->bercotool_22") : 'https://placehold.co/1600x400?text=Projects', 'code' => 22],
        ];

        $enabled_codes = isset($theme_color->home_tools) ? explode(',', $theme_color->home_tools) : [];
    @endphp

    <div class="team bg-lightblue">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading wow fadeInUp">
                        <h2>{{ $page_home->tools_title }}</h2>
                        <h3>{{ $page_home->tools_subtitle }}</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="team-carousel owl-carousel">

                        @foreach ($tools as $row)
                            @if (in_array($row['code'], $enabled_codes))
                                <div class="team-item wow fadeInUp border-0">
                                    <div class="team-photo">
                                        <a href="#" class="tool_img">
                                            <img src="{{ $row['img'] }}" alt="Tools Photo">
                                        </a>
                                    </div>
                                </div>
                            @endif
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
@endif
