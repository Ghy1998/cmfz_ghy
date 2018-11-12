<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $.extend($.fn.validatebox.defaults.rules,{
            confirmPwd:{
                validator:function(value,param) {
                    return $(param[0]).val()==value;
                },
                message:"两次密码不一致"
            }
        });
    })
</script>
<div style="text-align: center">
    <form id="updateform" method="post" class="easyui-form">
        <div style="margin-top: 60px">
            <input type="hidden" value="${sessionScope.admin.id}" name="id" readonly="'readonly">
        </div>
        <div style="margin-top: 50px">
            用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input type="text" value="${sessionScope.admin.username}" name="username" class="easyui-textbox" readonly="'readonly">
        </div>
        <div style="margin-top: 20px">
            密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="text" id="pwd" class="easyui-validatebox" data-options="required:true">
        </div>
        <div style="margin-top: 20px">
            确认密码：<input type="text" class="easyui-validatebox" name="password" data-options="required:true,validType:'confirmPwd[\'#pwd\']'">
        </div>
    </form>
</div>