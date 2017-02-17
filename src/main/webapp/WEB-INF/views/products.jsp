<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="resources/style.css" type="text/css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <style>
  .panel {
    border: 1px solid #880000;
    border-radius:0;
    transition: box-shadow 0.5s;
}

.panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
}

.panel-footer .btn:hover {
    border: 1px solid #f4511e;
    background-color: #fff !important;
    color: #f4511e;
}

.panel-heading {
    color: #fff !important;
    background-color: #880000 !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
}

.panel-footer {
    background-color: #fff !important;
}

.panel-footer h3 {
    font-size: 32px;
    display:inline; !important
}

.panel-footer h1{
	font-size: 40px;
}
.panel-footer h4 {
    color: #aaa;
    font-size: 14px;
}
.panel-footer .btn {
    margin: 15px 0;
    background-color: #880000;
    color: #fff;
}
.jumbotron {
		background-color: #880000;
		color: #ffffff;
		height : 150px;
}

</style>
</head>
<body onload = "load();">
<script type="text/javascript">
    data = "";
	count = 0;			
    total = 0;
    //var name=[];
    /* window.onbeforeunload = WindowClose; 

	function WindowClose() { 
	    alert("fechou");
	} */

	$(window).unload( function () {

	    $.ajax({
	       url: 'delete_all',
	       type: 'POST',
	       success: function(response){
	         alert("Your Current Cart were Deleted!");
	       	},
	     	async: false
	     }); 
	});
	
	load = function(){ 	    
        $.ajax({
            url:'list',
            type:'POST',
            datatype: "text",
            //contentType: "application/json; charset=utf-8",
            success: function(response){
                    //data = response.data;
                    for(i=0; i<response.data.length; i++){					 
 						$("#list").append("<div class=\"col-sm-4\"><div class=\"panel panel-default text-center\"><input type=\"hidden\" id=\"product_id_"+i+"\" value=\""+response.data[i].id+"\"><div class=\"panel-heading\"><h1 id=\"name_p_"+i+"\">"+response.data[i].name+"</h1></div><div class=\"panel-body\"><img src=\""+response.data[i].image+"\"><style>img {max-width: 50%;max-height: 50%;}</style></div><div class=\"panel-footer\"><h3>R$ </h3><h3 type=\"number\" id=\"price_p_"+i+"\">"+response.data[i].price+"</h3><br><label><span>Quantity </span><input  size=\"2\" maxlength=\"2\" id=\"product_qty_"+i+"\" placeholder=\"0\" /></label><br><button class=\"btn btn-lg\" id=buttonAdd_"+i+" onclick=\"addProduct("+i+");\">Add</button></div></div></div>");
	                }
                    //qtp = response.data.length;
                    /* var json = $JSON.parse(data);
                    for (var i=0;i<json.length;++i)
                    {
                        $("#table1").append("<tr class='tr'><td>"+json[i].user_login+"</td></tr>");
                    } */          
            }              
        });      
    }
    
	 addProduct = function(n){
		 
	    count++;
        $.ajax({
            url:'saveOrUpdate',
            type:'POST',
            //contentType: "application/json; charset=utf-8",
            data:{id:count,product_id:$("#product_id_"+n).val(),quantity:$("#product_qty_"+n).val(),amount:+$("#price_p_"+n).text()*$("#product_qty_"+n).val()},
            success: function(response){
                    alert(response.message);
                    update();
            }              
        });        
	}

 	 update = function(){ 	    
	   		
	        $.ajax({
	            url:'listCommerce',
	            type:'POST',
	            datatype: "text",
	            //contentType: "application/json; charset=utf-8",
	            success: function(response){
                    //data = response.data;
                    $('.tr').remove();
                    if(total)
                        total=0;
         			
                    for(i=0; i<response.data.length; i++){                  
        	            	$("#table").append("<tr class='tr'><td>"+response.data[i].product_id+"</td><td>"+response.data[i].quantity+"</td><td>"+response.data[i].amount+"</td><td> <a href=\"#table\" onclick=\"delete_("+response.data[i].id+");\"> Remove </a> </td></tr>");
            	        	total+=response.data[i].amount;
                	    }
	            }              
	        });
	        document.getElementById("amount_id").innerHTML = "Total = R$ "+total.toFixed(2);       
	    }
 	
	 delete_ = function(id){     
         $.ajax({
            url:'delete',
            type:'POST',
            data:{id:id},
            //contentType: "application/json; charset=utf-8",
            success: function(response){
                    alert(response.message);
                    update();
            }              
        });
    }
    </script>
    
   <nav class="navbar navbar-default">
	  <div class="container-fluid">
	     <div class="navbar-header">
	       <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	      </button>
	    </div> 
	   <form id="signin" class="navbar-form navbar-right" role="form">
	        <input type="hidden" id="user_id">
	        <div class="input-group">                   
		        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		       	<input id="user_login" type="text" class="form-control" name="user_login" required="required"  placeholder="Login">                                        
	        </div>
	
	        <div class="input-group">
	            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		        <input id="password" type="password" class="form-control" name="password" required="required"  placeholder="Password">                                        
            </div>
	
            <button type="submit" class="btn btn-danger" onclick="submit();" form="signin">Login</button>
      </form>
	     
	    </div>
	</nav>
		
	<div class="container-fluid">
	   <div class="jumbotron text-center">
  			<h1>McFadyen Shopping Cart</h1>
		</div>
	  <div class="row" id="list">
	  </div> 
	</div>
	<div class="container">
  <h1>Your products</h1>
  <button type="submit" class="btn btn-danger pull-right" onclick="update();">Checkout</button>
  <table class="table table-striped" id="table">
    <thead>
      <tr>
        <th>Product</th>
        <th>Quantity</th>
        <th>Amount</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table> 
</div>
 <li class="divider"></li>
 <h2 style="text-align:right" id="amount_id"></h2>
	
</body>
</html>