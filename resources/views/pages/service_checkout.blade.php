@extends('layouts.app')

@section('content')
    <div class="page-banner"
        style="background-image: url({{ asset('public/uploads/' . $general_settings_global->banner_checkout) }})">
        <div class="bg-page"></div>
        <div class="text">
            <h1>Service Checkout</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center">
                    <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Service Payment</li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="page-content pt_50 pb_60">
        <div class="container-fluid px-5">
            <div class="row cart">
                <div class="col-md-12">
                    <form action="{{ url('offering/avail/update') }}" method="post">
                        @csrf
                        <div class="d-flex align-items-baseline justify-content-between">
                            <h3>Service</h3>
                            <button class="btn btn-sm btn-primary" type="submit">Update Service</button>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr class="table-info table-striped-columns">
                                        <th>Sr</th>
                                        <th>Thumbnail</th>
                                        <th>Service Name</th>
                                        <th>Service Type</th>
                                        <th style="min-width: 250px;">Client Name</th>
                                        <th style="min-width: 250px;">Client Email/Contact</th>
                                        <th style="min-width: 250px;">Appointment Details</th>
                                        <th>Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="align-middle">1</td>
                                        <td class="align-middle">
                                            <input type="hidden" name="offering_id"
                                                value="{{ $session_offering['offering_id'] }}">
                                            <img src="{{ asset('public/uploads/' . $offering->photo) }}"
                                                style="width: 70px;">
                                        </td>
                                        <td class="align-middle">{{ $offering->name }}</td>
                                        <td class="align-middle">
                                            <div class="form-check mb-1">
                                                <input class="form-check-input" type="radio" name="rate_type"
                                                    value="regular" required
                                                    @if ($session_offering['rate_type'] == 'regular') checked @endif>
                                                <label class="form-check-label">Regular Rate
                                                    (${{ $offering->regular_rate }})</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="rate_type"
                                                    value="appointed" required
                                                    @if ($session_offering['rate_type'] == 'appointed') checked @endif>
                                                <label class="form-check-label">Appointment Rate
                                                    (${{ $offering->appointed_rate }})</label>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex flex-column">
                                                <small class="mb-0">Your First Name *</small>
                                                <input class="form-control" required type="text" name="client_fname"
                                                    placeholder="John" value="{{ $session_offering['client_fname'] }}">
                                                <small class="mb-0">Your Last Name *</small>
                                                <input class="form-control" required type="text" name="client_lname"
                                                    placeholder="Doe" value="{{ $session_offering['client_lname'] }}">
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex flex-column">
                                                <small class="mb-0">Your Email *</small>
                                                <input class="form-control" required type="email" name="client_email"
                                                    placeholder="john.doe@gmail.com"
                                                    value="{{ $session_offering['client_email'] }}">
                                                <small class="mb-0">Your Contact *</small>
                                                <input class="form-control" required type="text" name="client_phone"
                                                    placeholder="+932345566"
                                                    value="{{ $session_offering['client_phone'] }}">
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex flex-column">
                                                <small class="mb-0">Select Date *</small>
                                                <input class="form-control" type="date" name="appointment_date"
                                                    min="{{ now()->format('Y-m-d') }}"
                                                    value="{{ $session_offering['appointment_date'] }}">
                                                <small class="mb-0">Select Time *</small>
                                                <input class="form-control" type="time" name="appointment_time"
                                                    value="{{ $session_offering['appointment_time'] }}">
                                            </div>
                                        </td>
                                        <td class="align-middle">${{ $final_price }}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="col-md-12">
                    <h3>Make Payment</h3>
                    <div class="row">
                        <div class="col-md-6 col-lg-4">
                            <div class="form-group">
                                <select name="payment_method" class="form-control select2" id="paymentMethodChange">
                                    <option value="">Select Payment Method</option>
                                    <option value="PayPal">PayPal</option>
                                    @if ($session_offering['rate_type'] == 'regular')
                                        <option value="CashInShop">Cash in Shop</option>
                                    @endif
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="cash-in-shop mt_20">
                                <h6>You will pay after your service done in shop</h6>
                                <a href="{{ url('offering/payment/cash') }}" class="btn btn-sm btn-primary">Proceed
                                    Order</a>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="paypal mt_20">
                                <h4>Pay with PayPal</h4>
                                <div id="paypal-button"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @php
        $paypal_mode = env('PAYPAL_ENV_TYPE');
        $client = env('PAYPAL_CLIENT_ID');
        $secret = env('PAYPAL_SECRET_KEY');
    @endphp

    @if ($paypal_mode == 'sandbox')
        @php
            $paypal_url = 'https://api.sandbox.paypal.com/v1/';
            $env_type = 'sandbox';
        @endphp
    @elseif($paypal_mode == 'production')
        @php
            $paypal_url = 'https://api.paypal.com/v1/';
            $env_type = 'production';
        @endphp
    @endif

    <script>
        paypal.Button.render({
            env: '{{ $env_type }}',
            client: {
                sandbox: '{{ $client }}',
                production: '{{ $client }}'
            },
            locale: 'en_US',
            style: {
                size: 'medium',
                color: 'blue',
                shape: 'rect',
            },

            // Set up a payment
            payment: function(data, actions) {
                return actions.payment.create({

                    redirect_urls: {
                        return_url: '{{ url('offering/payment/paypal') }}'
                    },

                    transactions: [{
                        amount: {
                            total: '{{ $final_price }}',
                            currency: 'USD'
                        }
                    }]
                });
            },

            // Execute the payment
            onAuthorize: function(data, actions) {
                return actions.redirect();
            }
        }, '#paypal-button');
    </script>
@endsection
