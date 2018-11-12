<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<div style="text-align: center">
<form method="post" id="addalbumform" enctype="multipart/form-data" class="easyui-form">
    <div style="margin-top: 15px">
        专辑名称：<input type="text" class="easyui-textbox" name="title">
    </div>
    <div style="margin-top: 10px">
        发布日期：<input type="text" class="easyui-datebox" name="publishDate">
    </div>
    <div style="margin-top: 10px">
        专辑集数：<input type="text" class="easyui-textbox" name="count">
    </div>
    <div style="margin-top: 10px">
        专辑封面：<input class="easyui-filebox" name="img" data-options="buttonText:'点我选择'">
    </div>
    <div style="margin-top: 10px">
        专辑评分：<input type="text" class="easyui-textbox" name="star">
    </div>
    <div style="margin-top: 10px">
        专辑作者：<input type="text" class="easyui-textbox" name="author">
    </div>
    <div style="margin-top: 10px">
        专辑播音：<input type="text" class="easyui-textbox" name="broadCast">
    </div>
    <div style="margin-top: 10px">
        专辑简介：<input type="text" class="easyui-textbox" name="brief">
    </div>
</form>
</div>