<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
    <form id="addcourseform" method="post" class="easyui-form">
        <div style="margin-top: 70px">
            功课名称：<input type="text" class="easyui-textbox" name="title">
        </div>
        <div style="margin-top: 15px">
            功课标记：
            <select name="flag" class="easyui-combobox" data-options="width:175">
                <option value="必修">必修</option>
            </select>
        </div>
        <div style="margin-top: 15px">
            创建时间：<input type="text" class="easyui-datebox" name="createTime">
        </div>
    </form>
</div>