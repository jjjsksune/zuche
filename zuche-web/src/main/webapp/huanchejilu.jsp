<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/5
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>还车记录页面</title>
</head>
<body>
<table id="huanchejilu"></table>
<script>
    //显示租车记录信息  表格
    $(function () {
        //初始化表格
        $('#huanchejilu').bootstrapTable({
            url: 'huanchejilu.action',
            //method: 'post',
            toolbar: '#toolbar',
            editable: true,//开启编辑模式
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            clickToSelect: true,                //是否启用点击选中行
            search: true,                      //是否显示表格搜索
            //searchable: true,
            showColumns: false,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            //cardView: true,                    //是否显示详细视图
            //detailView: false,                   //是否显示详细视图
            singleSelect: true,                      //单选
            //******前端分页设置****//
            pagination: true,
            sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,
            pageSize: 5,
            pageList: "[5, 10, 25, 50, 100]",
            paginationHAlign: "left",
            paginationDetailHAlign: "right",
            //******前端分页设置****//
            //得到查询的参数
            queryParams: function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    page: (params.offset / params.limit) + 1  //页码

                };
                return temp;
            },
            columns: [{
                field: 'id',
                title: '编号'
            }, {
                field: 'ddid',
                title: '订单id'
            },{
                field: 'carid',
                title: '车辆id'
            }, {
                field: 'gukeid',
                title: '顾客id'
            },{
                field: 'state',
                title: '状态'
            }, {
                field: 'shenpiren',
                title: '审批人'
            }, {
                field: 'caozuo',
                title: '操作'
            }, {
                field: 'caozuotime',
                title: '操作时间'
            }],
            onClickRow: function (row, $element) {  ////角色表格  绑定点击事件
                rid = row.id;   //获取点击的角色id

                $("#tree2").reloadTree();  //重新加载菜单数据控件

            }
        });


    });
</script>
</body>
</html>
