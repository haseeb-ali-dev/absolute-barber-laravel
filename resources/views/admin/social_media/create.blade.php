@extends('admin.admin_layouts')
@section('admin_content')
    <h1 class="h3 mb-3 text-gray-800">Add Social Media Item</h1>

    <form action="{{ route('admin.social_media.store') }}" method="post">
        @csrf
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 mt-2 font-weight-bold text-primary">Add Social Media Item</h6>
                <div class="float-right d-inline">
                    <a href="{{ route('admin.social_media.index') }}" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i>
                        View All</a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="">URL *</label>
                            <input type="text" name="social_url" class="form-control" value="{{ old('social_url') }}"
                                autofocus>
                        </div>
                        <div class="form-group">
                            <label for="">Selected Icon</label>
                            <div class="col-sm-5">
                                <div class="pt_10">
                                    <i id="social-icon-value" style="font-size: 32px;"></i>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="">Icon (Font Awesome 5 Codes) *</label>
                            <select name="social_icon" id="social-icon" class="form-control">
                                <option value="">Select a social icon</option>
                                <option value="fab fa-facebook">Facebook (fab fa-facebook)</option>
                                <option value="fab fa-twitter">Twitter (fab fa-twitter)</option>
                                <option value="fab fa-instagram">Instagram (fab fa-instagram)</option>
                                <option value="fab fa-linkedin">LinkedIn (fab fa-linkedin)</option>
                                <option value="fab fa-reddit">Reddit (fab fa-reddit)</option>
                                <option value="fab fa-behance">Behance (fab fa-behance)</option>
                                <option value="fab fa-dribbble">Dribble (fab fa-dribbble)</option>
                                <option value="fab fa-vk">VK (fab fa-vk)</option>
                                <option value="fab fa-youtube">Youtube (fab fa-youtube)</option>
                            </select>

                            {{-- <label for="">Icon (Font Awesome 5 Codes) *</label>
                            <input type="text" name="social_icon" class="form-control" value="{{ old('social_icon') }}">
                            <div class="text-danger">Example: "fab fa-facebook-f"</div> --}}
                        </div>
                        <div class="form-group">
                            <label for="">Order</label>
                            <input type="text" name="social_order" class="form-control"
                                value="{{ old('social_order', '0') }}">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>
    <script>
        const socialIconSelect = document.getElementById('social-icon');
        const socialIcon = document.getElementById('social-icon-value');

        socialIconSelect.addEventListener('change', () => {
            socialIcon.className = socialIconSelect.value;
        });
    </script>
@endsection
