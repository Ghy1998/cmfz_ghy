<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#motifybannerform").form('load','${pageContext.request.contextPath}/banner/findOne?id=${param.id}');
        $("#motifybannerform").form({
            onLoadSuccess(data){
                $("#imgPath").attr("src","${pageContext.request.contextPath}/"+data.imgPath);
            }
        })
    })
</script>
<div style="text-align: center">
    <form id="motifybannerform" method="post" class="easyui-form" enctype="multipart/form-data">

        <input type="hidden"  name="id" readonly="'readonly">

        <div style="margin-top: 30px">
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
        <div style="margin-top: 10px;margin-left: 60px">
            <img src="" id="imgPath" style="width: 120px;height: 80px">
        </div>
        <div style="margin-top: 10px">
            请选择图片：<input name="img" class="easyui-filebox" data-options="buttonText:'点我选择'">
        </div>
    </form>
</div>