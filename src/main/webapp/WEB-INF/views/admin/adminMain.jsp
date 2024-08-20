<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>admin Page</title>
	<c:import url="../template/header.jsp"></c:import>
</head>
<body id="reportsPage" class="font">
	<c:import url="../template/topbar.jsp"></c:import>
	
	<div class="container">
        <div class="row">
            <div class="col">
				<div class="container mt-5">
					<div class="row tm-content-row">
						<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12 tm-block-col">
							<div class="tm-bg-primary-dark tm-block tm-block-products">
								<div class="tm-product-table-container">
									<h1 class="text-white mt-5 mb-5">유저 리스트</h1>
									<table
										class="table table-hover tm-table-small tm-product-table">
										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">유저 아이디</th>
												<th scope="col">권한 등급</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="dto">
												<tr class="userLink" onclick="location.href='/admin/userDetail?user_id=${dto.user_id}'">
													<td><i class="far fa-user"></i></td>
													<td>${dto.user_id }</td>
													<c:if test="${dto.user_auth eq 1}">
														<td>일반 회원</td>
													</c:if>
													<c:if test="${dto.user_auth eq 0}">
														<td class="text-danger">관리자</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- table container -->
							</div>
						</div>
					</div>
				</div>
			</div>         	
    		</div>
		</div>
	<c:import url="../template/footer.jsp"></c:import>
	<c:import url="../template/boot-footer.jsp"></c:import>
	<script src="/resources/js/users/adminMain.js"></script>
</body>
</html>
