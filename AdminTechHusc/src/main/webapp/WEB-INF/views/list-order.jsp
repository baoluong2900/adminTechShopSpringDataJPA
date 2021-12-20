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
		    <li>
		      <a href="customer">Manager Customer</a>
		    </li>
		    <li >
		      <a href="category">Manager Category</a>
		    </li>
		
		    <li class="active">
		      <a href="order">Manager Order</a>
		    </li>
		
		    <li>
		      <a href="#">Logout</a>
		    </li>
	  </ul>
	</nav>
	
      <!-- Page Content  -->
      <div id="content">
        <h2 class="mb-4">List Order</h2>
        
        <div class="d-flex justify-content-between mb-3">
	        <div class="col-7">
	        	<form class="row" action="order" method="post">
		        	<div class="form-group row col-6">
					    <label for="staticEmail" class="col-sm-2 col-form-label px-0">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="nameSearch" name="name" placeholder="Order name" value="${searchValue}">
					    </div>
					</div>
				    <div>
				    	<button type="submit" class="btn btn-outline-primary">Search<i class="fa fa-yahoo" aria-hidden="true"></i></button>
				    </div>
				</form>
	        </div>
			<div>
				<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#AddModal">
                New Order<i class="fa fa-plus ml-3" aria-hidden="true"></i>
            </button>
			</div>
        </div>
          <table class="table table-striped table-bordered table-dashboard">
            <thead class="thead-inverse">
              <tr>
              	<th>No.</th>
              	<th>OrderId </th>
                <th> OrderDate </th>
                <th> Customer name </th>
                <th> Amount </th>
                <th> Status </th>
                <th></th>
              </tr>
              </thead>
              <tbody>
                <c:set var = "no" value = "0"/>
				<c:forEach var="Ord" items="${listOrder}">
		                <tr>
		                  <c:set var = "no" value = "${no + 1}"/>
				          		   <td>${no}</td> 
			                  <td>${Ord.orderId}</td>
			                  <td><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${Ord.orderDate}"/></td>
		  						<td>${Ord.getCustomer().getName()}</td>
		  						<td>${Ord.amount}</td>
		  						<td>${Ord.status}</td>
		          		  
		                  <td>
		                      <button class="btn btn-outline-warning edit-order-btn" data-id="${Cat.orderId}" data-name="${Cat.name}"><i class="fas fa-edit"></i></button>
		                      <a href="delete-order/${Cat.orderId}" class="btn btn-outline-danger delete-order-btn"><i class="fas fa-recycle"></i></a>
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

    <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-left: 200px;">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content"  style="width: 900px; margin-left: -350px;">
          	<form action="add-order" method="post">
	            <div class="modal-header">
	              <h5 class="modal-title" id="exampleModalLongTitle">Add order</h5>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	              </button>
	            </div>
	            <div class="modal-body"  style="width: 900px;">
	               			<div class="row">
                    <div class="col">
                      <div class="form-group">

                        <div class="form-group">
                          <label for="productId">Order ID:</label>
                          <input type="productId" class="form-control" name="productId" id="productId" aria-describedby="productHId" placeholder="Product ID">
                          <small id="productHId" class="form-text text-muted">Product id is required</small>
                        </div>


                        
                        <div class="form-group">
                          <label for="orderDate">Order Date</label>
                          <input type="date" class="form-control" name="orderDate" id="orderDate" aria-describedby="orderDateHid" placeholder="Order Date">
                          <small id="orderDateid" class="form-text text-muted">Order Date is required</small>
                        </div>
                                

                        <div class="form-group">
                          <label for="customerId">Customer ID:</label>
                          <input type="productId" class="form-control" name="customerId" id="customerId" aria-describedby="customerHId" placeholder="Customer ID">
                          <small id="customerHId" class="form-text text-muted">Customer id is required</small>
                        </div>


             
                        <div class="input-group form-group">
                          <span class="input-group-text">Amount</span>
                          <input type="number" name="amount" id="amount" class="form-control" placeholder="Amount">
                          <span class="input-group-text">$</span>
                      </div>

                        
                      <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" name="status" id="status">
                        <option>Out of stock</option>
                        <option>On Sale</option>
                        <option>Feautued</option>
                        <option>Bestseller</option>
                        <option value="">Out of Order</option>
                        </select>
                    </div>

                    </div>
                
                </div>
            </div>
	            </div>
	            <div class="modal-footer">
	              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	              <button type="submit" class="btn btn-primary">Add</button>
	            </div>
            </form>
          </div>
        </div>
    </div>
	
	<div class="modal fade" id="UpdateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-left: 200px;">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content"  style="width: 900px; margin-left: -350px;">
          	<form action="update-order" method="post">
	            <div class="modal-header">
	              <h5 class="modal-title" id="titl">Update categogy</h5>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	              </button>
	            </div>
	            <div class="modal-body"  style="width: 900px;">
	               		<div class="row">
                    <div class="col">
                      <div class="form-group">

                        <div class="form-group">
                          <label for="productId">Order ID:</label>
                          <input type="productId" class="form-control" name="productId" id="productId" aria-describedby="productHId" placeholder="Product ID">
                          <small id="productHId" class="form-text text-muted">Product id is required</small>
                        </div>


                        
                        <div class="form-group">
                          <label for="orderDate">Order Date</label>
                          <input type="date" class="form-control" name="orderDate" id="orderDate" aria-describedby="orderDateHid" placeholder="Order Date">
                          <small id="orderDateid" class="form-text text-muted">Order Date is required</small>
                        </div>
                                

                        <div class="form-group">
                          <label for="customerId">Customer ID:</label>
                          <input type="productId" class="form-control" name="customerId" id="customerId" aria-describedby="customerHId" placeholder="Customer ID">
                          <small id="customerHId" class="form-text text-muted">Customer id is required</small>
                        </div>


             
                        <div class="input-group form-group">
                          <span class="input-group-text">Amount</span>
                          <input type="number" name="amount" id="amount" class="form-control" placeholder="Amount">
                          <span class="input-group-text">$</span>
                      </div>

                        
                      <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" name="status" id="status">
                        <option>Out of stock</option>
                        <option>On Sale</option>
                        <option>Feautued</option>
                        <option>Bestseller</option>
                        <option value="">Out of Order</option>
                        </select>
                    </div>

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
        
        $(".edit-order-btn").click(function () {
            $("#UpdateModal").modal();
            $("#orderId").val($(this).attr("data-id"));
            $("#name").val($(this).attr("data-name"));
          });
      });
    </script>
  </body>
</html>
