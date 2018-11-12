<%@ page isELIgnored="false" language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/easyui/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.etree.js"></script>
<script type="text/javascript">
    /*强制登陆*/
    var admin="${sessionScope.admin}";
    console.log(admin);
    if(admin==""){
        location.href='${pageContext.request.contextPath}/back/admin/login.jsp';
    }

	$(function () {
        //在页面加载完成之后显示菜单数据
        $.post("${pageContext.request.contextPath}/menu/queryAllMenus",function (menu) {
            console.log(menu);
            //遍历一级菜单
            $.each(menu,function (index,menu) {
                var content="<div>";
                $.each(menu.children,function (index,child) {
                    content+="<a onclick=\"addtabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" class='easyui-linkbutton' style='width: 150px;margin-top: 20px;margin-left: 30px;border: 2px solid #26b3f7' data-options=\"plain:true,iconCls:'"+child.iconCls+"'\">"+child.title+"</a>";
                });
                content+="</div>";
                //通过分类菜单的add方法追加菜单
                $("#aa").accordion('add',{
                    title:menu.title,
                    iconCls:menu.iconCls,
                    content:content,
                    selected:0
                })
            });
        })
    })

	/*追加选项卡*/
    function addtabs(title,iconCls,href) {
        //先使用exists方法判断面板是否存在
        var exists = $("#tt").tabs('exists',title);
        if(!exists){
            //追加选项卡
            $("#tt").tabs('add',{
                title:title,
                iconCls:iconCls,
                closable:true,//显示关闭按钮
                fit:true,//自适应父容器
                href:'${pageContext.request.contextPath}/'+href //从远程读取数据
            })
        }else {
            //选中一个选项卡,参数可以是标题或下标
            $("#tt").tabs('select',title);
        }
    }

	/*修改密码*/
    function updateAdmin(username) {
        console.log(username);
        $("#updatedialog").dialog({
            href:'${pageContext.request.contextPath}/back/admin/update.jsp',
            buttons:[{
                iconCls:'icon-save',
                text:'保存',
                handler:function () {
                        $("#updateform").form('submit',{
                            url:'${pageContext.request.contextPath}/admin/motifyAdmin',
                            success:function (result) {//成功之后的回掉函数,json格式
                                location.href="${pageContext.request.contextPath}"+result;
                                //关闭对话框
                                $("#updatedialog").dialog('close')
                            }
                        })
                    }
                },
                {
                    iconCls:'icon-cancel',
                    text:'关闭',
                    handler:function () {
                        //关闭对话框
                        $("#updatedialog").dialog('close')
                    }
                }
            ]
        })
    }

</script>

</head>
<body class="easyui-layout">
    <%--页头--%>
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.admin.username} &nbsp;<a href="#" onclick="updateAdmin();" id="updateAdmin" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/logout" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>
    <%--页脚--%>
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
    <%--左侧--%>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>
    <%--中心--%>
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">   
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',closable:true"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>

    <%--修改密码对话框--%>
    <div id="updatedialog" data-options="title:'修改密码',width:500,height:300"></div>
</body> 
</html>