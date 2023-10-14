@extends('admin.admin_layouts')
@section('admin_content')
    <style>
        .thumbnail {
            width: 200px;
            height: 250px;
            object-fit: cover;
        }

        .template-name {
            word-wrap: break-word;
        }
        .w-200 {
            width: 200px;
        }
    </style>
    @php
        $status = ['draft' => 'Draft', 'sent' => 'Sent'];
    @endphp
    <h1 class="h3 mb-3 text-gray-800">Add Campaign</h1>

    <form action="{{ route('admin.campaign.store') }}" method="post">
        @csrf
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 mt-2 font-weight-bold text-primary">Add Campaign</h6>
                <div class="float-right d-inline">
                    <a href="{{ route('admin.campaign.index') }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>
                        View All</a>
                </div>
            </div>
            <div class="card-body">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h2 class="mb-0">
                                <button class="btn btn-block text-left" type="button" data-toggle="collapse"
                                    data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Basic Details
                                </button>
                            </h2>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="">Campaign Name *</label>
                                    <input type="text" name="name" class="form-control" value="{{ old('name') }}"
                                        autofocus>
                                </div>
                                <div class="form-group">
                                    <label for="">Campaign Status *</label>
                                    <select name="status" class="form-control select2" required>
                                        <option value=""></option>
                                        @foreach ($status as $key => $value)
                                            <option value="{{ $key }}">{{ $value }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Campaign Description</label>
                                    <select name="recipients_id[]" class="form-control select3" required multiple>
                                        {{-- @foreach ($recipients as $key => $value)
                                            <option value="{{ $key }}">{{ $value }}</option>
                                        @endforeach --}}
                                        <option value="recipients">Recipients</option>
                                        <option value="subscribers">Subscribers</option>
                                        <option value="landing_page">Landingpage Contacts</option>
                                        <option value="external_data">External Data</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingThree">
                            <h2 class="mb-0">
                                <button class="btn btn-block text-left collapsed" type="button"
                                    data-toggle="collapse" data-target="#collapseThree" aria-expanded="false"
                                    aria-controls="collapseThree">
                                    Choose Templates
                                </button>
                            </h2>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                            data-parent="#accordionExample">
                            <div class="card-body">
                                <div class="d-flex flex-wrap">
                                    @foreach ($templates as $row)
                                        <label class="d-flex flex-column align-items-center m-2">
                                            <img src="{{ isset($row['thumbnail']) ? asset('public/uploads/' . $row['thumbnail']) : 'https://dummyimage.com/245x300/e8e8e8/000000.png&text=No+thumbnail+found' }}"
                                                class="thumbnail" alt="Thumbnail">
                                            <div class="d-flex align-items-baseline my-2 w-200">
                                                <input type="radio" name="template_id" value="{{ $row['id'] }}"
                                                    required>
                                                <span class="ml-2 template-name">{{ $row['et_name'] }}</span>
                                            </div>
                                        </label>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success mt-2 px-5 float-right">Submit</button>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $('.select2').select2({
            placeholder: 'Please Choose Status',
        });
        $('.select3').select2({
            placeholder: 'Please select recipients',
            multiple: true,
            allowClear: true,
            minimumResultsForSearch: 5
        });
    </script>
@endsection
