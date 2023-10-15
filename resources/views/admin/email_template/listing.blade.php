<div class="d-flex" style="flex-wrap: wrap;">
    @foreach ($templates as $row)
        <div class="card m-2" style="width: 245px;">
            <div class="card-container">
                <img src="{{ isset($row->thumbnail) ? asset('public/uploads/' . $row->thumbnail) : 'https://dummyimage.com/245x300/e8e8e8/000000.png&text=No+thumbnail+found' }}"
                    class="card-img-top" alt="Thumbnail">

                @if (session('is_super') == 1)
                    <div class="edit-button text-center">
                        <a href="{{ URL::to('admin/email-template/edit/' . $row->id) }}"
                            class="btn btn-primary rounded-pill px-4 btn-sm">Edit</a>

                        <a href="{{ route('admin.email_template.delete', ['id' => $row->id]) }}"
                            class="btn btn-danger rounded-pill px-4 btn-sm mt-2"
                            onclick="return confirm('Are you to delete this template?')">Delete</a>
                    </div>
                @else
                    <a href="{{ route('admin.email_template.select', ['template_id' => $row->id]) }}"
                        class="btn btn-success rounded-pill px-4 edit-button">Select</a>
                @endif
            </div>
            <h6 class="text-center py-3">{{ $row->et_name }}</h6>
        </div>
    @endforeach
</div>
