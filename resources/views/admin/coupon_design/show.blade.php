{!! isset($coupon->content) ? $coupon->content : '-' !!}

<!DOCTYPE HTML>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        #demo {
            text-align: center;
            font-size: 18px;
            margin-top: 10px;
            color: #333;
            border: 1px solid gray;
            padding: 10px 25px;
            width: fit-content;
            margin-inline: auto;
            border-radius: 10px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .expired {
            font-weight: bold;
            /* Make the "EXPIRED" text bold */
            color: red;
            /* Expired text color */
        }
    </style>
</head>
{{-- @dd($coupon->expired_at->toDatetimeString()) --}}

<body>
    @if (isset($coupon->expired_at))
        <p id="demo"></p>

        <script>
            // Set the date we're counting down to
            var countDownDate = new Date("{{ $coupon->expired_at->toDatetimeString() }}").getTime();

            // Rest of your JavaScript code for the countdown timer
            var x = setInterval(function() {
                var now = new Date().getTime();
                var distance = countDownDate - now;

                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("demo").innerHTML = "This Coupon is ";
                    var expiredText = document.createElement("span");
                    expiredText.className = "expired";
                    expiredText.textContent = "EXPIRED";
                    document.getElementById("demo").appendChild(expiredText);
                } else {
                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    var countdownText = 'Expires in: ';
                    if (days > 0) {
                        countdownText += days + ' day' + (days > 1 ? 's' : '') + ' - ';
                    }
                    if (hours > 0) {
                        countdownText += hours + ' hour' + (hours > 1 ? 's' : '') + ' - ';
                    }
                    if (minutes > 0) {
                        countdownText += minutes + ' minute' + (minutes > 1 ? 's' : '') + ' - ';
                    }
                    countdownText += seconds + ' second' + (seconds > 1 ? 's' : '');

                    document.getElementById("demo").innerHTML = countdownText;

                }
            }, 1000);
        </script>
    @endif

</body>

</html>
