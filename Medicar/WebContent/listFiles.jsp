<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<title>MEDICAR Diagnosis Manager</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link rel="stylesheet" href="style/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <style>
  .jumbotron {
      background-color: #345678;
      color: #fff;
  }
  .jumboTronContainer{ margin-top:0%; height:12%; padding:0;  }
  
  </style>
 
  <link rel="stylesheet" href="style/PatientDashboardStyles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/Chart.bundle.min.js"></script>
</head>
<body>

	<% if (session.getAttribute("currentUser") == null){ %>
		<% 
		RequestDispatcher view = request.getRequestDispatcher("logout.jsp");
		view.forward(request, response);
		%>
			response.sendRedirect("logout.jsp");
	<% } else { %>
		<div class="jumbotron text-center">
			<h1>Files</h1>
		</div>
	`		<%@ include file="patient_navbar.jsp"%>

		<div class="FilesContainer" style="margin-left:25%; margin-top:7.5%">
			<table border=1 width="900">
				<thead>
					<tr>
						<th style="color: white; background-color:#C0C0C0; text-align: center; font-size: 24px; heigt:24px;">File Id</th>
						<th style="color: white; background-color:#C0C0C0; text-align: center; font-size: 24px; heigt:24px;">Patient Id</th>
						<th style="color: white; background-color:#C0C0C0; text-align: center; font-size: 24px; heigt:24px;">Uploaded On</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${files}" var="file">
						<tr>
							<td align="center"><c:out value="${file.getFileId()}" /></td>
							<td align="center"><c:out value="${file.getPatientId()}" /></td>
							<td align="center"><c:out value="${file.getTimeStamp()}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2" id = "uploadButton">
					<%@ include file="csvUploadButton.jsp" %>
				</div>
			</div>
		</div>

	
			
	<% } %>


</body>
</html>