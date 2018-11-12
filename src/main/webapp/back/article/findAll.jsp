<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#articledg").datagrid({
            url:"${pageContext.request.contextPath}/artcile/findAll",
            fit:true,
            fitColumns:true,//让列自适应整个容器
            remoteSort:false,//关闭服务器端排序,
            resizeHandle:'both',//调整列拖动的位置
            toolbar:'#articletb',//顶部工具栏的DataGrid面板
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
                {title:"id",field:"id",width:100},
                {title:"文章标题",field:"title",width:100},
                {title:"文章插图",field:"imgPath",width:100},
                {title:"文章内容",field:"content",width:100},
                {title:"创建时间",field:"publishDate",width:100},
                {title:"所属上师",field:"guru_name",width:100,formatter:function (value,row,index) {
                        return row.guru.name;
                    }},
                {title:"上师头像",field:"guru_headPic",width:100,formatter:function (value,row,index) {
                        return row.guru.headPic;
                    }},
                {title:"操作",field:"options",width:100,formatter:function (value,row,index) {
                        return "<a href='javascript:;' class='delarticle' onclick=\"delarticle('"+row.id+"')\">删除</a>"
                    }}
            ]],
            //在数据加载成功之后触发
            onLoadSuccess:function (data) {
                $(".delarticle").linkbutton({iconCls:'icon-remove',plain:true});
            },
            //图片
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.title + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        })
    });

    /*删除*/
    function delarticle(id) {
        $.post("${pageContext.request.contextPath}/artcile/removeArticle",{"id":id},function (result) {
            if (result.success) {
                //修改提示信息
                $.messager.show({title:'提示',msg:"文章删除成功!!!"});
            }else {
                //修改提示信息
                $.messager.show({title:'提示',msg:"文章删除失败!!!"});
            }
            //刷新表格
            $("#articledg").datagrid('reload')
        })
    }

    function addarticle() {
        $("#adddgarticle").dialog({
            buttons:[
                {
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function () {
                        $("#addguruform").form('submit',{
                            url:"${pageContext.request.contextPath}/artcile/addArticle",
                            success:function (result) {
                                //响应的json格式的字符串,使用需要转换为js对象
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"文章添加成功!!!"});
                                }else{
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"文章添加失败!!!"});
                                }
                                $("#adddgarticle").dialog('close');
                                $("#articledg").datagrid('reload')
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        $("#adddgarticle").dialog('close')
                    }
                }
            ]
        })
    }
</script>


<table id="articledg"></table>
<%--顶部工具栏--%>
<div id="articletb">
    &nbsp;&nbsp;<a href="#" onclick="addarticle();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>&nbsp;&nbsp;
</div>

<%--添加对话框--%>
<div id="adddgarticle" data-options="href:'${pageContext.request.contextPath}/back/article/add.jsp',title:'添加文章',width:500,height:300"></div>
