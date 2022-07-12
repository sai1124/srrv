$(document).ready(function(){
			var fetchPayments = function() {
					var req = {"invoiceId":$("#invoiceId").val()};					
					$.ajax({
						type : "POST",
						url : "/post/fetchAll/payments",
						data : JSON.stringify(req),
						dataType : "json",
						"contentType" : "application/json",
						success : function(data) {
							if (data != null) {
								if (data.status == "FAILURE") {
									alert("failure -->"
											+ data.message);
								} else {
									paymentSet = data.records;
									setPaymentData();
								}
							}
						},
						error : function(data) {
							alert(alert);
						}
					});
		};
		
		var setPaymentData = function() {
			 $('#paymentsTable').DataTable({
					"paging" : false,
					"ordering" : false,
					"info" : false,
					"bFilter" : false,
					data : paymentSet,
					columns : payments_columns
				});
			 
				$('#paymentsTable tbody').on('click','.edit-payment-row',function() {
							var table = $('#paymentsTable').DataTable(); 
							var data = table.row(this.parentElement.parentElement).data();
							setPaymentsPopUpData(data);
				});

				$('#paymentsTable tbody').on( 'click', '.delete-payment-row', function() {
									var table = $('#paymentsTable').DataTable();
									var data = table.row(this.parentElement.parentElement).data();
									if (confirm("Are you sure you want to delete this payment?")) {
										$.ajax({	type : "POST",
													url : "/post/delete/payment/"+ data.paymentId,
													data : JSON.stringify({}),
													dataType : "json",
													"contentType" : "application/json",
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
									} else {
										return false;
									}
								});
				 }
			
			var setPaymentsPopUpData = function(data) {
							$("#paymentType").val(data.paymentType);
							$("#reference").val(data.reference);
							$("#paymentId").val(data.paymentId);
							$("#paymentAmount").val(data.amount); 
							$("#paymentPopUp").modal('show');
						};
			
			$("#submitPaymentPopup").on('click', function() {
							var paymentRec = {};
							if ($("#reference").val() != ""
									&& $("#reference").val().length > 0) {
 								paymentRec = {
									"paymentId" : $("#paymentId").val(),
									"reference" : $("#reference").val(),
									"invoiceId" : $("#invoiceId").val(),
									"amount" : $("#paymentAmount").val(),
									"paymentType":$("#paymentType").val(),
									"userName" : userName
								};
							} else {
								alert("Please Enter Entry details");
								return false;
							} 

							console.log(paymentRec);
							$.ajax({
										type : "POST",
										url : "/post/save/payment",
										data : JSON.stringify(paymentRec),
										dataType : "json",
										"contentType" : "application/json",
										success : function(data) {
											if (data != null) {
												if (data.status == "FAILURE") {
													alert("failure -->"+ data.message);
												} else {
													window.location.reload();
												}
											}
										},
										error : function(data) {
											alert(alert);
										}
								});
						});
						$("#cancelPaymentPopup,#closePaymentsPopup").on("click", function() {
							clearPaymentPopUp();
							$("#paymentPopUp").modal("hide");
						});
						var clearPaymentPopUp = function() {
							$("#paymentType").val('');
							$("#reference").val('');
							$("#paymentId").val('');
							$("#paymentAmount").val('');
						}
						

			var defaultDateFormat = function(data) {
							var curr = data.split("T")[0];
							var parsed = curr.split("-");
							return parsed[2] + "/" + parsed[1] + "/"
									+ parsed[0];
						}
						
});