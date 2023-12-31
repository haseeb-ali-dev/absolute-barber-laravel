<div class="modal fade" id="avail_offering" tabindex="-1" aria-labelledby="avail_offeringLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ route('front.avail_offering') }}" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="avail_offeringLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    @csrf
                    <div class="d-flex flex-column">
                        <span class="font-weight-bold">Serice Details</span>
                        <div class="details"></div>
                    </div>
                    <input type="hidden" name="offering_id">
                    <div class="row mt-2 align-items-end">
                        <div class="col-md-6">
                            <label class="font-weight-bold">Choose Price Type</label>
                            <div class="form-check mb-1">
                                <input class="form-check-input" type="radio" name="rate_type" value="regular"
                                    required>
                                <label class="form-check-label">Regular Rate</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rate_type" value="appointed"
                                    required>
                                <label class="form-check-label">Appointment Rate</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="border border-2 p-3 text-center h5 regular-rate" style="display:none"></div>
                            <div class="border border-2 p-3 text-center h5 appointed-rate" style="display:none"></div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <span class="col-md-12 font-weight-bold mb-2">Other Information</span>
                        <div class="col-md-6">
                            <div class="d-flex flex-column">
                                <small class="mb-0">Your First Name *</small>
                                <input class="form-control" required type="text" name="client_fname"
                                    placeholder="John">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex flex-column">
                                <small class="mb-0">Your Last Name *</small>
                                <input class="form-control" required type="text" name="client_lname"
                                    placeholder="Doe">
                            </div>
                        </div>
                        <div class="col-md-6 mt-1">
                            <div class="d-flex flex-column">
                                <small class="mb-0">Your Email *</small>
                                <input class="form-control" required type="email" name="client_email"
                                    placeholder="john.doe@gmail.com">
                            </div>
                        </div>
                        <div class="col-md-6 mt-1">
                            <div class="d-flex flex-column">
                                <small class="mb-0">Your Contact *</small>
                                <input class="form-control" required type="text" name="client_phone"
                                    placeholder="+932345566">
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3 appointment" style="display: none">
                        <span class="col-md-12 mb-2 font-weight-bold">Appointment Details</span>
                        <div class="col-md-12">
                            <div class="d-flex flex-column mt-1">
                                <small class="mb-0">Chosse Time Slot *</small>
                                <div class="d-flex flex-wrap">
                                    @if (isset($general_settings_global->shop_open_time) &&
                                            isset($general_settings_global->shop_close_time) &&
                                            isset($general_settings_global->shop_service_interval))
                                        @php
                                            $intervals = \Carbon\CarbonPeriod::since($general_settings_global->shop_open_time)
                                                ->minutes($general_settings_global->shop_service_interval)
                                                ->until($general_settings_global->shop_close_time)
                                                ->toArray();
                                        @endphp
                                        @foreach ($intervals as $row)
                                            <div class="border p-2 m-1">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="slot{{ $loop->index }}"
                                                        name="appointment_time" class="custom-control-input"
                                                        value="{{ $row->format('H:i') }}">
                                                    <label class="custom-control-label" for="slot{{ $loop->index }}">
                                                        {{ $row->format('H:i') }}
                                                    </label>
                                                </div>
                                            </div>
                                        @endforeach
                                    @else
                                        <p>Opening and Closing times are not set yet</p>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer cart-button px-2">
                    <button type="submit" class="add-to-cart">
                        <i class="fab fa-amazon-pay mr-1"></i>
                        Procced to Payment
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $('.avail-offering-btn').click(function() {
        const offering = $(this).data('offering');
        console.log(offering);

        $("#avail_offering .regular-rate").hide()
        $("#avail_offering .appointed-rate").hide()
        $("#avail_offering .appointment").hide()
        $("#avail_offering input[name='rate_type']").prop("checked", false);
        $("#avail_offering input[name='appointment_time']").prop("checked", false);

        $("#avail_offering input[name='offering_id']").val(offering?.id);
        $("#avail_offering .modal-title").text(`${offering?.name}`);
        $("#avail_offering .details").html(offering?.details);

        $("#avail_offering input[name='rate_type']").change(function(e) {
            e.preventDefault();
            const value = $(this).val();
            if (value == "regular") {
                $("#avail_offering .regular-rate").show()
                $("#avail_offering .regular-rate").text(`USD ${offering?.regular_rate}`)
                $("#avail_offering .appointed-rate").hide()
                $("#avail_offering .appointment").hide()
                $("#avail_offering input[name='appointment_time']").prop("checked", false);

            } else {
                $("#avail_offering .regular-rate").hide()
                $("#avail_offering .appointed-rate").show()
                $("#avail_offering .appointed-rate").text(`USD ${offering?.appointed_rate}`)
                $("#avail_offering .appointment").show()

            }
        });

        $("#avail_offering").modal('show');
    });
</script>
