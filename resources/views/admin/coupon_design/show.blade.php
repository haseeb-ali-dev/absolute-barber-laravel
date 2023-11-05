{!! isset($coupon->content) ? $coupon->content : '-' !!}

<!DOCTYPE HTML>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        #demo {
            text-align: center;
            font-size: 20px;
            margin-block: 25px;
            color: white;
            border: 1px solid gray;
            padding: 10px 25px;
            width: fit-content;
            margin-inline: auto;
            border-radius: 10px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: black;
        }

        .expired {
            font-weight: bold;
            color: red;
        }

        .num {
            animation: pulse 1s infinite;
            font-size: 28px;
        }

        .days {
            color: #6ab6ff;
        }

        .hours {
            color: #ff7f7f;
        }

        .minutes {
            color: #7eff95;
        }

        .seconds {
            color: #ffeb6e;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 0.7;
            }

            50% {
                transform: scale(1.1);
                opacity: 1;
            }

            100% {
                transform: scale(1);
                opacity: 0.7;
            }
        }

        .ml-2 {
            margin-left: 10px;
        }
    </style>
</head>

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
                        countdownText += '<span class="ml-2 days"> <span class="num">' + days + '</span> day' + (days >
                            1 ?
                            's' : '') + '</span> - ';
                    }
                    if (hours > 0) {
                        countdownText += '<span class="hours"> <span class="num">' + hours + '</span> hour' + (hours >
                            1 ? 's' : '') + '</span> - ';
                    }
                    if (minutes > 0) {
                        countdownText += '<span class="minutes"> <span class="num">' + minutes + '</span> minute' + (
                            minutes > 1 ? 's' : '') + '</span> - ';
                    }
                    countdownText += '<span class="seconds"> <span class="num">' + seconds + '</span> second' + (
                        seconds > 1 ? 's' : '') + '</span>';

                    document.getElementById("demo").innerHTML = countdownText;

                }
            }, 1000);
        </script>
    @endif

</body>

</html>
