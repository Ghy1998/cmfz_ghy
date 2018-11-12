<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#bannerdg").datagrid({
            url:'${pageContext.request.contextPath}/banner/findAll',
            fit:true,
            fitColumns:true,//让列自适应整个容器
            remoteSort:false,//关闭服务器端排序,
            resizeHandle:'both',//调整列拖动的位置
            toolbar:'#bannertb',//顶部工具栏的DataGrid面板
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
                {title:'标题',field:"title",width:100},
                {title:'图片路径',field:"imgPath",width:100},
                {title:'描述',field:"descr",width:100},
                {title:'状态',field:"status",width:100},
                {title:'创建时间',field:"createDate",width:100},
                {title:'操作',field:"options",width:100,formatter:function (value,row,index) {
                        //row行对象
                        return "<a href='javascript:;' class='delbanner' onclick=\"delbanner('"+row.id+"')\">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
                            "<a href='javascript:;' class='upbanner' onclick=\"upbanner('"+row.id+"')\">修改</a>"
                }}
            ]],
            //在数据加载成功之后触发
            onLoadSuccess:function (data) {
                $(".delbanner").linkbutton({iconCls:'icon-remove',plain:true});
                $(".upbanner").linkbutton({iconCls:'icon-edit',plain:true});
            },
            //图片
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.title + '</p>' +
                    '<p>Status: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        })
    });

    /*修改*/
    function upbanner(id) {
        $("#motifybanner").dialog({
            href:'${pageContext.request.contextPath}/back/banner/motify.jsp?id='+id,
            buttons:[
                {
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function () {
                        $("#motifybannerform").form('submit',{
                            url:'${pageContext.request.contextPath}/banner/motifyBanner',
                            success:function (result) {//提交之后的回掉函数,json格式的字符串
                                var parseJSON = $.parseJSON(result);
                                if (parseJSON.success){
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"轮播图信息修改成功!!!"});
                                }
                                else {
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"轮播图信息修改失败!!!"});
                                }
                                //刷新表格
                                $("#bannerdg").datagrid('reload');
                                //关闭对话框
                                $("#motifybanner").dialog('close');
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        //关闭对话框
                        $("#motifybanner").dialog('close')
                    }
                }
            ]
        })
    }

    /*删除一行*/
    function delbanner(id) {
        //获取id，发送ajax请求删除
        $.post("${pageContext.request.contextPath}/banner/delBanner",{"id":id},function (result) {//响应之后的回掉函数
            if (result.success) {
                //修改提示信息
                $.messager.show({title:'提示',msg:"轮播图删除成功!!!"});
            }else {
                //修改提示信息
                $.messager.show({title:'提示',msg:"轮播图删除失败!!!"});
            }
            //刷新表格
            $("#bannerdg").datagrid('reload')
        })
    }

    /*批量删除*/
    function delbanners() {
        var rows = $("#bannerdg").datagrid('getSelections');//返回所有被选中的行
        if(rows.length<=0){
            $.messager.show({title:'提示',msg:"至少选中一行!!!"});
        }else {
            var ids=[];
            for (var i=0;i<rows.length;i++){
                ids.push(rows[i].id);
            }
            console.log(ids);
            //发送ajax请求传递数组  注意: $.get $.post 只能传递简单数据(key=value) 不能数组类型的数据
            //如果想要传递数组类型的数据只能使用  $.ajax 并且还要设置其中的一个属性
            $.ajax({
                url:"${pageContext.request.contextPath}/banner/delBanners",
                type:"POST",
                traditional:true,//传递数据类型的数据时必须设置这个属性为true
                data:{id:ids},//数据
                success:function (data) {
                    if (data.success){
                        //修改提示信息
                        $.messager.show({title:'提示',msg:"轮播图删除成功!!!"});
                    } else {
                        //修改提示信息
                        $.messager.show({title:'提示',msg:"轮播图删除失败!!!"});
                    }
                    //刷新表格
                    $("#bannerdg").datagrid('reload')
                },
                error:function () {
                    //消息提示
                    $.messager.show({title:'提示',msg:"删除失败!!!"});
                    //刷新页面
                    $("#bannerdg").datagrid('reload');
                }
            })
        }
    }

    /*添加*/
    function addbanner() {
        $("#adddgbanner").dialog({
            buttons:[{
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function () {
                        //保存
                       $("#addbannerform").form('submit',{
                           url:'${pageContext.request.contextPath}/banner/addBanner',
                           success:function (result) {
                               //响应的json格式的字符串,使用需要转换为js对象
                               var parseJSON = $.parseJSON(result);
                               if(parseJSON.success){
                                   //修改提示信息
                                   $.messager.show({title:'提示',msg:"轮播图添加成功!!!"});
                               }else{
                                   //修改提示信息
                                   $.messager.show({title:'提示',msg:"轮播图添加失败!!!"});
                               }
                               //关闭对话框
                               $("#adddgbanner").dialog('close');
                               //刷新表格
                               $("#bannerdg").datagrid('reload')
                           }
                       })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        //关闭对话框
                        $("#adddgbanner").dialog('close')
                    }
                }
            ]
        })
    }
</script>

<table id="bannerdg" ></table>

<%--顶部工具栏--%>
<div id="bannertb">
    &nbsp;&nbsp;<a href="#" onclick="addbanner();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>&nbsp;&nbsp;
    <a href="#" onclick="delbanners();" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">批量删除</a>
</div>

<%--添加对话框--%>
<div id="adddgbanner" data-options="href:'${pageContext.request.contextPath}/back/banner/add.jsp',title:'添加轮播图',width:500,height:300"></div>

<%--修改对话框--%>
<div id="motifybanner" data-options="title:'修改轮播图',width:500,height:370"></div>
