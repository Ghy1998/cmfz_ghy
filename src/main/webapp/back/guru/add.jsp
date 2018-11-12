<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="addguruform" method="post" class="easyui-form" enctype="multipart/form-data">
        <div style="margin-top: 50px">
            上师姓名：<input type="text" name="name" class="easyui-textbox">
        </div>
        <div style="margin-top: 10px">
            上师头像：<input name="img" class="easyui-filebox" data-options="buttonText:'点我选择'">
        </div>
        <div style="margin-top: 10px">
            上师性别：
            <select name="sex" class="easyui-combobox" data-options="width:175">
                <option value="man">man</option>
                <option value="woman">woman</option>
            </select>
        </div>
        <div style="margin-top: 10px">
            上师状态：
            <select name="status" class="easyui-combobox" data-options="width:175">
                <option value="y">y</option>
                <option value="n">n</option>
            </select>
        </div>
    </form>
</div>