<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="ISO-8859-1">
    <title>Invoice List</title>
    <jsp:directive.include file="ScriptTags.jsp" />
    <script type="text/javascript">
      var userName = "${userName}";
    </script>
  </head>

  <body>
    <jsp:directive.include file="Header.jsp" />
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-4">
          <div class="form-group">
            <label>Financial Year</label>
            <select id="financial_year" name="financial_year" class="form-control">
            </select>
          </div>
        </div>

        <div class="col-sm-3 col-md-4">
          <div class="form-group">
            <label>MONTH</label>
            <select id="financial_year_month" name="financial_year_month" class="form-control">
              <option value=''>--Select Month--</option>
              <option value='1'>Janaury</option>
              <option value='2'>February</option>
              <option value='3'>March</option>
              <option value='4'>April</option>
              <option value='5'>May</option>
              <option value='6'>June</option>
              <option value='7'>July</option>
              <option value='8'>August</option>
              <option value='9'>September</option>
              <option value='10'>October</option>
              <option value='11'>November</option>
              <option value='12'>December</option>
            </select>
          </div>
        </div>
      </div>


      <div class="form-group" style="text-align: center">
        <button id="submitBtn" class="btn btn-primary">Fetch Data</button>
      </div>
    </div>

    <div class="col-sm-12 col-md-12 col-12 col-lg-12">
      <table id="myTable" class="table table-striped table-bordered" style="width: 100%">

      </table>
    </div>

  </body>
  <script type="text/javascript">
    var application_year = 2022;
    var current_year = (new Date()).getFullYear();
    var loopcount = current_year - application_year;
    var fin_year_array = [];
    var orderStartDate = "";
    var orderEndDate = "";
    var financial_year_month = "";
    var itemSet = [];
    var invoiceTotals = [];

    var item_columns = [
      {
        title: "Invoice Num",
        data: "invoice_number"
      },
      {
        title: "Invoice Date",
        data: "invoice_date",
        className: "text-center",
        render: function (data, type, row) {
          return data != null ? defaultDateFormat(data): "";
        }
      },
      {
        title: "Customer Name",
        data: "CUSTOMER_NAME"
      },
      {
        title: "Customer Number",
        data: "CUSTOMER_NUMBER",
        visible: false
      },
      {
        title: "Customer GST",
        data: "GST_NUMBER"
      },
      {
        title: "Amt Before Tax",
        data: "amount_excluding_tax",
        className: "text-right",
        render: function (data, type, row) {
          return formatNumber(data);
        }
      },
      {
        title: "C-GST",
        data: "c_gst_amt",
        className: "text-right",
        render: function (data, type, row) {
          return formatNumber(data);
        }
      }, {
        title: "S-GST",
        data: "s_gst_amt",
        className: "text-right",
        render: function (data, type, row) {
          return formatNumber(data);
        }
      }, {
        title: "Total GST",
        data: "gst_amt",
        className: "text-right",
        render: function (data, type, row) {
          return formatNumber(data);
        }
      }, {
        title: "GST Rounding",
        data: "gst_rounding",
        className: "text-right",
        render: function (data, type, row) {
          return formatNumber(data);
        }
      }, {
        title: "Total",
        data: "total_amount",
        className: "text-right",
        render: function (data, type, row) {
          return formatNumber(data);
        }
      }];


    $(document).ready(function () {
      $('#financial_year').empty();
      for (var i = 0; i <= loopcount; i++) {
        var value = current_year + "-" + (current_year + 1);
        console.log(value);
        var text = value +" - (SRR KORAGAM)";
        $('#financial_year')
          .append($('<option>', {value : value })
            .text(text));
      }

      $("#submitBtn").on('click', function () {
        financial_year_date_range();
        get_date_range_for_month();
        console.log(orderStartDate);
        console.log(orderEndDate);
        var orderDetail = {};
        orderDetail['orderStartDate'] = orderStartDate;
        orderDetail['orderEndDate'] = orderEndDate;

        $.ajax({
          type: "POST",
          url: "/post/find/invoiceTotals",
          data: JSON.stringify(orderDetail),
          dataType: "json",
          "contentType": "application/json",
          async:false,
          success: function (data) {
            invoiceTotals = [];
            if( data != null && data.records != null && data.records.length >0) {
              invoiceTotals = data.records;
              invoiceTotals[0].invoice_number = invoiceTotals[0].MONTH_NAME;
              invoiceTotals[0].CUSTOMER_NUMBER = " ";
              invoiceTotals[0].CUSTOMER_NAME = " ";
              invoiceTotals[0].GST_NUMBER = " ";
              invoiceTotals[0].MONTH_YEAR="Total";
            }
          },
          error : function (data) {
          }
        });
        $.ajax({
          type: "POST",
          url: "/post/find/invoiceList",
          data: JSON.stringify(orderDetail),
          dataType: "json",
          async:false,
          "contentType": "application/json",
          success: function (data) {
            try {
              $('#myTable').DataTable().destroy();
            } catch (e) {
              console.log(e);
            }
            if (data != null) {
              if (data.status == "FAILURE") {
                alert("failure -->" + data.message);
              } else {
                itemSet = data.records; 
                console.log(invoiceTotals);
                if(invoiceTotals!= null && invoiceTotals.length>0) {
                  itemSet = [invoiceTotals[0], ...itemSet];
                }
                
                $('#myTable').DataTable({
                  dom: 'Bfrtip',
                  buttons: [
                    'excelHtml5'
                  ],
                  "paging": false,
                  "ordering": false,
                  "info": false,
                  "bFilter": false,
                  destroy: true, // add this line to distory 
                  data: itemSet,
                  columns: item_columns,
                  rowGroup: {
                    dataSrc: "MONTH_NAME"
                  },
                  "rowCallback": function (row, data, index) {
                    if (data.MONTH_YEAR == "Total") {
                      $('td', row).css('font-weight', 'bold');
                    }
                  }
                });
              }
            }
          },
          error: function (data) {
            alert(data);
          }
        });
      });
      var financial_year_date_range = function () {
        orderStartDate = "01/04/" + $('#financial_year').val().split("-")[0];
        orderEndDate = "31/03/" + $('#financial_year').val().split("-")[1];

      };

      var get_date_range_for_month = function () {
        var financial_year_month = $("#financial_year_month").val();
        var current_year = "";
        console.log(financial_year_month);
        if (financial_year_month != '' && financial_year_month != null) {
          if (parseInt(financial_year_month) > 3) {
            current_year = $("#financial_year").val().split("-")[0];
          } else {
            current_year = $("#financial_year").val().split("-")[1];
          }
          var firstDay = new Date(parseInt(current_year), parseInt(financial_year_month) - 1, 1);
          var lastDay = new Date(parseInt(current_year), parseInt(financial_year_month), 0);
          orderStartDate = formatDateStr(firstDay);
          orderEndDate = formatDateStr(lastDay);
        }
      };

      var formatDateStr = function (today) {
        var yyyy = today.getFullYear();
        let mm = today.getMonth() + 1; // Months start at 0!
        let dd = today.getDate();

        if (dd < 10) dd = '0' + dd;
        if (mm < 10) mm = '0' + mm;

        return dd + '/' + mm + '/' + yyyy;
      }


      $('#myTable').DataTable({

        "paging": false,
        "ordering": false,
        "info": false,
        "bFilter": false,
        destroy: true, // add this line to distory 
        data: itemSet,
        columns: item_columns
      });


    });


    var formatNumber = function (data) {
      var num = 0;
      if (data != null) {
        num = data;
      }
      return num.toLocaleString('en-IN', {
        maximumFractionDigits: 2,
        style: 'currency',
        currency: 'INR'
      });
    }
    var defaultDateFormat = function (data) {
      var curr = data.split("T")[0];
      var parsed = curr.split("-");
      return parsed[2] + "/" + parsed[1] + "/"
        + parsed[0];
    }
  </script>

  </html>