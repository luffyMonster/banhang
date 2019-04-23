<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Receipt</title>

    </head>
    <body>

        <div class="page-container">	

            <div class="left-content">

                <div class="mother-grid-inner">

                    <jsp:include page="header.jsp"></jsp:include>

                        <div class="inner-block">
                            <h2>Report Receipt</h2>
                            <div class="chit-chat-layer1">
                                <div class="col-md-6 chit-chat-layer1-left">
                                    <div class="glocy-chart">
                                        <div class="span-2c">  
                                            <h3 class="tlt">Line Chart</h3>
                                            <canvas id="viewchart1" height="300" width="400" style="width: 400px; height: 300px;"></canvas>
                                            <script>
                                                var lineChartData = {
                                                    labels: [<c:forEach var="item" items="${listReceipt}">'${item.time}',</c:forEach>],
                                                    datasets: [
                                                        {
                                                            fillColor: "#FC8213",
                                                            data: [<c:forEach var="item" items="${listReceipt}">${item.value},</c:forEach>]
                                                        }
                                                    ]

                                                };
                                                new Chart(document.getElementById("viewchart1").getContext("2d")).Line(lineChartData);

                                            </script>
                                        </div> 			  		   			
                                    </div>
                                </div>
                                <div class="col-md-6 chit-chat-layer1-rit">    	
                                    <div class="glocy-chart">
                                        <div class="span-2c">  
                                            <h3 class="tlt">Bar Chart</h3>
                                            <canvas id="bar" height="300" width="400" style="width: 400px; height: 300px;"></canvas>
                                            <script>
                                                var barChartData = {
                                                    labels: [<c:forEach var="item" items="${listReceipt}">'${item.time}',</c:forEach>],
                                                    datasets: [
                                                        {
                                                            fillColor: "#FC8213",
                                                            data: [<c:forEach var="item" items="${listReceipt}">${item.value},</c:forEach>]
                                                        }
                                                    ]

                                                };
                                                new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);

                                            </script>
                                        </div> 			  		   			
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    <jsp:include page="footer.jsp" />
                    </div>
                </div>

            <jsp:include page="navigation.jsp" />

        </div>

    </body>
</html>
