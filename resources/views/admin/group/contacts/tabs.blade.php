<div class="col-3">
    <ul class="nav flex-column nav-pills border border-success p-3" id="myTab" role="tablist">
        @foreach ($groups as $row)
            @php
                $isActive = session('gid') == $row->id || ($loop->first && !session('gid'));
            @endphp
            <li class="nav-item" role="presentation">
                <a class="nav-link {{ $isActive ? 'active' : '' }}" id="group-{{ $row->id }}-tab" data-toggle="tab"
                    href="#group-{{ $row->id }}" role="tab" aria-controls="group-{{ $row->id }}"
                    aria-selected="{{ $isActive ? 'true' : 'false' }}" data-gid="{{ $row->id }}">
                    <div class="d-flex justify-content-between align-items-center">
                        <span>{{ $row->name }}</span>
                        <strong style="font-size: 20px;">{{ $row->contacts_count }}</strong>
                    </div>
                </a>
            </li>
        @endforeach
    </ul>
</div>
