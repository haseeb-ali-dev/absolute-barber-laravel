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
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="1" @if (in_array(1, $enabled_tools)) checked @endif>
                    @if (in_array(1, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_1") }}" alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_2" accept="image/*">
                    <span>BercoStore</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="2" @if (in_array(2, $enabled_tools)) checked @endif>
                    @if (in_array(2, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_2") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_3" accept="image/*">
                    <span>Bersubscribe</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="3" @if (in_array(3, $enabled_tools)) checked @endif>
                    @if (in_array(3, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_3") }}" alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_4" accept="image/*">
                    <span>BercoManage</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="4" @if (in_array(4, $enabled_tools)) checked @endif>
                    @if (in_array(4, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_4") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_5" accept="image/*">
                    <span>BercoLand</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="5" @if (in_array(5, $enabled_tools)) checked @endif>
                    @if (in_array(5, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_5") }}" alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_6" accept="image/*">
                    <span>ExcelLeads</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="6" @if (in_array(6, $enabled_tools)) checked @endif>
                    @if (in_array(6, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_6") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_7" accept="image/*">
                    <span>BercoNote</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="7" @if (in_array(7, $enabled_tools)) checked @endif>
                    @if (in_array(7, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_7") }}" alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_8" accept="image/*">
                    <span>BercoLeads</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="8" @if (in_array(8, $enabled_tools)) checked @endif>
                    @if (in_array(8, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_8") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_9" accept="image/*">
                    <span>BercoWord</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="9"
                        @if (in_array(9, $enabled_tools)) checked @endif>
                    @if (in_array(9, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_9") }}" alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_10" accept="image/*">
                    <span>BercoBox</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="10"
                        @if (in_array(10, $enabled_tools)) checked @endif>
                    @if (in_array(10, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_10") }}" alt="">
                </div>
            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_11" accept="image/*">
                    <span>BercoBlog</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="11"
                        @if (in_array(11, $enabled_tools)) checked @endif>
                    @if (in_array(11, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_11") }}" alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_12" accept="image/*">
                    <span>BercoInvoice</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="12"
                        @if (in_array(12, $enabled_tools)) checked @endif>
                    @if (in_array(12, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ asset("public/uploads/$general_settings_global->bercotool_12") }}" alt="">
                </div>

            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_13" accept="image/*">
                    <span>Chat with Employees</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="13"
                        @if (in_array(13, $enabled_tools)) checked @endif>
                    @if (in_array(13, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_13) ? asset("public/uploads/$general_settings_global->bercotool_13") : 'https://placehold.co/640x360?text=Chat+with+Employees' }}"
                        alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_14" accept="image/*">
                    <span>Chat with Customers</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="14"
                        @if (in_array(14, $enabled_tools)) checked @endif>
                    @if (in_array(14, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_14) ? asset("public/uploads/$general_settings_global->bercotool_14") : 'https://placehold.co/640x360?text=Chat+with+Customers' }}"
                        alt="">
                </div>

            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_15" accept="image/*">
                    <span>Reservations</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="15"
                        @if (in_array(15, $enabled_tools)) checked @endif>
                    @if (in_array(15, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_15) ? asset("public/uploads/$general_settings_global->bercotool_15") : 'https://placehold.co/640x360?text=Reservations' }}"
                        alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_16" accept="image/*">
                    <span>Appointments</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="16"
                        @if (in_array(16, $enabled_tools)) checked @endif>
                    @if (in_array(16, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_16) ? asset("public/uploads/$general_settings_global->bercotool_16") : 'https://placehold.co/640x360?text=Appointments' }}"
                        alt="">
                </div>

            </div>


            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_17" accept="image/*">
                    <span>Registered Customers</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="17"
                        @if (in_array(17, $enabled_tools)) checked @endif>
                    @if (in_array(17, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_17) ? asset("public/uploads/$general_settings_global->bercotool_17") : 'https://placehold.co/640x360?text=Registered+Customers' }}"
                        alt="">
                </div>

                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_18" accept="image/*">
                    <span>Display Orders</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="18"
                        @if (in_array(18, $enabled_tools)) checked @endif>
                    @if (in_array(18, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_18) ? asset("public/uploads/$general_settings_global->bercotool_18") : 'https://placehold.co/640x360?text=Display+Orders' }}"
                        alt="">
                </div>

            </div>

            <div class="row card-body d-flex align-items-baseline">
                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_19" accept="image/*">
                    <span>Contact Form information</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="19"
                        @if (in_array(19, $enabled_tools)) checked @endif>
                    @if (in_array(19, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_19) ? asset("public/uploads/$general_settings_global->bercotool_19") : 'https://placehold.co/640x360?text=Contact+Form+information' }}"
                        alt="">
                </div>


                <div class="form-group d-flex flex-column col-md-2">
                    <input type="file" name="bercotool_20" accept="image/*">
                    <span>Video Conference</span>
                </div>
                <div class="col-md-2">
                    <input type="checkbox" name="codes[]" value="20"
                        @if (in_array(20, $enabled_tools)) checked @endif>
                    @if (in_array(20, $enabled_tools))
                        Uncheck to Enable
                    @else
                        Check to Disable
                    @endif
                </div>
                <div class="col-md-2">
                    <img style="width:230px; height:100px;"
                        src="{{ isset($general_settings_global->bercotool_20) ? asset("public/uploads/$general_settings_global->bercotool_20") : 'https://placehold.co/640x360?text=Video+Conference' }}"
                        alt="">
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
