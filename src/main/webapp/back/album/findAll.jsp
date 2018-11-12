<%@page isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
        $("#albumdg").treegrid({
            url:"${pageContext.request.contextPath}/album/findAll",
            fit:true,
            fitColumns:true,//让列自适应整个容器
            remoteSort:false,//关闭服务器端排序,
            resizeHandle:'both',//调整列拖动的位置
            toolbar:'#albumtb',//顶部工具栏的DataGrid面板
            striped:true,//是否显示斑马线效果
            loadMsg:'正在加载,请稍候~~~',//在从远程站点加载数据的时候显示提示消息
            pagination:true,//如果为true，则在DataGrid控件底部显示分页工具栏
            pageNumber:1,//初始页码
            pageSize:4,//每页显示的记录数
            pageList:[1,2,3,4,5,6,7,8,9],//在设置分页属性的时候 初始化页面大小选择列表
            ctrlSelect:true,
            animate:true,//展开时显示动画效果
            idField:'id',
            treeField:'title',
            rootVisible:false,
            columns:[[
                {title:'名称',field:'title',width:100},
                {title:'大小',field:'size',width:100},
                {title:'时长',field:'duration',width:100},
                {title:'下载路径',field:'downPath',width:100},
                {title:'上传时间',field:'uploadTime',width:100}
            ]]
        });
    });

    /*专辑详情*/
    function detalbum(){
        var select = $("#albumdg").treegrid('getSelected');
        if(select==null){
            $.messager.show({title: '消息', msg: '请选择一行！！！'});
        }
        if(select!=null && select.children!=null){
            $("#dgdetalbum").dialog({
                href:"${pageContext.request.contextPath}/back/album/albumdet.jsp?id="+select.id
            });
        }
        if(select!=null && select.children==null) {
            $.messager.show({title: '消息', msg: '请选择专辑！！！'});
        }
    }

    /*添加章节*/
    function addchapter() {
        var row = $("#albumdg").treegrid('getSelected');
        if (row==null){
            $.messager.show({title: '消息', msg: '请选择一行进行添加！！！'});
        }
        if(row!=null&&row.children!=null){
            $("#adddgchapter").dialog({
                href:'${pageContext.request.contextPath}/back/album/addchapter.jsp?id='+row.id,
                buttons:[
                    {
                        iconCls:'icon-save',
                        text:'保存',
                        handler:function () {
                            $("#addchapterform").form('submit',{
                                url:"${pageContext.request.contextPath}/chapter/addChapter",
                                success:function (result) {
                                    //响应的json格式的字符串,使用需要转换为js对象
                                    var parseJSON = $.parseJSON(result);
                                    if(parseJSON.success){
                                        //修改提示信息
                                        $.messager.show({title:'提示',msg:"章节添加成功!!!"});
                                    }else{
                                        //修改提示信息
                                        $.messager.show({title:'提示',msg:"章节添加失败!!!"});
                                    }
                                    //关闭对话框
                                    $("#adddgchapter").dialog('close');
                                    //刷新表格
                                    $("#albumdg").treegrid('reload')
                                }
                            })
                        }
                    },
                    {
                        iconCls:'icon-cancel',
                        text:'关闭',
                        handler:function () {
                            //关闭对话框
                            $("#adddgchapter").dialog('close')
                        }
                    }
                ]
            })
        }
        if(row!=null && row.children==null) {
            $.messager.show({title: '消息', msg: '请选择专辑进行添加！！！'});
        }

    }

    /*添加专辑*/
    function addalbum() {
        $("#adddgalbum").dialog({
            buttons:[
                {
                    iconCls:'icon-save',
                    text:'保存',
                    handler:function () {
                        $("#addalbumform").form('submit',{
                            url:"${pageContext.request.contextPath}/album/addAlbum",
                            success:function (result) {
                                //响应的json格式的字符串,使用需要转换为js对象
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"专辑添加成功!!!"});
                                }else{
                                    //修改提示信息
                                    $.messager.show({title:'提示',msg:"专辑添加失败!!!"});
                                }
                                //关闭对话框
                                $("#adddgalbum").dialog('close');
                                //刷新表格
                                $("#albumdg").treegrid('reload')
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        //关闭对话框
                        $("#adddgalbum").dialog('close')
                    }
                }
            ]
        })
    }
    
    /*下载音频*/
    function addmusic() {
        var row = $("#albumdg").treegrid('getSelected');
        if(row==null){
            $.messager.show({title:'提示',msg:"请选择一个章节!!!"});
        }
        if(row!=null && row.size!=null ){
            location.href="${pageContext.request.contextPath}/chapter/downMusic?fileName="+row.downPath;
        }
        if(row!=null && row.size==null){
            $.messager.show({title:'提示',msg:"请选择一个章节!!!"});
        }
    }
</script>
<table id="albumdg"></table>

<%--顶部工具栏--%>
<div id="albumtb">
    &nbsp;&nbsp;<a href="#" onclick="detalbum();" class="easyui-linkbutton" data-options="iconCls:'icon-tip',plain:true">专辑详情</a> &nbsp;&nbsp;
    &nbsp;&nbsp;<a href="#" onclick="addalbum();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加专辑</a> &nbsp;&nbsp;
    &nbsp;&nbsp;<a href="#" onclick="addchapter();" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加章节</a> &nbsp;&nbsp;
    &nbsp;&nbsp;<a href="#" onclick="addmusic();" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true">下载音频</a> &nbsp;&nbsp;
</div>

<%--添加对话框--%>
<div id="dgdetalbum" data-options="title:'专辑详情',width:500,height:400"></div>
<div id="adddgalbum" data-options="href:'${pageContext.request.contextPath}/back/album/addalbum.jsp',title:'添加专辑',width:500,height:350"></div>
<div id="adddgchapter" data-options="title:'添加章节',width:500,height:300"></div>
<%--<div id="dgchaptermusic" data-options="title:'下载此章节',width:300,height:200"></div>--%>

