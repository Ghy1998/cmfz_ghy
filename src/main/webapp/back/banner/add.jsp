<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="addbannerform" method="post" class="easyui-form" enctype="multipart/form-data">
        <div style="margin-top: 35px">
            标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 10px">
            描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：<input type="text" name="descr" class="easyui-textbox">
        </div>
        <div style="margin-top: 10px">
            状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：
            <select name="status" class="easyui-combobox" data-options="width:175">
                <option value="y">y</option>
                <option value="n">n</option>
            </select>
        </div>
        <div style="margin-top: 10px">
            创建时间：<input type="text" name="createDate" class="easyui-datebox">
        </div>
        <div style="margin-top: 10px">
            请选择图片：<input name="img" class="easyui-filebox" data-options="buttonText:'点我选择'">
        </div>
    </form>
</div>