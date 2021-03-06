<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DCCaffe Web Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <!-- amcharts css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- Start datatable css -->
    <!-- link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css"-->
    <!-- style css -->
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
		<jsp:include page="inc/inc_side.jsp" />
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <jsp:include page="inc/inc_header.jsp" />
            
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">사용자 수정/삭제</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="/">사용자 관리</a></li>
                                <li><span>사용자 수정/삭제</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="assets/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">${user_name}<i class="fa fa-angle-down"></i></h4>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
               
                <!-- visitor graph area start -->
                <div class="card mt-5">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-5">
                            <h4 class="header-title mb-0">사용자 수정/삭제</h4>
                            <!-- select class="custome-select border-0 pr-3">
                                <option selected="">Last 7 Days</option>
                                <option value="0">Last 7 Days</option>
                            </select-->
                        </div>
                        <!--  div id="visitor_graph"></div-->
	                    <!-- data table start -->
	                    <div class="col-12 mt-5">
	                        <div class="card">
	                            <div class="card-body">

	                                
	                                <!-- 테이블 샘플 -->
                                <div class="single-table">
                                    <div class="table-responsive">
                                        <table class="table text-center">
											<thead class="bg-light text-capitalize">
	                                            <tr>
	                                                <th scope="col">RFID</th>
	                                                <th scope="col">회사명</th>
	                                                <th scope="col">이름</th>
	                                                <th scope="col">이메일</th>
	                                                <th scrop="col">재직여부</th>
	                                                <th scope="col">변경</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
												<c:forEach var="user_list" items="${user_list}" varStatus="status">
												  <tr>
													<th scope="row">${user_list.rfid}</th>
	                                                <td>${user_list.company}</td>
	                                                <td>${user_list.name}</td>
	                                                <td>${user_list.email}</td>
  	                                                <td>
  	                                                <c:choose>



													    <c:when test="${user_list.leave eq 'false'}">
													        <span class="badge badge-success">재직중</span>
													    </c:when>
	
													    <c:otherwise>
													        <span class="badge badge-danger">퇴사</span>
													    </c:otherwise>
													</c:choose>

  	                                                
  	                                                </td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3"  data-toggle="modal" data-target="#modal_user_info_modify" onclick="open_user_modify_modal('${user_list.uindex}', '${user_list.rfid}', '${user_list.name}', '${user_list.company}', '${user_list.email}', '${user_list.leave}', '${user_list.regdate}', '${user_list.updatedate}');">수정</button>                         
	                                                	<button type="button" class="btn btn-flat btn-danger btn-xs mb-3"  data-toggle="modal" data-target="#modal_user_info_delete" onclick="open_user_delete_modal('${user_list.uindex}', '${user_list.name}');">삭제</button>
	                                                	
	                                                </td>
	                                              </tr>
												</c:forEach>
												
												
												
												<c:choose>
												    <c:when test="${fn:length(user_list) eq 0}">
												    	<tr>
												    		<td colspan="6">마지막 페이지 입니다.</td>
												        </tr>
												    </c:when>
												    <c:otherwise>
												    </c:otherwise>
												</c:choose>
	                                            <!-- tr>
	                                                <th scope="row">1231222445</th>
	                                                <td>디지캡</td>
	                                                <td>이태호z</td>
	                                                <td>thlee@digicaps.com</td>
	                                                <td>
	                                                	<button type="button" class="btn btn-flat btn-warning btn-xs mb-3"  data-toggle="modal" data-target="#modal_user_info_modify" onclick="open_user_modify_modal(1, '12345', '이태호', 'Covision', 'thlee@digicaps.com', 'false', '2018-11-30', '2018-12-30');">수정</button>
						                                
                                            	
														<button type="button" class="btn btn-flat btn-danger btn-xs mb-3"  data-toggle="modal" data-target="#modal_user_info_delete" onclick="open_user_delete_modal(1, '이태호');">삭제</button>	                                                	
	                                                	
	                                                </td>
	                                            </tr-->




	                                        </tbody>
                                        </table>
                                    </div>
                                </div>
	                                <br/>
	                                
	                                <!-- 테이블 샘플 끝 -->
	                                <div style="float:right; margin-right:120px;">
		                                <nav aria-label="Page navigation example">
		                                    <ul class="pagination">
		                                      	<c:choose>
												    <c:when test="${page < 11}">
			                                	    </c:when>
	
												    <c:otherwise>
				                                        <li class="page-item">
				                                            <a class="page-link" href="/user_manage?page=${pageStartPointCalcul - 1}" aria-label="Previous">
				                                                <span aria-hidden="true">&laquo;</span>
				                                                <span class="sr-only">Previous</span>
				                                            </a>
				                                        </li>
		                                            </c:otherwise>
												</c:choose>				

		                                        <c:forEach var="page_counter" begin="${pageStartPointCalcul + 0}" end="${pageEndPointCalcul + 0}" step="1">
  	                                                <c:choose>



													    <c:when test="${page_counter eq page}">
				                                	        <li class="page-item active"><a class="page-link" href="/user_manage?page=${page_counter}">${page_counter}</a></li>
													    </c:when>
	
													    <c:otherwise>
				                                	        <li class="page-item"><a class="page-link" href="/user_manage?page=${page_counter}">${page_counter}</a></li>
													    </c:otherwise>
													</c:choose>					
												</c:forEach>

		                                                                                
		                                        <li class="page-item">
		                                            <a class="page-link" href="/user_manage?page=${pageEndPointCalcul + 1}" aria-label="Next">
		                                                <span aria-hidden="true">&raquo;</span>
		                                                <span class="sr-only">Next</span>
		                                            </a>
		                                        </li>
		                                    </ul>
		                                </nav>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- data table end -->
                    </div>
                </div>
                <!-- visitor graph area end -->

            </div>
            
            
            

						                <!-- 회원정보 수정 모달 시작 -->
		                                <div class="modal fade" id="modal_user_info_modify">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">사용자 정보 수정</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                

							                                                <div class="form-group">
														                         <label for="example-text-input">Index</label>
														                         <input class="form-control" type="text" id="modify_user_index" disabled>
														                    </div>
														                    
							                                                <div class="form-group">
														                         <label for="example-text-input">RF Card ID</label>
														                         <input class="form-control" type="text" id="modify_user_rfid" disabled>
														                    </div>														                    
														                    
														                    <div class="form-group">
														                         <label for="example-text-input">이름</label>
														                         <input class="form-control" type="text" id="modify_user_name">
														                    </div>
														                    
							                                                <div class="form-group">
									                                        	<label class="col-form-label">회사명</label>
										                                        <select class="custom-select" id="modify_user_company_name">
										                                            <option selected="selected" value="DigiCAP">DigiCAP</option>
										                                            <option value="Covision">Covision</option>
										                                        </select>
										                                    </div>														                    
														                    
							                                                <div class="form-group">
														                         <label for="example-text-input">이메일</label>
														                         <input class="form-control" type="text" id="modify_user_email">
														                    </div>
														                    
							                                                <div class="form-group">
									                                        	<label class="col-form-label">재직여부</label>
										                                        <select class="custom-select" id="modify_user_leave">
										                                            <option selected="selected" value="false">재직중</option>
										                                            <option value="true">퇴사</option>
										                                        </select>
										                                    </div>														                     														                    
														                    

							                                                <div class="form-group">
														                         <label for="example-text-input">등록일</label>
														                         <input class="form-control" type="text" id="modify_user_regdate" disabled>
														                    </div>
														                    		


							                                                <div class="form-group">
														                         <label for="example-text-input">최종 업데이트</label>
														                         <input class="form-control" type="text" id="modify_user_updatedate" disabled>
														                    </div>
														
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="confirm_modify();">수정</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 회원정보 수정 모달 끝 -->
						                                
						                                
						                <!-- 회원정보 삭제 모달 시작 -->
		                                <div class="modal fade" id="modal_user_info_delete">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">사용자 삭제</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                
														<h5 id="delete_user_name" style="font-size:12px;">...님을 정말로 삭제하시겠습니까?</h5>
														<input class="form-control" type="hidden" id="delete_user_index" value="" />
		                                            </div>
		                                            <div class="modal-footer">
			                                            <button type="button" class="btn btn-primary" onclick="confirm_delete();">확인</button>
		                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">취소</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 회원정보 삭제 모달 끝 -->						                                
						                                
						                <!-- 완료 모달 -->
		                                <div class="modal fade" id="ok_modal">
		                                    <div class="modal-dialog modal-dialog-centered" role="document">
		                                        <div class="modal-content">
		                                            <div id="modal-header" class="modal-header">
		                                                <h5 class="modal-title">알림</h5>
		                                                <!-- button type="button" class="close" data-dismiss="modal" onclick="rfcard_register_modal_close();"><span>&times;</span></button-->
		                                            </div>
		                                            <div class="modal-body">
		                                                <br/>
														<h5 id="">완료되었습니다.</h5>
		                                            </div>
		                                            <div class="modal-footer">
		                                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="">확인</button>
		                                                
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <!-- 회원정보 삭제 모달 끝 -->				
		                                
		                                						                                
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
     	<jsp:include page="inc/inc_footer.jsp" />
        
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    
    <!-- offset area end -->
    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>
    <!-- Start datatable js -->
    <!--  script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script-->    
    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    <script>
    function open_user_modify_modal(u_index, u_rfid, u_name, u_company_name, u_email, u_leave, u_regdate, u_updatedate){
    	$("#modify_user_index").val(u_index);
    	$("#modify_user_rfid").val(u_rfid);
    	$("#modify_user_name").val(u_name);
    	//$("#modify_user_company_name").val(u_company_name);
    	$("#modify_user_email").val(u_email);
    	$("#modify_user_leave").val(u_leave);
    	$("#modify_user_regdate").val(u_regdate);
    	$("#modify_user_updatedate").val(u_updatedate);
    	if(u_company_name == 'DigiCAP' || u_company_name == 'digicap')
	    	$("#modify_user_company_name").val("DigiCAP").prop("selected", true);
    	else
	    	$("#modify_user_company_name").val("Covision").prop("selected", true);

    }
    
    function open_user_delete_modal(u_index, u_name){
    	$("#delete_user_name").html(u_name + "님을 정말로 삭제하시겠습니까?");
    	$("#delete_user_index").val(u_index);
    }
    
    function confirm_modify(){
        $.ajax({
            url: "/user_modify",
            type: "post",
            data: {
            	"index" : $("#modify_user_index").val(),
            	"email"  : $("#modify_user_email").val(),
            	"rfid" : $("#modify_user_rfid").val(),
            	"name" : $("#modify_user_name").val(),
            	"company" : $("#modify_user_company_name").val(),
            	"leave" : $("#modify_user_leave").val()
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){

            },
            success: function(data){
                if(data.result == 'success') {
  					alert("성공적으로 변경되었습니다.");
  					location.href="/user_manage";
                
                }else{
  					alert("서버 응답이 올바르지 않습니다.");	                	
                }
            }
        });
    	
    	
    	$('#modal_user_info_modify').modal('hide');
    	//$('#ok_modal').modal('show');
    }
    
    function confirm_delete(){
    	//;
    	
        $.ajax({
            url: "/user_delete",
            type: "post",
            data: {
            	"index" : $("#delete_user_index").val()
            },
            dataType: "json",
            error: function(xhr, ajaxOptions, thrownError){

            },
            success: function(data){
                if(data.result == 'success') {
  					alert("성공적으로 삭제되었습니다.");
  					location.href="/user_manage";
                
                }else{
  					alert("서버 응답이 올바르지 않습니다.");	                	
                }
            }
        });
        
        
    	$('#modal_user_info_delete').modal('hide');
    }
    
    //$('#modal_rfcard_regist').modal('hide');

    
    </script>
</body>

</html>
