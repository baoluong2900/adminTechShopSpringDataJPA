<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions"%>
<!--  <c:set var="contextPath" value="${pageContext.request.contextPath}" /> -->
<!DOCTYPE html>
<html>
<head>
  <jsp:include page="layout/header.jsp"></jsp:include>
  
  <title>Tech HuscShop</title>
  <link rel="stylesheet" href="resources/css/list-product.css" />
</head>

  <body>
  	
    <div class="wrapper">
	<!-- Sidebar  -->
	<nav id="sidebar">
	  <div class="sidebar-header">
	    <h3>Tech HuscShop</h3>
	  </div>
	
	  	<ul class="list-unstyled components">
		    <li><p class="h5" style="color:#0c295e">Administrator</p></li>
		    <li >
		      <a href="product">Manager Product</a>
		    </li>
		    <li class="active">
		      <a href="customer">Manager Customer</a>
		    </li>
		    <li>
		      <a href="category">Manager Category</a>
		    </li>
		
		    <li >
		      <a href="order">Manager Order</a>
		    </li>
		
		    <li>
		      <a href="#">Logout</a>
		    </li>
	  </ul>
	</nav>
    <!-- Page Content  -->
      <div id="content">
        <h2 class="mb-4">List Customer</h2>
        
        <div class="d-flex justify-content-between mb-3">
	        <div class="col-7">
	        	<form class="row" action="customer" method="post">
		        	<div class="form-group row col-6">
					    <label for="staticEmail" class="col-sm-2 col-form-label px-0">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="nameSearch" name="name" placeholder="Customer name" value="${searchValue}">
					    </div>
					</div>
				    <div>
				    	<button type="submit" class="btn btn-outline-primary">Search<i class="fa fa-yahoo" aria-hidden="true"></i></button>
				    </div>
				</form>
	        </div>
			<div>
				<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#AddModal">
                New Customer<i class="fa fa-plus ml-3" aria-hidden="true"></i>
            </button>
			</div>
        </div>
          <table class="table table-striped table-bordered table-dashboard">
            <thead class="thead-inverse">
              <tr>
              	<th>No.</th>
                 <th>CustomerId</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Phone</th>
                <th>RegisteredDate</th>
                <th></th>
              </tr>
              </thead>
              <tbody>
                <c:set var = "no" value = "0"/>
				<c:forEach var="Cus" items="${listCustomer}">
		                <tr>
		                  <c:set var = "no" value = "${no + 1}"/>
		          		  	<td>${no}</td>
	                        <td>${Cus.customerId}</td>
	   						<td>${Cus.name}</td>
	   						<td>${Cus.email}</td>
	   						<td>${Cus.password}</td>
	   						<td>${Cus.phone}</td>
	   						<td><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${Cus.registeredDate}"/></td>
		
		                  <td>
		                      <button class="btn btn-outline-warning edit-customer-btn" data-id="${Cus.customerId}" data-name="${Cus.name}"><i class="fas fa-edit"></i></button>
		                      <a href="delete-customery/${Cus.customerId}" class="btn btn-outline-danger delete-customer-btn"><i class="fas fa-recycle"></i></a>
		                  </td>
		                </tr>
                </c:forEach>
              </tbody>
          </table>

          <div class="d-flex justify-content-between">
            <form action="" method="get">

    
             </form>
    
             <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  <li class="page-item active"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                </ul>
              </nav>
          </div>

      </div>
    </div>
    
    <!--    commmet  -->


   
   
   <!-- coomet -->  

   
    	<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-left: 200px;">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content"  style="width: 900px; margin-left: -350px;">
          	<form action="update-category" method="post">
	            		  <div class="modal-header">
			              <h5 class="modal-title" id="titl">Update Customer</h5>
			              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                <span aria-hidden="true">&times;</span>
			              </button>
			        </div>
                
		            <div class="modal-body"  style="width: 900px;">
		                <div class="row">
		                    <div class="col-8">
		                        <div class="form-group">
		                          <label for="customerId">Customer ID:</label>
		                          <input type="text" class="form-control" name="customerId" id="customerId" aria-describedby="customerHid" placeholder="Customer ID">
		                          <small id="customerHid" class="form-text text-muted">Customer id is required</small>
		                        </div>
		    
		                        <div class="form-group">
		                          <label for="name">Name </label>
		                          <input type="text" class="form-control" name="name" id="name" aria-describedby="nameHid" placeholder="Customer Name">
		                          <small id="nameHid" class="form-text text-muted">Name is required</small>
		                        </div>
		    
		                        <div class="form-group">
		                          <label for="email">Email</label>
		                          <input type="text" class="form-control" name="email" id="email" aria-describedby="emailHid" placeholder="Email">
		                          <small id="emailHid" class="form-text text-muted">Email is required</small>
		                        </div>
		    
		                        
		                        <div class="form-group">
		                          <label for="phone">Phone</label>
		                          <input type="text" class="form-control" name="phone" id="phone" aria-describedby="phoneHid" placeholder="Phone">
		                          <small id="phoneHid" class="form-text text-muted">Phone is required</small>
		                        </div>
		  
		                    </div>
		                     <div class="col-4">
		                        <div class="form-group">
		                          <label for="password">Passworld</label>
		                          <input type="password" class="form-control" name="password" id="password" aria-describedby="passwordHid" placeholder="Password">
		                          <small id="passwordHid" class="form-text text-muted">Passworld is required</small>
		                        </div>
		
		                        
		                        <div class="form-group">
		                          <label for="confirmingpassword">Confirming Passworld</label>
		                          <input type="password" class="form-control" name="confirmingpassword" id="confirmingpassword" aria-describedby="confirmingpasswordHid" placeholder="Confirming Password">
		                          <small id="confirmingpasswordHid" class="form-text text-muted">Confirming Passworld is required</small>
		                        </div>
		
		
		
		                        <div class="form-group">
		                          <label for="registereddate">Registered Date</label>
		                          <input type="date" class="form-control" name="registereddate" id="registereddate" aria-describedby="registereddateHid" placeholder="Registered Date">
		                          <small id="registereddateHid" class="form-text text-muted">Registered Date is required</small>
		                        </div>
		                    </div>
		                </div>
		            </div>
		                  <div class="modal-footer">
						              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						              <button type="submit" class="btn btn-primary">Save changes</button>
	         			   </div>
            </form>
          		
          				
          </div>
          
        </div>
    </div>

       
    <script>
      $(document).ready(function () {
        $("#sidebarCollapse").click(function () {
          $("#sidebar").toggleClass("active");
        });
        
        $(".edit-category-btn").click(function () {
            $("#UpdateModal").modal();
            $("#categoryId").val($(this).attr("data-id"));
            $("#name").val($(this).attr("data-name"));
          });
      });
    </script>
  </body>
</html>
 