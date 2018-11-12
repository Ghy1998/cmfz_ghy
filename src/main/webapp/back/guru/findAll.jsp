<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#gurudg").datagrid({
            url:'${pageContext.request.contextPath}/guru/findAll',
            fit:true,
            fitColumns:true,//让列自适应整个容器
            remoteSort:false,//关闭服务器端排序,
            resizeHandle:'both',//调整列拖动的位置
            toolbar:'#gurutb',//顶部工具栏的DataGrid面板
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
                {title:'上师名称',field:"name",width:100},
                {title:'上师头像',field:"headPic",width:100},
                {title:'上师性别',field:"sex",width:100},
                {title:'状态',field:"status",width:100},
                {title:'操作',field:"options",width:100,formatter:function (value,row,index) {
                        //row行对象
                        return "<a href='javascript:;' class='delguru' onclick=\"delguru('"+row.id+"')\">删除</a>"
                    }}
            ]],
            //在数据加载成功之后触发
            onLoadSuccess:function (data) {
                $(".delguru").linkbutton({iconCls:'icon-remove',plain:true});
            },
            //图片
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.name + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        })
    });

    /*删除*/
    function delguru(id) {
        //获取id，发送ajax请求删除
        $.post("${pageContext.request.contextPath}/guru/removeGuru",{"id":id},function (result) {//响应之后的回掉函数
            if (result.success) {
                //修改提示信息
                $.messager.show({title:'提示',msg:"上师删除成功!!!"});
            }else {
                //修改提示信息
                $.messager.show({title:'提示',msg:"上师删除失败!!!"});
            }
            //刷新表格
            $("#gurudg").datagrid('reload')
        })
    }

    /*添加*/
    function addguru() {
        $("#adddgguru").dialog({
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function () {
                    //保存
                    $("#addguruform").form('submit',{
                        url:'${pageContext.request.contextPath}/guru/addGuru',
                        success:function (result) {
                            //响应的json格式的字符串,使用需要转换为js对象
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                //修改提示信息
                                $.messager.show({title:'提示',msg:"上师添加成功!!!"});
                            }else{
                                //修改提示信息
                                $.messager.show({title:'提示',msg:"上师添加失败!!!"});
                            }
                            //关闭对话框
                            $("#adddgguru").dialog('close');
                            //刷新表格
                            $("#gurudg").datagrid('reload')
                        }
                    })
                }
            },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        //关闭对话框
                        $("#adddgguru").dialog('close')
                    }
                }
            ]
        })
    }
</script>


<table id="gurudg" ></table>
<%--顶部工具栏--%>
<div id="gurutb">
    &nbsp;&nbsp;<a href="#" onclick="addguru();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
</div>

<%--添加对话框--%>
<div id="adddgguru" data-options="href:'${pageContext.request.contextPath}/back/guru/add.jsp',title:'添加上师',width:500,height:300"></div>