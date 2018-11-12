<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#coursedg").datagrid({
            url:'${pageContext.request.contextPath}/course/findAll',
            fit:true,
            fitColumns:true,//让列自适应整个容器
            remoteSort:false,//关闭服务器端排序,
            resizeHandle:'both',//调整列拖动的位置
            toolbar:'#coursetb',//顶部工具栏的DataGrid面板
            striped:true,//是否显示斑马线效果
            loadMsg:'正在加载,请稍候~~~',//在从远程站点加载数据的时候显示提示消息
            pagination:true,//如果为true，则在DataGrid控件底部显示分页工具栏
            pageNumber:1,//初始页码
            pageSize:4,//每页显示的记录数
            pageList:[1,2,3,4,5,6,7,8,9],//在设置分页属性的时候 初始化页面大小选择列表
            ctrlSelect:true,
            rownumbers:true,//显示数据条数
            columns:[[
                {title:"cks",field:"cks",checkbox:true},
                {title:'Id',field:"id",width:100},
                {title:'功课名称',field:"title",width:100},
                {title:'功课标记',field:"flag",width:100},
                {title:'创建时间',field:"createTime",width:100},
                {title:'操作',field:"options",width:100,formatter:function (value,row,index) {
                        //row行对象
                        return "<a href='javascript:;' class='delcourse' onclick=\"delcourse('"+row.id+"')\">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "<a href='javascript:;' class='upcourse' onclick=\"upcourse('"+row.id+"')\">修改</a>"
                    }}
            ]],
            //在数据加载成功之后触发
            onLoadSuccess:function (data) {
                $(".delcourse").linkbutton({iconCls:'icon-remove',plain:true});
                $(".upcourse").linkbutton({iconCls:'icon-edit',plain:true});
            }
        })
    });

    /*删除*/
    function delcourse(id) {
        //发送ajax请求删除
        $.post("${pageContext.request.contextPath}/course/removeCourse",{"id":id},function (result) {
            if (result.success) {
                //修改提示信息
                $.messager.show({title:'提示',msg:"功课删除成功!!!"});
            }else {
                //修改提示信息
                $.messager.show({title:'提示',msg:"功课删除失败!!!"});
            }
            //刷新表格
            $("#coursedg").datagrid('reload')
        })
    }

    /*修改*/
    function upcourse(id) {
        $("#motifycourse").dialog({
            href:'${pageContext.request.contextPath}/back/course/motify.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function () {
                        $("#motifycourseform").form('submit',{
                            url:"${pageContext.request.contextPath}/course/motifyCourse",
                            success:function (result) {
                                //响应的json格式的字符串,使用需要转换为js对象
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"功课修改成功!!!"});
                                }else{
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"功课修改失败!!!"});
                                }
                                //关闭对话框
                                $("#motifycourse").dialog('close');
                                //刷新表格
                                $("#coursedg").datagrid('reload')
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        //关闭对话框
                        $("#motifycourse").dialog('close')
                    }
                }
            ]
        })
    }

    /*添加*/
    function addcourse() {
        $("#adddgcourse").dialog({
            buttons:[
                {
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function () {
                        $("#addcourseform").form('submit',{
                            url:"${pageContext.request.contextPath}/course/addCourse",
                            success:function (result) {
                                //响应的json格式的字符串,使用需要转换为js对象
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"功课添加成功!!!"});
                                }else{
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"功课添加失败!!!"});
                                }
                                //关闭对话框
                                $("#adddgcourse").dialog('close');
                                //刷新表格
                                $("#coursedg").datagrid('reload')
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'保存',
                    handler:function () {
                        //关闭对话框
                        $("#adddgcourse").dialog('close')
                    }
                }
            ]
        })
    }
</script>

<table id="coursedg"></table>

<%--顶部工具栏--%>
<div id="coursetb">
    &nbsp;&nbsp;<a href="#" onclick="addcourse();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>&nbsp;&nbsp;
</div>

<%--添加对话框--%>
<div id="adddgcourse" data-options="href:'${pageContext.request.contextPath}/back/course/add.jsp',title:'添加功课',width:500,height:300"></div>

<%--修改对话框--%>
<div id="motifycourse" data-options="title:'修改功课',width:500,height:370"></div>