<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Board List</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Board List Page
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" >
                    <thead>
                        <tr>
                            <th>#번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="board" items="${list}">
	                        <tr class="odd gradeX">
	                            <td>${board.bno }</td>
	                            <td>${board.title }</td>
	                            <td>${board.writer }</td>
	                            <td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"  /></td>
	                            <td><fmt:formatDate value="${board.updateDate }" pattern="yyyy-MM-dd"  /></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
 		let result = ${result};
 		alert(result);
 	});
 </script>
 
 
 
 
      
<%@include file="../includes/footer.jsp" %>      