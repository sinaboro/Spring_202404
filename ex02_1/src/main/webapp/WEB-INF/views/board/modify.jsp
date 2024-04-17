<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">수정/삭제 페이지</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Board Modify Page
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
				<form role="form" action="/board/modify" method="post">
	           		<div class="form-group">
	            		<label>Bno</label>
	            		<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
	           		</div>
	
	           		<div class="form-group">
	            		<label>Title</label>
	            		<input class="form-control" name="title" value="${board.title}" >
	           		</div>
	           		
	           		<div class="form-group">
	            		<label>Text Area</label>
	            		<textarea rows="3" class="form-control" name="content" >
	            		${board.content}</textarea>
	           		</div>
	           		
	           		<div class="form-group">
	            		<label>Writer</label>
	            		<input class="form-control" name="writer" value="${board.writer}" >
	           		</div>
	           		
	           		<button type="submit" data-oper='modify' class="btn btn-primary">Modify</button>
	           		<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
	           		<button type="submit" data-oper='list' class="btn btn-info">List</button>
            	</form>	
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script>
 	$(document).ready(function(){
 		
 		let formObj = $("form");
 		
 		$('button').on("click", function(e){
 			e.preventDefault();  //<form role="form" action="/board/modify" method="post"> 이동 중지
 			
 			let operation = $(this).data("oper");
 			
 			if(operation === 'remove'){
 				formObj.attr("action", "/board/remove"); 				
 			}else if(operation === 'list'){
 				self.location = "/board/list";
 				return;
 				//formObj.attr("action", "/board/list");
 				//formObj.attr("method", "get");
 			}
 			formObj.submit();
 		});
 		
 	});
 </script>


      
<%@include file="../includes/footer.jsp" %>      