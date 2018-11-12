<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#guruname").combobox({
            url:'${pageContext.request.contextPath}/guru/findAllGuru',
            valueField:'id',
            textField:'name',
            formatter:function (row) {
                return row.name;
            }
        })
    })
</script>
<div style="text-align: center">
    <form method="post" id="addguruform" class="easyui-form" enctype="multipart/form-data">
        <div style="margin-top: 40px">
            文章标题：<input type="text" name="title" class="easyui-textbox">
        </div>
        <div style="margin-top: 10px">
            文章封面：<input type="text" class="easyui-filebox" name="img">
        </div>
        <div style="margin-top: 10px">
            文章内容：<input type="text" class="easyui-textbox" name="content">
        </div>
        <div style="margin-top: 10px">
            上传日期：<input type="text" class="easyui-datebox" name="publishDate">
        </div>
        <div style="margin-top: 10px">
            所属上师：<select name="guru_id" id="guruname" class="easyui-combobox" data-options="width:175">
                    </select>
        </div>
    </form>
</div>