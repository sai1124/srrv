	var elements = [ "orderId", "customerName", "customerAddress", "orderDate",
			"profile_type_id", "contactNumber", "status", "invoiceAmount",
			"paidAmount", "balanceAmount", "paymentType", "email", "createdBy" ];
	var item_elements = [ "itemId", "itemDesc", "price", "quantity", "total",
			"invoiceId" ];
	var manual_fields = ["invCGSTAmt", "invSGSTAmt", "gstRoundingAmt", "gstAmt", "amountExcludingTax", "advanceAmount", "totalAmount", "balanceAmount"];
	var orderDetail = {};
	var totalItems = 0;
	var dataSet = [];
	var itemSet = [];
	
	$(document)
			.ready(
					function() {

						$("#invoiceDate").datepicker({
							dateFormat : 'dd/mm/yy',//check change
							changeMonth : true,
							changeYear : true
						});
						$("#dueDate").datepicker({
							dateFormat : 'dd/mm/yy',//check change
							changeMonth : true,
							changeYear : true
						});

						//$("#customerName").html(order_company['customerName']);

						var item_columns = [
								{
									title : "S No",
									data : "itemId",
									visible : false
								},
								{
									title : "Item Desc",
									className : "text-center word-wrap-text",
									data : "itemDesc"
								},
								{
									title : "HSN/SAC",
									className : "text-center word-wrap-text",
									data : "hsn"
								},
								{
									title : "Quantity (Sft / Unit)",
									className : "text-center",
									data : "quantity"
								},
								{
									title : "Price (Sft / Unit)",
									data : "price",
									className : "text-right",
									render : function(data, type, row) {
										return data.toLocaleString('en-IN', {
											maximumFractionDigits : 2,
											style : 'currency',
											currency : 'INR'
										});
									}
								},
								{
									title : "Total",
									data : "total",
									className : "text-right",
									render : function(data, type, row) {
										return data.toLocaleString('en-IN', {
											maximumFractionDigits : 2,
											style : 'currency',
											currency : 'INR'
										});
									}
								},
								{
									title : "invoice id",
									data : "invoiceId",
									visible : false
								},
								{
									title : "invoice id",
									data : "gstRate",
									visible : false
								},
								{
									title : "invoice id",
									data : "cGstAmount",
									visible : false
								},
								{
									title : "invoice id",
									data : "sGstAmount",
									visible : false
								},
								{
									title : "invoice id",
									data : "gstRounding",
									visible : false
								},
								{
									title : "invoice id",
									data : "excludingGst",
									visible : false
								},

								{
									title : "Action",
									"render" : function(url, type, full) {
										return '<img class="edit-item-row" style="cursor:pointer" src="../images/edit.png"/> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<img class="delete-item-row" src="../images/trash.png"/> ';
									}
								} ];


						orderDetail.orderId = orderId;
						$.ajax({
							type : "POST",
							url : "/post/fetch/inv",
							data : JSON.stringify(orderDetail),
							dataType : "json",
							"contentType" : "application/json",
							success : function(data) {
								if (data != null) {
									if (data.status == "FAILURE") {
										alert("failure -->" + data.message);
									} else {
										
										if(data.records != null) {
											orderDetail = data.records[0];
											setInitData();
										}else{
											$("#invNum").attr("disabled", true);
											$("#transMode").val("AUTO");
											$("#transNumber").val("AP39TM0359");
											disabledFields(true);
											
										}
										
									}
								}
							},
							error : function(data) {
								alert(data);
							}
						});
						var setInitData = function() {
							$("#invNum").val(orderDetail.invoiceNum);
							$("#invNum").attr("disabled", true);
							$("#invoiceDate").val(
									defaultDateFormat(orderDetail.invoiceDate));
							$("#dueDate").val(
									defaultDateFormat(orderDetail.dueDate));
							$("#invoiceId").val(orderDetail.invoiceId);
							$("#orderId").val(orderDetail.orderId);
							$("#status").val(orderDetail.status);
							$("#invCGSTAmt").val(orderDetail.cgst_amount);
							$("#invSGSTAmt").val(orderDetail.sgst_amount);
							$("#gstRoundingAmt").val(orderDetail.gstRounding);
							$("#gstAmt").val(orderDetail.gst_amount);
							$("#amountExcludingTax").val(orderDetail.amountExcludingTax);
							$("#advanceAmount").val(orderDetail.advanceAmount);
							$("#totalAmount").val(orderDetail.totalAmount);
							$("#balanceAmount").val(orderDetail.balanceAmount);
							$("#transMode").val(orderDetail.transMode);
							$("#transNumber").val(orderDetail.transNumber);
							if(orderDetail.invoiceNum ==  null){
								$("#transMode").val("AUTO");
								$("#transNumber").val("AP39TM0359");
								$("#generateInvoice").hide();
							} else {
								$("#submitHeader").html("Save");
							}
							if(orderDetail.manual) {
								disabledFields(false);
								$("#manual").attr("checked",true); 
							}else {
								disabledFields(true);
								$("#manual").attr("checked",false);
							}
							if(orderDetail.invoiceId != null) {
								$("#addEntry").show();
							}
							initItemDetails();
						};
						var formatNumber = function(data) {
							return data.toLocaleString('en-IN', {
										maximumFractionDigits : 2,
										style : 'currency',
										currency : 'INR'
									});
						}
						var initItemDetails = function() {

							fetchItems(); 
						}

						var fetchItems = function() {

							var item = {};
							item.invoiceId = $("#invoiceId").val();

							$.ajax({
										type : "POST",
										url : "/post/fetchAll/items",
										data : JSON.stringify(item),
										dataType : "json",
										"contentType" : "application/json",
										success : function(data) {
											if (data != null) {
												if (data.status == "FAILURE") {
													alert("failure -->"
															+ data.message);
												} else {
													console.log(data.records);

													itemSet = data.records;
													setItems();
												}
											}
										},
										error : function(data) {
											alert(data);
										}
									});
						}
						var defaultDateFormat = function(data) {
							var curr = data.split("T")[0];
							var parsed = curr.split("-");
							return parsed[2] + "/" + parsed[1] + "/"
									+ parsed[0];
						}
						var setItems = function() {

							var table = $('#myTable').DataTable({
								"paging" : false,
								"ordering" : false,
								"info" : false,
								"bFilter" : false,
								data : itemSet,
								columns : item_columns
							});

							$('#myTable tbody')
									.on(
											'click',
											'.edit-item-row',
											function() {
												var table = $('#myTable')
														.DataTable();
												var tr = $(this).closest('tr')
												var data = table
														.row(
																this.parentElement.parentElement)
														.data();
												setEntryPopUp(data);
											});

							$('#myTable tbody')
									.on(
											'click',
											'.delete-item-row',
											function() {
												var table = $('#myTable')
														.DataTable();
												var data = table
														.row(
																this.parentElement.parentElement)
														.data();
												if (confirm("Are you sure you want to delete this?")) {

													$
															.ajax({
																type : "POST",
																url : "/post/delete/item/"
																		+ data.itemId,
																data : JSON
																		.stringify({}),
																dataType : "json",
																"contentType" : "application/json",
																success : function(
																		data) {
																	if (data != null) {
																		if (data.status == "FAILURE") {
																			alert("failure -->"
																					+ data.message);
																		} else {
																			window.location
																					.reload();
																		}
																	}
																},
																error : function(
																		data) {
																	alert(alert);
																}
															});
												} else {
													return false;
												}
											});

						};
						$("#addEntry").on("click", function() {
							clearEntryPopUp();
							$("#hsn").val("39252000");
							$("#addItem").modal("show");
						});
						
						
						var setEntryPopUp = function(data) {
							clearEntryPopUp();
							$("#itemId").val(data.itemId);
							$("#itemDesc").val(data.itemDesc);
							$("#hsn").val(data.hsn);
							$("#quantity").val(data.quantity);
							$("#price").val(data.price); 
							$("#total").val(data.total); 
							$("#addItem").modal("show");
						};
						var clearEntryPopUp = function(data) {
							$("#itemId").val('');
							$("#itemDesc").val('');
							$("#quantity").val('');
							$("#price").val('');
							$("#total").val('');

						};

						$("#cancelEntryPopup,#closeWindowPopup").on("click", function() {
									$("#addItem").modal("hide");
									$("#submitEntryPopup").attr("disabled",false);
									$("#submitEntryPopup").html("Save");
						});
						
						$("#submitEntryPopup")
								.on("click",
										function() {
											var item = {};
											if ($("#itemDesc").val() != ""
													&& $("#itemDesc").val().length > 0) {

												var total = $("#quantity").val() * $("#price").val();

												item = {
													"invoiceId" : $(
															"#invoiceId").val(),
													"itemDesc" : $("#itemDesc")
															.val().toUpperCase(),
													"quantity" : $("#quantity")
															.val(),
													"price" : $("#price").val(),
													"total" : total,
													"itemId" : $("#itemId")
															.val() ,
													"userName" : userName ,
													"hsn":$("#hsn").val()
												};
											} else {
												alert("Please Enter Entry details");
												return false;
											}

											console.log(item);
											$
													.ajax({
														type : "POST",
														url : "/post/add/items",
														data : JSON
																.stringify(item),
														dataType : "json",
														"contentType" : "application/json",
														beforeSend: function() {
															$("#submitEntryPopup").attr("disabled",true);
															$("#submitEntryPopup").html("In Progress  <i class='fa fa-spinner fa-spin'></i>");
														},
														success : function(data) {
															if (data != null) {
																if (data.status == "FAILURE") {
																	alert("failure -->"
																			+ data.message);
																} else {
																	window.location
																			.reload();
																}
															}
														},
														error : function(data) {
															alert(alert);
														}
													});

										});
						
						 
						$("#generateInvoice").on("click",function(){
							var invoiceId = $('#invoiceId').val();
							 window.open("/GenerateInvoice?invoiceId="+invoiceId+"&orderId="+orderId,"_blank");
						}); 
						
						$('#manual').click(function(){
							  if($(this).is(":checked")){
								  disabledFields(false);
							  }
							  else if($(this).is(":not(:checked)")){
								  disabledFields(true);
							  }
							});
						
						var disabledFields = function(data) {
							for(var i=0;i<manual_fields.length>0;i++){
								$("#"+manual_fields[i]+"").attr("disabled",data);
							}
						}; 
					
						$('#submitHeader').click(function(){
								saveInvoice();
						});
						var saveInvoice = function() {
							orderDetail.invoiceDate = $("#invoiceDate").val();
							orderDetail.dueDate = $("#dueDate").val();
							orderDetail.status = $("#status").val();
							orderDetail.cgst_amount = $("#invCGSTAmt").val();
							orderDetail.sgst_amount = $("#invSGSTAmt").val();
							orderDetail.gstRounding = $("#gstRoundingAmt").val();
							orderDetail.gst_amount = $("#gstAmt").val();
							orderDetail.amountExcludingTax = $("#amountExcludingTax").val();
							orderDetail.advanceAmount = $("#advanceAmount").val();
							orderDetail.totalAmount = $("#totalAmount").val();
							orderDetail.balanceAmount = $("#balanceAmount").val();
							orderDetail.transMode = $("#transMode").val();
							orderDetail.transNumber = $("#transNumber").val();
							orderDetail.manual = $('#manual').is(":checked");
							orderDetail.modifiedBy = userName;
							console.log(orderDetail);
							$.ajax({
								type : "POST",
								url : "/post/save/invoice",
								data : JSON.stringify(orderDetail),
								dataType : "json",
								"contentType" : "application/json",
								beforeSend: function() {
									//$("#submitBtn").removeClass("btn-primary");
									$("#submitHeader").attr("disabled",true);
									$("#submitHeader").html("In Progress  <i class='fa fa-spinner fa-spin'></i>");
								}, 
								success : function(data) {
									$("#submitHeader").attr("disabled",false);
									$("#submitHeader").html("Save");
									if (data != null) {
										if (data.status == "FAILURE") {
											alert("failure -->" + data.message);
										} else {
											 window.location.reload();
										}
									}
								},
								error : function(data) {
									alert(data);
								}
							});
						}
					});