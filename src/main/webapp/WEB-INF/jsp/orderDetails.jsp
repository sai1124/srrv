<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Details</title>
    <jsp:directive.include file="ScriptTags.jsp" />
    <style type="text/css">
        td { text-align: center; }
        .form-group1 { margin-bottom: 15px; }
        .header {
            text-align: center;
            background-color: #337ab7;
            color: white;
            font-weight: bold;
        }
        th {
            text-align: center;
            background-color: #337ab7;
            color: white;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        var orderId = "${orderId}";
        var userName = "${userName}";
    </script>
</head>
<body>
<jsp:directive.include file="Header.jsp" />
<div style="text-align: center; font-size: 30px;">ORDER DETAILS</div>
<div class="container mt-4">
    <form id="orderDetailsForm" class="form-horizontal mb-3">
        <input type="hidden" id="orderDetailsId" name="id">
        <input type="hidden" id="orderId" name="orderId">
        <div class="row">
            <div class="col-sm-2 form-group1">
                <label for="desc">Description</label>
                <input type="text" class="form-control" id="desc" name="desc" required>
            </div>
            <div class="col-sm-1 form-group1">
                <label for="width">Width ft</label>
                <input type="number" step="0.01" class="form-control" id="width" name="width" required>
            </div>
            <div class="col-sm-1 form-group1">
                <label for="heigth">Height ft</label>
                <input type="number" step="0.01" class="form-control" id="heigth" name="heigth" required>
            </div>
            <div class="col-sm-2 form-group1">
                <label for="totalSft">Total Sft</label>
                <input type="number" step="0.01" class="form-control" id="totalSft" name="totalSft" required>
            </div>
            <div class="col-sm-1 form-group1">
                <label for="price">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
            </div>
            <div class="col-sm-1 form-group1">
                <label for="quantity">Quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity" required>
            </div>
            <div class="col-sm-2 form-group1">
                <label for="total">Total</label>
                <input type="number" step="0.01" class="form-control" id="total" name="total" required>
            </div>
            
            <div class="col-sm-2 form-group1" style="margin-top: 25px;">
                <button type="button" class="btn btn-primary" id="addOrUpdateBtn">Add/Update</button>
                <button type="reset" class="btn btn-secondary">Clear</button>
            </div>
        </div>
    </form>
    <table id="orderDetailsTable" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>Description</th>
            <th>Width</th>
            <th>Height</th> 
            <th>Total Sq.ft</th>
            <th>No.Of Wind/Doors</th>
            <th>Sq.ft Rate</th>
            <th>Amount</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <button class="btn btn-success" id="saveGridBtn">Save All</button>
    <span style="font-weight:bold; margin-left:20px; font-size:18px;">Grand Total: <span id="grandTotal">0.00</span></span>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        function updateTotalSft() {
            var width = parseFloat($('#width').val()) || 0;
            var heigth = parseFloat($('#heigth').val()) || 0;
            var totalSft = width * heigth;
            $('#totalSft').val(totalSft ? totalSft : '');
        }
        $('#width, #heigth').on('input', updateTotalSft);

        function updateTotal() {
            var price = parseFloat($('#price').val()) || 0;
            var quantity = parseInt($('#quantity').val()) || 0;
            var totalSft = parseFloat($('#totalSft').val()) || 0;
            var total = price * quantity * totalSft;
            $('#total').val(total ? total : '');
        }
        $('#price, #quantity,#totalSft').on('input', updateTotal);
        if (orderId) {
            $('#orderId').val(orderId);
            fetchOrderDetails(orderId);
        }
        function updateGrandTotal() {
            var data = table.rows().data().toArray();
            var sum = 0;
            data.forEach(function(row) {
                sum += parseFloat(row.total) || 0;
            });
            $('#grandTotal').text(sum.toFixed(2));
        }

        var table = $('#orderDetailsTable').DataTable({
            data: [],
            columns: [
                {data: 'desc'},
                {data: 'width'},
                {data: 'heigth'},                
                {data: 'totalSft'},                
                {data: 'quantity'},
                {data: 'price'},
                {data: 'total'},
                {
                    data: null,
                    render: function (data, type, row, meta) {
                        return '<button class="btn btn-sm btn-info editBtn" title="Edit"><i class="fa fa-pencil"></i></button> ' +
                            '<button class="btn btn-sm btn-danger deleteBtn" title="Delete"><i class="fa fa-trash"></i></button>';
                    }
                }
            ]
        });
        function fetchOrderDetails(orderId) {
            $.ajax({
                url: '/post/fetch/orderDetails',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({orderId: Number(orderId)}),
                success: function (resp) {
                    if (resp.status === 'SUCCESS' && resp.records) {
                        table.clear().rows.add(resp.records).draw();
                        updateGrandTotal();
                    }
                }
            });
        }
        $('#addOrUpdateBtn').click(function () {
            var formData = {
                id: $('#orderDetailsId').val() || null,
                orderId: $('#orderId').val(),
                desc: $('#desc').val(),
                width: parseFloat($('#width').val()),
                heigth: parseFloat($('#heigth').val()),
                price: parseFloat($('#price').val()),
                quantity: parseInt($('#quantity').val()),
                total: parseFloat($('#total').val()),
                totalSft: parseFloat($('#totalSft').val())
            };
            var data = table.rows().data().toArray();
            if (formData.id) {
                // Edit existing
                var idx = data.findIndex(function (row) { return row.id == formData.id; });
                if (idx > -1) {
                    data[idx] = formData;
                }
            } else {
                // Add new
                formData.id = null;
                data.push(formData);
            }
            table.clear().rows.add(data).draw();
            updateGrandTotal();
            $('#orderDetailsForm')[0].reset();
            $('#orderDetailsId').val('');
        });
        $('#orderDetailsTable tbody').on('click', '.editBtn', function () {
            var data = table.row($(this).parents('tr')).data();
            $('#orderDetailsId').val(data.id);
            $('#orderId').val(data.orderId);
            $('#desc').val(data.desc);
            $('#width').val(data.width);
            $('#heigth').val(data.heigth);
            $('#price').val(data.price);
            $('#quantity').val(data.quantity);
            $('#total').val(data.total);
            $('#totalSft').val(data.totalSft);
        });
        $('#orderDetailsTable tbody').on('click', '.deleteBtn', function () {
            var row = table.row($(this).parents('tr'));
            row.remove().draw();
            updateGrandTotal();
        });
        $('#saveGridBtn').click(function () {
            var data = table.rows().data().toArray();
            if (data.length === 0) {
                alert('No records to save!');
                return;
            }
            // Set orderId for all
            data.forEach(function (row) { row.orderId = orderId; });
            $.ajax({
                url: '/post/save/orderDetails',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (resp) {
                    if (resp.status === 'SUCCESS') {
                        alert('Order details saved successfully!');
                        window.location.reload();
                    } else {
                        alert('Save failed!');
                    }
                },
                error: function () {
                    alert('Error saving data!');
                }
            });
        });
    });
</script>
</body>
</html>
</body>
</html>
