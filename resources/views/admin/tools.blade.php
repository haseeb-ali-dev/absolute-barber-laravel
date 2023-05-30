@extends('admin.admin_layouts')

@section('admin_content')
    <style>
        .col {
            /* Set the width of the parent div */
            width: 300px;
            /* Set the height of the parent div */
            height: 70px;
        }

        .image {
            /* Set the maximum width and height to 100% of the parent div's dimensions */
            max-width: 100%;
            max-height: 100%;
        }
    </style>

    @php
        $dashboard_section = [
            ['key' => 'bercoweb', 'img' => asset("public/uploads/$general_settings_global->bercotool_1"), 'name' => 'Bercoweb', 'icon' => 'fas fa-cog'],
            ['key' => 'bercostore','img' => asset("public/uploads/$general_settings_global->bercotool_2"), 'name' => 'Bercostore', 'icon' => 'fas fa-shopping-cart'],
            ['key' => 'subscriber','img' => asset("public/uploads/$general_settings_global->bercotool_3"), 'name' => 'Subscriber Section', 'icon' => 'fas fa-share-alt-square'],
            ['key' => 'administration','img' => asset("public/uploads/$general_settings_global->bercotool_4"), 'name' => 'Administration Users', 'icon' => 'fas fa-user-secret'],
            ['route' => route('admin.landing_page_contact_setting'), 'img' => asset("public/uploads/$general_settings_global->bercotool_5"), 'icon' => 'fa fa-users'],
            ['route' => route('admin.excel.import'), 'img' => asset("public/uploads/$general_settings_global->bercotool_6"), 'icon' => 'fas fa-users'],
            ['route' => route('signature-pad.draw'), 'img' => asset("public/uploads/$general_settings_global->bercotool_7"), 'icon' => 'fa fa-sticky-note'],
            ['route' => route('admin.landing_page_messages'), 'img' => asset("public/uploads/$general_settings_global->bercotool_8"), 'icon' => 'fas fa-users'],
            ['route' => route('admin.compose_document'), 'img' => asset("public/uploads/$general_settings_global->bercotool_9"), 'icon' => 'fas fa-file'],
            ['route' => route('file-manager.index'), 'img' => asset("public/uploads/$general_settings_global->bercotool_10"), 'icon' => 'fas fa-archive'],
            ['key' => 'blogsection', 'img' => asset("public/uploads/$general_settings_global->bercotool_11"), 'name' => 'BercoBlog', 'icon' => 'fas fa-cog'],
            ['route' => route('invoice-builder.index'), 'img' => asset("public/uploads/$general_settings_global->bercotool_12"), 'icon' => 'fas fa-cog'],
            // ['route' => route('admin.plan_payment'), 'name' => 'My Plan & Payments', 'icon' => 'fas fa-fw fa-cog'],
        ];
        $bercoweb = [
            ['route' => route('admin.dashboard'), 'name' => 'Dashboard', 'icon' => 'fas fa-fw fa-home'],
            ['key' => 'general', 'name' => 'General Settings', 'icon' => 'fas fa-cog'],
            ['key' => 'page', 'name' => 'Page Settings', 'icon' => 'fas fa-paste'],
            // ['key' => 'blog', 'name' => 'Blog Section', 'icon' => 'fas fa-cubes'],
            ['key' => 'career', 'name' => 'Career Section', 'icon' => 'fas fa-user-secret'],
            ['route' => route('admin.footer.index'), 'name' => 'Footer Columns', 'icon' => 'fas fa-fw fa-list-alt'],
            ['route' => route('admin.slider.index'), 'name' => 'Sliders', 'icon' => 'fas fa-sliders-h'],
            ['route' => route('admin.dynamic_page.index'), 'name' => 'Dynamic Pages', 'icon' => 'fas fa-cube'],
            ['route' => route('admin.menu.index'), 'name' => 'Menu Manage', 'icon' => 'fas fa-bars'],
            ['route' => route('admin.project.index'), 'name' => 'Project', 'icon' => 'fas fa-umbrella'],
            ['route' => route('admin.photo.index'), 'name' => 'Photo Gallery', 'icon' => 'fas fa-camera'],
            ['route' => route('admin.video.index'), 'name' => 'Video Gallery', 'icon' => 'fas fa-video'],
            ['route' => route('admin.customer.index'), 'name' => 'Customer Section', 'icon' => 'fas fa-users'],
            ['route' => route('admin.manual.messages'), 'name' => 'Manual Messages/Email', 'icon' => 'fas fa-users'],
            ['route' => route('admin.why_choose.index'), 'name' => 'Why Choose Us', 'icon' => 'fas fa-arrows-alt'],
            ['route' => route('admin.service.index'), 'name' => 'Service', 'icon' => 'fas fa-certificate'],
            ['route' => route('admin.testimonial.index'), 'name' => 'Testimonial', 'icon' => 'fas fa-award'],
            ['route' => route('admin.team_member.index'), 'name' => 'Team Member', 'icon' => 'fas fa-user-plus'],
            ['route' => route('admin.faq.index'), 'name' => 'FAQ', 'icon' => 'fas fa-question-circle'],
            ['route' => route('admin.email_template.index'), 'name' => 'Email Template', 'icon' => 'fas fa-envelope'],
            ['route' => route('admin.social_media.index'), 'name' => 'Social Media', 'icon' => 'fas fa-basketball-ball'],
            ['route' => route('admin.messages.index'), 'name' => 'Messages', 'icon' => 'fab fa-facebook-messenger'],
            ['route' => route('admin.general_setting.default_homepage'), 'name' => 'Default Homepage', 'icon' => 'fab fa-facebook-messenger'],
        ];
        $bercostore = [
            ['route' => route('admin.product.index'), 'name' => 'Product', 'icon' => 'fas fa-shopping-cart'],
            ['route' => route('admin.product_category.index'), 'name' => 'Product Categories', 'icon' => 'fas fa-shopping-cart'],
            ['route' => route('admin.shipping.index'), 'name' => 'Shipping', 'icon' => 'fas fa-shopping-cart'],
            ['route' => route('admin.coupon.index'), 'name' => 'Coupon', 'icon' => 'fas fa-shopping-cart'],
            ['route' => route('admin.order.index'), 'name' => 'Order Section', 'icon' => 'fas fa-bookmark'],
            ['route' => route('admin.general_setting.stripe_keys'), 'name' => 'Stripe Keys', 'icon' => 'fas fa-bookmark'],
            ['route' => route('admin.general_setting.paypal_keys'), 'name' => 'Paypal Keys', 'icon' => 'fas fa-bookmark'],
        ];
        $subscriber = [
            ['route' => route('admin.subscriber.index'), 'name' => 'All Subscribers', 'icon' => 'fas fa-share-alt-square'],
            ['route' => route('admin.subscriber.send_email'), 'name' => 'Send Email to Subscribers', 'icon' => 'fas fa-share-alt-square'],
        ];
        $administration = [
            ['route' => route('admin.role.index'), 'name' => 'Roles', 'icon' => 'fas fa-user-secret'],
            ['route' => route('admin.role.user'), 'name' => 'Users', 'icon' => 'fas fa-user-secret'],
        ];
        $general_settings = [
            ['route' => route('admin.general_setting.logo'), 'name' => 'Logo', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.favicon'), 'name' => 'Favicon', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.loginbg'), 'name' => 'Login Background', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.topbar'), 'name' => 'Top Bar', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.banner'), 'name' => 'Banner', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.footer'), 'name' => 'Footer', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.sidebar'), 'name' => 'Sidebar', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.color'), 'name' => 'Color', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.preloader'), 'name' => 'Preloader', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.stickyheader'), 'name' => 'Sticky Header', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.googleanalytic'), 'name' => 'Google Analytic', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.googlerecaptcha'), 'name' => 'Google Recaptcha', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.tawklivechat'), 'name' => 'Tawk Live Chat', 'icon' => 'fas fa-cog'],
            ['route' => route('admin.general_setting.cookieconsent'), 'name' => 'Cookie Consent', 'icon' => 'fas fa-cog'],
        ];
        $page_settings = [
            ['route' => route('admin.page_home.edit'), 'name' => 'Home', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_about.edit'), 'name' => 'About', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_service.edit'), 'name' => 'Service Background', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_shop.edit'), 'name' => 'Shop Bar', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_blog.edit'), 'name' => 'Blog', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_project.edit'), 'name' => 'Project', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_faq.edit'), 'name' => 'FAQ', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_team.edit'), 'name' => 'Team Member', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_photo_gallery.edit'), 'name' => 'Photo Gallery', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_video_gallery.edit'), 'name' => 'Video Gallery', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_contact.edit'), 'name' => 'Contact', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_career.edit'), 'name' => 'Career', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_term.edit'), 'name' => 'Term', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_privacy.edit'), 'name' => 'Privacy', 'icon' => 'fas fa-paste'],
            ['route' => route('admin.page_other.edit'), 'name' => 'Other', 'icon' => 'fas fa-paste'],
        ];
        $blog_section = [
            ['route' => route('admin.category.index'), 'name' => 'Categories', 'icon' => 'fas fa-cubes'],
            ['route' => route('admin.blog.index'), 'name' => 'Blogs', 'icon' => 'fas fa-cubes'],
            ['route' => route('admin.comment.approved'), 'name' => 'Approved Comments', 'icon' => 'fas fa-cubes'],
            ['route' => route('admin.comment.pending'), 'name' => 'Pending Comments', 'icon' => 'fas fa-cubes'],
        ];
        $career_section = [
            ['route' => route('admin.job.index'), 'name' => 'Jobs', 'icon' => 'fas fa-user-secret'],
            ['route' => route('admin.job.view_application'), 'name' => 'Job Applications', 'icon' => 'fas fa-user-secret'],
        ];
        $sections = [
            ['title' => 'Dashboard', 'key' => 'dashboard', 'items' => $dashboard_section],
            ['title' => 'Bercoweb', 'key' => 'bercoweb', 'back' => 'dashboard', 'items' => $bercoweb],
            ['title' => 'Bercostore', 'key' => 'bercostore', 'back' => 'dashboard', 'items' => $bercostore],
            ['title' => 'Subscriber Section', 'key' => 'subscriber', 'back' => 'dashboard', 'items' => $subscriber],
            ['title' => 'Administration Users', 'key' => 'administration', 'back' => 'dashboard', 'items' => $administration],
            ['title' => 'General Settings', 'key' => 'general', 'back' => 'bercoweb', 'items' => $general_settings],
            ['title' => 'Page Settings', 'key' => 'page', 'back' => 'bercoweb', 'items' => $page_settings],
            ['title' => 'Blog Section', 'key' => 'blogsection', 'back' => 'dashboard', 'items' => $blog_section],
            ['title' => 'Career Section', 'key' => 'career', 'back' => 'bercoweb', 'items' => $career_section],
        ];
    @endphp

    @foreach ($sections as $section)
        <div class="row dashboard-page" id="{{ $section['key'] }}" style="display: @if($loop->iteration > 1) none @endif">
            <div class="col-xl-12 col-md-12 mb-2">
                <h1 class="h3 mb-3 text-gray-800">{{ $section['title'] }}</h1>
            </div>
            @if (isset($section['back']))
                <div class="col-xl-12 col-md-12 mb-5">
                    <a class="btn btn-success mt-3" href="javascript:;" onclick="toggleSection('{{ $section['back'] }}')">
                        <i class="fa fa-arrow-left mr-3"></i>Back to {{ ucwords($section['back']) }}
                    </a>
                </div>
            @endif
            @foreach ($section['items'] as $item)
                <div class="col-xl-3 col-md-6 mb-4" @if(isset($item['key'])) onclick="toggleSection('{{ $item['key'] }}')" @endif>
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <a href="{{ isset($item['route']) ? $item['route'] : 'javascript:;' }}">
                                        @if (isset($item['img']))
                                            <img src="{{ asset($item['img']) }}" alt="" class="image">
                                        @else
                                            <h3>{{ $item['name'] ?? 'No Name' }}</h3>
                                        @endif
                                    </a>
                                </div>
                                {{-- <div class="col-auto">
                                    <i class="{{ $item['icon'] }} fa-2x text-gray-300"></i>
                                </div> --}}
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endforeach

    <script>
        const keys = ['dashboard', 'bercoweb', 'bercostore', 'subscriber', 'administration', 'general', 'page', 'blog', 'career','blogsection']
        function toggleSection(key)
        {
            const audio = new Audio("{{ asset('public/backend/ping-1.mp3') }}")
            audio.play()
            $(`#${key}`).show()
            keys.filter(elm => elm != key).map(el => $(`#${el}`).hide())
        }
    </script>

@endsection
