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
		    <li class="active" >
		      <a href="product">Manager Product</a>
		    </li>
		    <li>
		      <a href="customer">Manager Customer</a>
		    </li>
		    <li >
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
        <h2 class="mb-4">List Product</h2>
        
        <div class="d-flex justify-content-between mb-3">
	        <div class="col-7">
	        	<form class="row" action="product" method="post">
		        	<div class="form-group row col-6">
					    <label for="staticEmail" class="col-sm-2 col-form-label px-0">Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="nameSearch" name="name" placeholder="product name" value="${searchValue}">
					    </div>
					</div>
				    <div>
				    	<button type="submit" class="btn btn-outline-primary">Search<i class="fa fa-yahoo" aria-hidden="true"></i></button>
				    </div>
				</form>
	        </div>
			<div>
				<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#AddModal">
                New product<i class="fa fa-plus ml-3" aria-hidden="true"></i>
            </button>
			</div>
        </div>
          <table class="table table-striped table-bordered table-dashboard">
            <thead class="thead-inverse">
              <tr>
              	<th>No.</th>
                <th>Image</th>
                <th>product Id</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Discount</th>
                <th>Description</th>
                <th>Entered Date</th>
                <th>Status</th>
                <th>CategoryId</th>			
                <th></th>
              </tr>
              </thead>
              <tbody>
                <c:set var = "no" value = "0"/>
				<c:forEach var="Pro" items="${listProduct}">
		                <tr>
		                   <c:set var = "no" value = "${no + 1}"/>
		          		    <td>${no}</td>
		               	     <td> <img src="${Pro.image}"  style="width:180px;height:130px;"> </td>
		                   	<td>${Pro.productId} </td>
		                  	<td>${Pro.name}</td>
	   						<td>${Pro.quantity}</td>
	   						<td>${Pro.unitPrice}</td>
	   						<td>${Pro.discount}</td>
	   						<td>${Pro.description}</td>
	   						 <td><fmt:formatDate type="both" pattern="dd-MM-yyyy HH:mm" value="${Pro.enteredDate}"/></td>
	   						
	   						<td>${Pro.status}</td>
	   						<td>${Pro.categoryId}</td>
	   						
		
		                  <td>
		                      <button class="btn btn-outline-warning edit-product-btn"
		                       data-id="${Pro.productId}" data-name="${Pro.name}" data-quantity="${Pro.quantity}" data-unitprice="${Pro.unitPrice}"  
		                      data-discount="${Pro.discount}"   data-description="${Pro.description}" data-enteredDate="${Pro.enteredDate}" 
		                      
		                      data-status="${Pro.status}" data-image="${Pro.image}"
		                      
		                      
		                       ><i class="fas fa-edit"></i></button>
		                      <a href="delete-product/${Pro.productId}" class="btn btn-outline-danger delete-product-btn"><i class="fas fa-recycle"></i></a>
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
          	<form action="add-product" method="post">
	            <div class="modal-header">
	              <h5 class="modal-title" id="exampleModalLongTitle">Add product</h5>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	              </button>
	            </div>
	      <div class="modal-body"  style="width: 900px;">
                <div class="row">
                    <div class="col-8">
                  
                          <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" name="name" id="name" aria-describedby="nameHid" placeholder="Name">
                       
                          </div>
                          
                           <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" name="description" id="description" aria-describedby="descriptionHid" placeholder="Description">
                            
                          </div>
                          
                          <div class="form-group">
                              <label for="quantity">Quantity</label>
                              <input type="number" class="form-control" name="quantity" id="quantity" aria-describedby="quantityHid" placeholder="Quantity">
               
                          </div>
                          <div class="input-group form-group">
                              <span class="input-group-text">Unit Price</span>
                              <input type="number" name="unitPrice" id="unitPrice" class="form-control" placeholder="Unit Price">
                              <span class="input-group-text">$</span>
                          </div>
                          
                             
                          <div class="form-group">
                            <label for="categoryId">Category</label>
                           
                            <select class="form-control" name="categoryId" id="categoryId">
                            	<c:forEach var="cate" items="${listCategory}">
                            		<option value="${cate.categoryId }">${cate.categoryId }</option>
                            	</c:forEach>
                            </select>
                          </div> 
                    </div>
                     <div class="col-4">
                            <img src="réources/img/latop1.png"   class="img-fluid " alt="">
                            <div class="form-group">
                            <label for="">Image File</label>
                            <input type="file" class="form-control-file" name="productImage" id="productImage" placeholder="product Image" aria-describedby="productImageHid">
                        
                            </div>
                            
                                <div class="form-group">
                                <label for="entereddate">Entered Date</label>
                                <input type="date" class="form-control" name="enteredDate" id="enteredDate" aria-describedby="enteredDateHid" placeholder="Entered Date">
                                
                              </div>

                            <div class="input-group form-group">
                                <span class="input-group-text">Discount</span>
                                <input type="number" name="discount" id="discount" class="form-control" placeholder="Discount">
                                <span class="input-group-text">%</span>
                            </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" name="status" id="status">
                            <option>1</option>
                 
                            </select>
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
          	<form action="update-product" method="post">
	            <div class="modal-header">
	              <h5 class="modal-title" id="titl">Update Product</h5>
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	              </button>
	            </div>
	            <div class="modal-body"  style="width: 900px;">
	             		       <div class="row">
                    <div class="col-8">
                        <div class="form-group mt-3">
                            <label for="productId">Product ID:</label>
                            <input type="text" class="form-control" name="productId" id="productIdUpdate" aria-describedby="productHId" placeholder="Product ID" readonly>
                        
                          </div>
                          <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" name="name" id="nameUpdate" aria-describedby="nameHid" placeholder="Name">
                         
                          </div>
                          
                           <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" name="description" id="descriptionUpdate" aria-describedby="descriptionHid" placeholder="Description">
                            
                          </div>
                          
                          
                          <div class="form-group">
                              <label for="quantity">Quantity</label>
                              <input type="number" class="form-control" name="quantity" id="quantityUpdate" aria-describedby="quantityHid" placeholder="Quantity">
                           
                          </div>
                          <div class="input-group form-group">
                              <span class="input-group-text">Unit Price</span>
                              <input type="number" name="unitPrice" id="unitpriceUpdate" class="form-control" placeholder="Unit Price">
                              <span class="input-group-text">$</span>
                          </div>
                          
                             
                          <div class="form-group">
                            <label for="categoryId">Category</label>
                            <select class="form-control" name="categoryId" id="categoryIdUpdate">
                            	<c:forEach var="cate" items="${listCategory}">
                            		<option value="${cate.categoryId }">${cate.categoryId }</option>
                            	</c:forEach>
                            </select>
                            
                          </div>
                          
                          
                    </div>
                     <div class="col-4">
                            <img src="images/image_1000px.png"   class="img-fluid " alt="">
                            <div class="form-group">
                            <label for="">Image File</label>
                            <input type="file" class="form-control-file" name="productImage" id="productImageUpdate" placeholder="product Image" aria-describedby="productImageHid">
                 
                       </div>
                            
                        <!--          <div class="form-group">
                                <label for="entereddate">Entered Date</label>
                                <input type="date" class="form-control" name="enteredDate" id="entereddateUpdate" aria-describedby="enteredDateHid" placeholder="Entered Date">
                                
                              </div>
                              
                 -->                 
                           

                            <div class="input-group form-group">
                                <span class="input-group-text">Discount</span>
                                <input type="number" name="discount" id="discountUpdate" class="form-control" placeholder="Discount">
                                <span class="input-group-text">%</span>
                            </div>
                            
                           <div class="form-group">
                            <label for="status">Status</label>
                            <input type="text" class="form-control" name="status" id="statusUpdate" aria-describedby="statusHid" placeholder="Status">
                 
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
        
        $(".edit-product-btn").click(function () {
            $("#UpdateModal").modal();
            $("#productIdUpdate").val($(this).attr("data-id"));
            $("#nameUpdate").val($(this).attr("data-name"));
            $("#quantityUpdate").val($(this).attr("data-quantity"));
            $("#unitpriceUpdate").val($(this).attr("data-unitprice"));
            $("#descriptionUpdate").val($(this).attr("data-description"));
            $("#discountUpdate").val($(this).attr("data-discount"));
            $("#statusUpdate").val($(this).attr("data-status"));
            $("#entereddateUpdate").val(new Date($(this).attr("data-enteredDate")));
            $("#productImageUpdate").val($(this).attr("data-image"));
            
          });
      });
    </script>
  </body>
</html>
