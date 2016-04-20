

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%--
 Created by www.magicalcoder.com
 如果你改变了此类 read 请将此行删除
 799374340@qq.com
--%><!DOCTYPE html>
<html>
<head>
    <%@include file="../../common/head.jsp"%>
    <title>AdminLTE | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <%@include file="../include/head.jsp"%>
</head>
<body class="skin-blue">
    <header class="header">
        <%@include file="../include/top.jsp"%>
    </header>
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <aside class="left-side sidebar-offcanvas">
            <%@include file="../include/left.jsp"%>
        </aside>
        <aside class="right-side">
            <section class="content-header">
                <h1>
                    学生详情
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Tables</a></li>
                    <li class="active">Data tables</li>
                </ol>
            </section>
            <section class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <form class="form-horizontal" role="form" id="form" action="admin/student/save" method="post">
                                <div class="box-header">
                                    <h3 class="box-title">
                                            编辑
                                    </h3>
                                    <h3 class="box-title alert-danger">${exceptionMsg}</h3>
                                </div>
                                        <input type="hidden" name="nameOldValue" value="${student.name}">

                                <div class="box-body">
                                    <div class="form-group ">
                                        <label class="col-sm-1 control-label">
                                            所属班级
                                        </label>
                                         <div class="col-sm-3">
                                            <input type="hidden" id="classId"
                                                   name="classId"
                                                   value="${student.classId}">
                                            <input type="text" class="form-control" id="classIdSearch"
                                                  name="classIdSearch"  placeholder="请输入关键词查询班级"
                                            <c:if test="${ classes!=null }">
                                                         value="${classes.className}"
                                            </c:if>
                                                   >
                                        </div>
                                        <label class="col-sm-2 control-label" >
                                                <c:if test="${student.classId!=null}">
                                                    <a target="_blank" onclick="openUrl(this,'admin/classes/detail_param?id=${student.classId}')"> 查看详情</a>
                                                </c:if>
                                            <span class="validateMsg"></span>
                                        </label>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-sm-1 control-label">
                                            性别
                                        </label>
                                         <div class="col-sm-9">
                                             <select class="form-control" id="sex" name="sex" title="性别"  >
                                                         <option
                                                 <c:if test="${ student.sex == 0 }">selected</c:if>
                                                 value="0" >类型一</option>
                                                         <option
                                                 <c:if test="${ student.sex == 1 }">selected</c:if>
                                                 value="1" >类型二</option>
                                             </select>
                                        </div>
                                        <label class="col-sm-2 control-label" >
                                            <span class="validateMsg"></span>
                                        </label>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-sm-1 control-label">
                                            学生名称
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control " id="name"
                                                   name="name" title="学生名称"  placeholder="请输入学生名称"
                                                             value="${student.name}">
                                        </div>
                                        <label class="col-sm-2 control-label" >
                                            <span class="validateMsg"></span>
                                        </label>
                                    </div>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <button type="button" onclick="submitForm('#form')" class="btn btn-primary">保存</button>
                                    <button type="button" onclick="history.go(-1);"  class="btn btn-primary">返回</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </aside>
    </div>
    <%@include file="../include/tail.jsp"%>

    <script charset="utf-8" src="assets/admin/app/base.js"></script>
    <script type="text/javascript" >
        $(function(){
            //base.js
            validateForm("#form")
                    foreignSearch('classes','classId','','id');

        })
    </script>
</body>
</html>
