<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invoice</title>
<jsp:directive.include file="ScriptTags.jsp" />
<style type="text/css">
.header {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}

.row {
	margin: 0px !important;
}

th {
	text-align: center;
	background-color: grey;
	color: white;
	font-weight: bold;
}

thead>td {
	font-size: 12px;
	border-right: 1px solid #0c0c0c;
	border-bottom: 1px solid #0c0c0c;
	background-color: #efefef;
	font-weight: bold;
	text-align: left;
	padding: 7px;
	color: #222222;
}

.grid-container {
	display: grid;
	grid-template-columns: auto auto;
	padding: 10px;
}

.grid-item {
	background-color: rgba(255, 255, 255, 0.8);
	border: 1px solid rgba(0, 0, 0, 0.8);
	padding: 20px;
	text-align: center;
	width: 100%;
}

body{
font-size: 10px;
}
</style>
<script type="text/javascript">
	var orderId = "${orderId}";
	var userName = "${userName}";
</script>
</head>
<body>
	<div class="container">
		<div id="joblist_customer" style="width:100%;margin-top: 50px"></div>
		<div id="joblist" class="grid-container" style=""></div>
	</div>
</body>
<script type="text/javascript">
	var orderDetail = {};
	$(document)
			.ready(
					function() {

						var plastwin_2track_fun = function(h0, w0) {
							var w1 = w0 + 6;//E10
							var h1 = h0 + 6;//E11
							var w2 = (w1 - 22)/2;// E12
							var h2 = h1 - 75;//E13
							var w3 = (w1 - 22)/2;// E14
							var h3 = h1 - 75;//E15
							var h4 = h2 - 12;//E16
							var w4 = w2 - 84;//E17
							var h5 = h2 - 84;//E18

							//REINFORCEMENT

							var rw1 = w1 - 80;
							var rh1 = h1 - 80;
							var rw2 = w2 - 95;
							var rh2 = h2 - 95;
							var rh3 = (rh2 - 110)/2;
							var rh4 = h3 - 100;
							var rw3 = w2 - 89;
							var rh5 = h2 - 89;

							var plastwin_2track_profile = [ {
								"profileName" : "2.5 - FRAME",
								"worh" : "W",
								"nos" : "2",
								"mm" : w1
							}, {
								"profileName" : "2.5 - FRAME",
								"worh" : "H",
								"nos" : "2",
								"mm" : h1
							}, {
								"profileName" : "SASH",
								"worh" : "W",
								"nos" : "4",
								"mm" : w2
							}, {
								"profileName" : "SASH",
								"worh" : "H",
								"nos" : "4",
								"mm" : h2
							}, {
								"profileName" : "SCREEN/MESS",
								"worh" : "W",
								"nos" : "2",
								"mm" : w3
							}, {
								"profileName" : "SCREEN/MESS",
								"worh" : "H",
								"nos" : "2",
								"mm" : h3
							}, {
								"profileName" : "INTER LOCK",
								"worh" : "H",
								"nos" : "2",
								"mm" : h4
							}, {
								"profileName" : "GLAZING BEED",
								"worh" : "W",
								"nos" : "4",
								"mm" : w4
							}, {
								"profileName" : "GLAZING BEED",
								"worh" : "H",
								"nos" : "4",
								"mm" : h5
							} ];

							var plastwin_2track_rf = [ {
								"profileName" : "FRAME",
								"worh" : "W",
								"nos" : "2",
								"mm" : rw1
							}, {
								"profileName" : "FRAME",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh1
							}, {
								"profileName" : "SASH",
								"worh" : "W",
								"nos" : "4",
								"mm" : rw2
							}, {
								"profileName" : "SASH",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh2
							}, {
								"profileName" : "SASH (LOCK)",
								"worh" : "H",
								"nos" : "4",
								"mm" : rh3
							}, {
								"profileName" : "MESS",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh4
							}, {
								"profileName" : "GLASS",
								"worh" : "W",
								"nos" : "2",
								"mm" : rw3
							}, {
								"profileName" : "GLASS",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh5
							} ];

							console.log("plastwin_2track_profile");
							console.log(plastwin_2track_profile);
							console.log("plastwin_2track_rf");
							console.log(plastwin_2track_rf);
							return {"profile":plastwin_2track_profile,"rf":plastwin_2track_rf}
						}

						var kinbon_2track_fun = function(h0, w0) {

							var w1 = w0 + 6;
							var h1 = h0 + 6;
							var w2 = (w1 - 20) / 2;
							var h2 = h1 - 85;
							var h3 = h2 - 12;
							var w3 = w2 - 92;
							var h4 = h2 - 92;

							var rw1 = w1 - 80;
							var rh1 = h1 - 80;
							var rw2 = w2 - 95;
							var rh3 = h2 - 95;
							var rh4 = (rh3 - 110) / 2;
							var rw3 = w2 - 99;
							var rh5 = h2 - 99;

							var kinbon_2track_profile = [ {
								"profileName" : "2 T -FRAME",
								"worh" : "W",
								"nos" : "2",
								"mm" : w1
							}, {
								"profileName" : "2 T-FRAME",
								"worh" : "H",
								"nos" : "2",
								"mm" : h1
							}, {
								"profileName" : "SASH",
								"worh" : "W",
								"nos" : "4",
								"mm" : w2
							}, {
								"profileName" : "SASH",
								"worh" : "H",
								"nos" : "4",
								"mm" : h2
							}, {
								"profileName" : "INTER LOCK",
								"worh" : "H",
								"nos" : "2",
								"mm" : h3
							}, {
								"profileName" : "GLAZING BEED",
								"worh" : "W",
								"nos" : "4",
								"mm" : w3
							}, {
								"profileName" : "GLAZING BEED",
								"worh" : "H",
								"nos" : "4",
								"mm" : h4
							} ];

							var kinbon_2track_rf = [ {
								"profileName" : "FRAME",
								"worh" : "W",
								"nos" : "2",
								"mm" : rw1
							}, {
								"profileName" : "FRAME",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh1
							}, {
								"profileName" : "SASH",
								"worh" : "W",
								"nos" : "4",
								"mm" : rw2
							}, {
								"profileName" : "SASH",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh3
							}, {
								"profileName" : "SASH (LOCK)",
								"worh" : "H",
								"nos" : "4",
								"mm" : rh4
							}, {
								"profileName" : "GLASS",
								"worh" : "W",
								"nos" : "2",
								"mm" : rw3
							}, {
								"profileName" : "GLASS",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh5
							} ];
 
							console.log("kinbon_2track_profile");
							console.log(kinbon_2track_profile);
							console.log("kinbon_2track_rf");
							console.log(kinbon_2track_rf);
							return {"profile":kinbon_2track_profile,"rf":kinbon_2track_rf}
						}

						var kinbon_25track_fun = function(h0, w0) {

							var w1 = w0 + 6;
							var h1 = h0 + 6;
							var w2 = (w1 - 20)/2;
							var h2 = h1 - 85;
							var w3 = (w1 - 20)/2;
							var h3 = h1 - 85;
							var h4 = h2 - 12;
							var w4 = w2 - 92;
							var h5 = h2 - 92;
							var rw1 = w1 - 80;
							var rh1 = h1 - 80;
							var rw2 = w2 - 95;
							var rh2 = h2 - 95;
							var rh3 = ((h2 - 95) - 110)/2;
							var rh4 = h3 - 100;
							var rw3 = w2 - 99;
							var rh4 = h2 - 99;

							var kinbon_25track_profile = [ {
								"profileName" : "2.5 -FRAME",
								"worh" : "W",
								"nos" : "2",
								"mm" : w1
							}, {
								"profileName" : "2.5 -FRAME",
								"worh" : "H",
								"nos" : "2",
								"mm" : h1
							}, {
								"profileName" : "SASH",
								"worh" : "W",
								"nos" : "4",
								"mm" : w2
							}, {
								"profileName" : "SASH",
								"worh" : "H",
								"nos" : "4",
								"mm" : h2
							}, {
								"profileName" : "SCREEN/MESS",
								"worh" : "W",
								"nos" : "2",
								"mm" : w3
							}, {
								"profileName" : "SCREEN/MESS",
								"worh" : "H",
								"nos" : "2",
								"mm" : h3
							}, {
								"profileName" : "INTER LOCK",
								"worh" : "H",
								"nos" : "2",
								"mm" : h4
							}, {
								"profileName" : "GLAZING BEED",
								"worh" : "W",
								"nos" : "4",
								"mm" : w4
							}, {
								"profileName" : "GLAZING BEED",
								"worh" : "H",
								"nos" : "4",
								"mm" : h5
							} ];

							var kinbon_25track_rf = [ {
								"profileName" : "FRAME",
								"worh" : "W",
								"nos" : "2",
								"mm" : rw1
							}, {
								"profileName" : "FRAME",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh1
							}, {
								"profileName" : "SASH",
								"worh" : "W",
								"nos" : "4",
								"mm" : rw2
							}, {
								"profileName" : "SASH",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh2
							}, {
								"profileName" : "SASH (LOCK)",
								"worh" : "H",
								"nos" : "4",
								"mm" : rh3
							}, {
								"profileName" : "MESS",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh4
							}, {
								"profileName" : "GLASS",
								"worh" : "W",
								"nos" : "2",
								"mm" : rw3
							}, {
								"profileName" : "GLASS",
								"worh" : "H",
								"nos" : "2",
								"mm" : rh4
							}, ];
							console.log("kinbon_25track_profile");
							console.log(kinbon_25track_profile);
							console.log("kinbon_25track_rf");
							console.log(kinbon_25track_rf);
							return {"profile":kinbon_25track_profile,"rf":kinbon_25track_rf}
						}
						var initFun = function() {
							var inputJson = {};
							inputJson.orderId = orderId;
							$
									.ajax({
										type : "POST",
										url : "/post/find/Order",
										data : JSON.stringify(inputJson),
										dataType : "json",
										"contentType" : "application/json",
										success : function(data) {
											if (data != null) {
												if (data.status == "SUCCESS") {
													orderDetail = data.records[0];
													var order = orderDetail;
													if (order.items != null && order.items.length > 0) {
														var items = order.items;
														console.log(items);
														var customerInfo = "<footer></footer><div style='width:100%'>";
														customerInfo += "<table style='width:100%;font-weight: bold;'>";
														customerInfo += "<tr style='border:1px solid  #0c0c0c;'>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;font-weight: bold;'>";
														customerInfo += "Customer Name";
														customerInfo += "</td>";
														customerInfo += "<td colspan='4' style='border:1px solid  #0c0c0c;text-align:center;font-weight: bold;'>";
														customerInfo += order.customerName;
														customerInfo += "</td>";
														customerInfo += "</tr style='border:1px solid  #0c0c0c;'>";
														customerInfo += "<tr>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;'>";
														customerInfo += "Customer Address";
														customerInfo += "</td>";
														customerInfo += "<td colspan='4' style='border:1px solid  #0c0c0c;text-align:center'>";
														customerInfo += order.customerAddress;
														customerInfo += "</td>";
														customerInfo += "</tr>";

														customerInfo += "<tr style='border:1px solid  #0c0c0c;'>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;'>";
														customerInfo += "No of Windows";
														customerInfo += "</td>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;text-align:center'>";
														customerInfo += order.noWindow;
														customerInfo += "</td>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;text-align:center'>";
														customerInfo += orderDetail.profileType.name;
														customerInfo += "</td>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;' >";
														customerInfo += "Date";
														customerInfo += "</td>";
														customerInfo += "<td style='border:1px solid  #0c0c0c;text-align:center;'>";
														customerInfo += orderDetail.orderDate;
														customerInfo += "</td>";
														customerInfo += "</tr>";

														customerInfo += "</table>";
														customerInfo += "</div>";
														$("#joblist_customer").append(customerInfo); 
															 
															for (var j = 0; j < items.length; j++) {	
																var item = items[j];
																var height = item.height;
																var width = item.width;
																var rows = "";
																if (item.itemType=='WINDOW') {
																	rows += "<div class='grid-item' style='margin-bottom:30px'><table style='width:100%'>";
																	rows += "<tr style='background-color:grey;color:white;text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;' colspan='4'>SRR UPVC -&nbsp;"
																			+ orderDetail.profileType.name
																			+ "&nbsp;- JOB CARD"
																			+ "</td></tr>";
																	rows += "<tr style='text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;'>WINDOW NO</td><td  colspan='3' style='text-align:center;border-right:1px solid  #0c0c0c;'>"
																			+ item.name
																			+ "</td></tr>";
																	rows += "<tr style='text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;'>WIDTH FINAL</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>"
																			+ item.width
																			+ "</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>Glass Type</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>Profile-Model</td></tr>";
																	rows += "<tr style='text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;'>HEIGHT FINAL</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>"
																			+ item.height
																			+ "</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>"
																			+ item.glass_type_name
																			+ "</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>"
																			+ item.model_rate_name
																			+ "</td></tr>";
																	rows += "<tr style='background-color:grey;color:white;text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;'>PROFILE</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>W/H</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>No</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>MM</td></tr>";
																	
																	var record = {};
																	if(orderDetail.profileType.name=='KINBON'&&item.model_rate_name.replace(" ","").replace(".","").toLowerCase()=="25track"){
																		record=kinbon_25track_fun(height,width)
																	}
																	if(orderDetail.profileType.name=='KINBON'&&item.model_rate_name.replace(" ","").replace(".","").toLowerCase()=="2track"){
																		record=kinbon_2track_fun(height,width)
																	}
																	if(orderDetail.profileType.name=='PLASTWIN'&&item.model_rate_name.replace(" ","").replace(".","").toLowerCase()=="2track"){
																		record=plastwin_2track_fun(height,width)
																	}
																	
																	rows += "<tr style='background-color:grey;color:white;text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;'>PROFILE</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>W/H</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>No</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>MM</td></tr>";
																	
																	var profileMap = record.profile;
																	var rf= record.rf;
																	
																	$.each(profileMap,function(key,profile){
																		rows += "<tr style='text-align:center;border:1px solid  #0c0c0c;'>";
																		$.each(profile,function(key1,value1){
																			rows += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+value1+"</td>";
																		});
																		rows += "</tr>"; 
																	});
																	 
																	rows += "<tr style='background-color:grey;color:white;text-align:center;border:1px solid  #0c0c0c;'><td style='text-align:center;border-right:1px solid  #0c0c0c;'>REINFORCEMENT</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>W/H</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>No</td><td style='text-align:center;border-right:1px solid  #0c0c0c;'>MM</td></tr>";
																	var rfMap= record.rf;
																	
																	$.each(rfMap,function(key,rf){
																		rows += "<tr style='text-align:center;border:1px solid  #0c0c0c;'>";
																		$.each(rf,function(key1,value1){
																			rows += "<td style='text-align:center;border-right:1px solid  #0c0c0c;'>"+value1+"</td>";
																		});
																		rows += "</tr>"; 
																	});
																	
																	rows += "</table></div>";
																} 
																rows += "</div>";

																$("#joblist").append(rows);

															}
													}
												}

											}
										},
										error : function(data) {

										}
									});

						}
						initFun();
					});
</script>
</html>