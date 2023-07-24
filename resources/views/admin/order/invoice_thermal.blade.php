<!DOCTYPE html>
<html>
<head>
    <style>
        /* Adjust your CSS styles here for thermal printing */
        body {
            font-size: 12px;
            line-height: 1.2;
            text-align: center;
        }
        .invoice-heading {
            margin-top: 10px;
            margin-bottom: 0;
        }
        .invoice-address {
            text-align: left;
            margin-bottom: 5px;
        }
        .invoice-table {
            width: 100%;
            margin-top: 10px;
            border-collapse: collapse;
        }
        .invoice-table th,
        .invoice-table td {
            border: 1px solid #000;
            padding: 5px;
        }
        .text-right {
            text-align: right;
        }
    </style>
</head>
<body>
    <h1 class="invoice-heading">Order Invoice</h1>

    <div class="invoice-area">
        <!-- Add your invoice content here -->
        <!-- ... -->
    </div>

    <div class="invoice-table" style="text-align: -webkit-center;">
        <table>
            <thead>
                <tr>
                    <th>Serial</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                @php $total = 0; @endphp
                @foreach($product_list as $row)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $row->product_name }}</td>
                        <td>${{ $row->product_price }}</td>
                        <td>{{ $row->product_qty }}</td>
                        @php $subtotal = $row->product_price * $row->product_qty; @endphp
                        <td>${{ $subtotal }}</td>
                    </tr>
                    @php $total = $total + $subtotal; @endphp
                @endforeach
            </tbody>
            <tfoot class="text-right">
                <tr>
                    <td colspan="4">Total Price:</td>
                    <td>${{ $total }}</td>
                </tr>
                <tr>
                    <td colspan="4">Shipping Cost:</td>
                    <td>+${{ $order_detail->shipping_cost }}</td>
                </tr>
                <tr>
                    <td colspan="4">Coupon Discount:</td>
                    <td>-${{ $order_detail->coupon_discount }}</td>
                </tr>
                <tr>
                    <td colspan="4">Final Price:</td>
                    <td>${{ ($total + $order_detail->shipping_cost) - $order_detail->coupon_discount }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
</body>
</html>
