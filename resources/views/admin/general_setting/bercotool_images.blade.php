@extends('admin.admin_layouts')
@section('admin_content')
    <style>
        .card-body {
            position: relative;
        }

        .badge {
            position: absolute;
            top: 0;
            right: 0;
            background-color: red;
            color: white;
            padding: 0.35rem;
            font-size: 1rem;
        }
    </style>

    <h1 class="h3 mb-3 text-gray-800">Update Admin BercoTool Images (Max size: 5 MBs)</h1>

    <form action="{{ url('superadmin/post_bercotool_images') }}" method="post" enctype="multipart/form-data">
        @csrf
        <div class="card shadow">
            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_1" accept="image/*">
                    <span>BercoWeb</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_1") }}" alt="">
                </div>

                <div class="col-md-2" ></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_2" accept="image/*">
                    <span>BercoStore</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_2") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_3" accept="image/*">
                    <span>Bersubscribe</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_3") }}" alt="">
                </div>

                <div class="col-md-2" ></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_4" accept="image/*">
                    <span>BercoManage</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_4") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_5" accept="image/*">
                    <span>BercoLand</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_5") }}" alt="">
                </div>

                <div class="col-md-2" ></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_6" accept="image/*">
                    <span>ExcelLeads</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_6") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_7" accept="image/*">
                    <span>BercoNote</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_7") }}" alt="">
                </div>

                <div class="col-md-2" ></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_8" accept="image/*">
                    <span>BercoLeads</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_8") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_9" accept="image/*">
                    <span>BercoWord</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_9") }}" alt="">
                </div>

                <div class="col-md-2" ></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_10" accept="image/*">
                    <span>BercoBox</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_10") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_11" accept="image/*">
                    <span>BercoBlog</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_11") }}" alt="">
                </div>

                <div class="col-md-2" ></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_12" accept="image/*">
                    <span>BercoInvoice</span>
                </div>
                <div class="col-md-2" >
                    <img style="width:230px; height:100px;" src="{{ asset("public/uploads/$general_settings_global->bercotool_12") }}" alt="">
                </div>

            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_13" accept="image/*">
                    <span>Chat with Employees</span>
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;" src="{{ isset($general_settings_global->bercotool_13) ? asset("public/uploads/$general_settings_global->bercotool_13") : 'http://via.placeholder.com/640x360'
                    }}" alt="">
                </div>

                <div class="col-md-2"></div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_14" accept="image/*">
                    <span class="fwt-bold">Chat with Customers</span>
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;" src="{{ isset($general_settings_global->bercotool_13) ? asset("public/uploads/$general_settings_global->bercotool_13") : 'http://via.placeholder.com/640x360'
                }}" alt="">
                </div>

            </div>


            <br>
            <div class="row justify-content-center">
                <button type="submit" class="btn btn-primary">Upload BercoTool Images</button>
            </div>
            <br>

        </div>


    </form>
    <br> <br><br>


@endsection
