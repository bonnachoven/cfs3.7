<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="databean.HistoryBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<jsp:include page="template-cus.jsp" />

<div class="col-md-10" role="main">
				
		<ul class="breadcrumb">
					
		<!-- <li class="active"><a href="customermanage.do">View Account</a> 
		<span class="divider">/ </span></li> -->
					
		<li><a href="transactionHistory.do">Game Play History</a> 
		<span class="divider">/ </span>			
		</li>		
		</ul>
				
</div> 
<div style="width: 400px;">  <h2>All Game Play for ${username}</h2></div>
<div class="container">
   <table class="table table-striped">
    <thead>
      <tr>
      	<th>Game Play</th>
        <th>Date</th>
        <th style="text-align:right">Points</th>
        <th style="text-align:right">Help from friends</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="his" items="${history}" >
      <tr>
      	<td>${his.transaction_id}</td>
		<c:choose>
       		<c:when test="${empty his.execute_date}" >
      			<td>PENDING</td>
     		</c:when>
      		<c:otherwise>	
      				<td>${his.execute_date}</td>
      		</c:otherwise>
      	</c:choose> 
        <td style="text-align:right"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${his.shares / 1000}" /></td>
        <td style="text-align:right"> <fmt:formatNumber type="number" maxFractionDigits="2" value="${his.amount / 100}" /> </td>  
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<jsp:include page="template-bottom.jsp" />