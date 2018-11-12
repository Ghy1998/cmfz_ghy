<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#albumdetform").form('load','${pageContext.request.contextPath}/album/findOne?id=${param.id}');
        $("#albumdetform").form({
            onLoadSuccess(data){
                console.log(data);
                $("#coverImg").attr("src","${pageContext.request.contextPath}"+data.coverImg);
            }
        })

    })
</script>
<div style="text-align: center">
    <form method="post" id="albumdetform" class="easyui-form">
        <div style="margin-top: 30px">
            <input type="hidden" name="id">
        </div>
        <div style="margin-top: 10px">
            专辑名称：<input type="text" class="easyui-textbox" name="title">
        </div>
        <div style="margin-top: 10px">
            发布时间：<input type="text" class="easyui-textbox" name="publishDate">
        </div>
        <div style="margin-top: 10px">
            专辑集数：<input type="text" class="easyui-textbox" name="count">
        </div>
        <div style="margin-top: 10px;margin-left: 60px">
            <img id="coverImg" src=""  style="width: 120px;height: 80px">
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