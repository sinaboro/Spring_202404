<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">상세 페이지</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>

<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Board Get Page
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">

           		<div class="form-group">
            		<label>Bno</label>
            		<input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
           		</div>

           		<div class="form-group">
            		<label>Title</label>
            		<input class="form-control" name="title" value="${board.title}" readonly="readonly">
           		</div>
           		
           		<div class="form-group">
            		<label>Text Area</label>
            		<textarea rows="3" class="form-control" name="content" readonly="readonly">
            		${board.content}</textarea>
           		</div>
           		
           		<div class="form-group">
            		<label>Writer</label>
            		<input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
           		</div>
           		
           		<button data-oper='modify' class="btn btn-primary" >Modify</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           	
           		<button data-oper='list' class="btn btn-warning">List</button>
           		
           		<form id="operForm" action="/board/modify" method="get">
           			<input type="hidden" id="bno" name="bno" value='${board.bno}'>
           			<input type="hidden" name="pageNum" value='${cri.pageNum}'>
           			<input type="hidden" name="amount" value='${cri.amount}'>
           			<input type="hidden" name="type" value=${cri.type}>
					<input type="hidden" name="keyword" value=${cri.keyword}>
           			
           		</form>
            		
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<!-- /.row 댓글 처리 -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> Reply
                <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Relpy</button>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
            	<ul class="chat">
            		<li class="left clearfix" data-rno='12'>
            			<div>
            				<div class="header">
            					<strong class="primary-font">user00</strong>
            					<small class="pull-right text-muted">2024-04-22 14:12:00</small>
            				</div>
            			</div>
            			<p>Good Job!</p>
            		</li>
            	</ul>		
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<!--  댓글 Modal -->
<div class="container">
  <h2>Modal Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

 <!-- The Modal -->
 <div class="modal" id="myModal">
   <div class="modal-dialog">
     <div class="modal-content">
     
       <!-- Modal Header -->
       <div class="modal-header">
         <h4 class="modal-title">REPLY MODAL</h4>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body">
         <div class="form-group">
         	<label>Reply</label>
         	<input class="form-control" name="reply" value="New Reply.......">
         </div>

         <div class="form-group">
         	<label>Replyer</label>
         	<input class="form-control" name="replyer" value="New Replyer.......">
         </div>

         <div class="form-group">
         	<label>Reply Date</label>
         	<input class="form-control" name="replyDate" value="">
         </div>
       </div>
       
       <!-- Modal footer -->
        <div class="modal-footer">
          <button id="modalRegisterBtn"  type="button" class="btn btn-primary" >Register</button>
          <button id="modalModBtn"  type="button" class="btn btn-warning" >Modify</button>
          <button id="modalRemoveBtn"  type="button" class="btn btn-danger" >Remove</button>
          <button id="modalCloseBtn"  type="button" class="btn btn-default" data-dismiss='modal' >Close</button>
        </div>
      </div>
    </div>
  </div>
</div>   <!-- End The Modal -->



<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function(){
	
	console.log("JS TEST................")
	
	var bnoValue = "${board.bno}";
	var replyUL = $(".chat")
	
	console.log("bnoValue................" + bnoValue)
	
	showList(1);
	
	function showList(page){
		replyService.getList({bno:bnoValue, page:page}, function(list){
			console.log("getList...............")
			console.log(list)
			
			var str=""
			
			if(list == null || list.length==0){
				replyUL.html("")
				return ;
			}
			
			for(var i=0; i<list.length; i++){
				str += "<li class='left clearfix' data-rno='"+ list[i].rno  +"'>"
    			str += "<div>"
    			str += "<div class='header'>"
    			str += "<strong class='primary-font'>"+ list[i].replyer+"</strong>"		
    			str += "<small class='pull-right text-muted'> "+ replyService.displayTime(list[i].replyDate) +" </small>"		
    			str += "</div>"	
    			str += "</div>"
    			str += "<p>"+list[i].reply +"</p></li>"
			}
			replyUL.html(str)
			
		}) //End showList
		
		
		var modal = $(".modal")
		var modalInputReply = modal.find("input[name='reply']")
		var modalInputReplyer = modal.find("input[name='replyer']")
		var modalInputReplyDate = modal.find("input[name='replyDate']")
		
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalCloseBtn = $("#modalCloseBtn")
		
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("")
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide()
			modalRegisterBtn.show()
			
			$(".modal").modal("show");
		});
		
		
		//댓글 등록
		modalRegisterBtn.on("click", function(e){
			var reply = {
				reply : modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno : bnoValue
			}
			
			replyService.add(reply, function(result){
				alert(result)
				modal.find("input").val("")
				modal.modal("hide")
			})
			
		})
}
	
	
	
	//댓글 등록
/* 	replyService.add(		
		
		{reply:"JS Test2", replyer: "tester2", bno:bnoValue},
		
		function(result){
			console.log("complete")
			alert("RESULT : " + result)
		}
	); */
	
	/* replyService.getList(
		{bno:bnoValue, page:1},
		
		function(list){
			//for(var i=0, len=list.length||0; i<len; i++){
			for(var i=0; i<list.length; i++){	
				console.log(list[i])
			}
				
		}
		
	) */
	
	/* var rno = 208
	replyService.remove(rno, function(msg){
			  alert(msg)			
		}
	);
	 */
	
	/* var data = {
				rno:207,
				reply: "Modified Reply..."
	}
	replyService.update(
		data, 
		function(result){
			alert(result);
		}			
	) */
	
	/* replyService.get( 207, function(data){
								console.log(data)
							}
	); */
	
	
	
});
</script>



<script>
 	$(document).ready(function(){
 		
 		let operForm = $("#operForm");
 		
 		$("button[data-oper='modify']").on("click",function(e){
 			operForm.submit();
 		})

 		$("button[data-oper='list']").on("click",function(e){
 			operForm.find("#bno").remove();
 			operForm.attr("action", "/board/list")
 			operForm.submit();
 		})
 		
 	});
 </script>


<%@include file="../includes/footer.jsp" %>      