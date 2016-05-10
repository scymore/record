[#-- 当前位置--]
[#macro breadcrumbs separator="&gt;"]
    [#compress]
        [@ec_location;list]
        <div id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i><a href="${path}/management/index">首页</a>
                    <span class="divider"><i class="icon-angle-right"></i></span>
                </li>

                [#if list?? && (list?size>0)]
                    [#list list as p]
                        <li>${p.name!}</li>
                        [#if p_index != (list?size-1)]
                            <span class="divider"><i class="icon-angle-right"></i></span>
                        [/#if]
                    [/#list]
                [/#if]
            </ul>
        </div>
        [/@ec_location]
    [/#compress]
[/#macro]

[#-- 当前位置--]
[#macro location separator="&gt;"]
    [#compress]
        [@ec_location;list]
            [#if list?? && (list?size>0)]
            [#-- onclick="openTab('${p.name}','${path}${p.uri!}','${p.icon!}');" --]
            首页&nbsp;${separator}&nbsp;
                [#list list as p]
                <a href="javascript:void(0);">${p.name!}</a>
                    [#if p_index != (list?size-1)]
                    &nbsp;${separator}&nbsp;
                    [/#if]
                [/#list]
            [/#if]
        [/@ec_location]
    [/#compress]
[/#macro]

[#--分页宏命令--]
[#macro ec_page_pannel pagesize="10" pageNum=1 start=1 end=1 pageCount=1 totalCounts=1 url="#" params=""]
    [#if params ==""]
        [#assign p = "" /]
    [#else]
        [#assign p = "&${params?replace(' ','')}" /]
    [/#if]
    [#if (totalCounts?number > 0)]
    <script type="text/javascript">
        <!--
        function selectPage(e) {
            var url = "${url}?pageNum=1${p}";
            url = url + "&pagesize=" + $(e).val();
            refreshData(url);
        }
        //-->
    </script>
    <div class="EC-page-pannel">
        <div class="EC-page-info">
            <span>当前第<em>${pageNum}</em>页</span>
            <span>共<em>${pageCount}</em>页,<em>${totalCounts}</em>条记录</span>
                    <span>每页显示<em>
                        <select onchange="selectPage(this);">
                            [#if pagesize == "10"]
                                <option value="10" selected="selected">10</option>
                            [#else]
                                <option value="10">10</option>
                            [/#if]

                            [#if pagesize == "20"]
                                <option value="20" selected="selected">20</option>
                            [#else]
                                <option value="20">20</option>
                            [/#if]

                            [#if pagesize == "30"]
                                <option value="30" selected="selected">30</option>
                            [#else]>
                                <option value="30">30</option>
                            [/#if]

                            [#if pagesize == "60"]
                                <option value="60" selected="selected">60</option>
                            [#else]>
                                <option value="60">60</option>
                            [/#if]

                            [#if pagesize == "${totalCounts}"]
                                <option value="${totalCounts}" selected="selected">全部</option>
                            [#else]
                                <option value="${totalCounts}">全部</option>
                            [/#if]
                        </select>
                    </em>条记录</span>
        </div>
        <ul class="EC-page-list">
            [#if (pageNum?number > 1)]
                <li><a href="javascript:void(0);"
                       onclick="refreshData('${url}?pagesize=${pagesize}&pageNum=1${p}');"><<</i></a></li>
                <li><a href="javascript:void(0);"
                       onclick="refreshData('${url}?pagesize=${pagesize}&pageNum=${pageNum?number - 1}${p}');"><</i></a>
                </li>
            [/#if]
            [#list (start?number)..(end?number) as num]
                [#if (pageNum?number == num)]
                    <li><a href="javascript:void(0);" class="EC-page-on">${num}</a></li>
                [#else]
                    <li><a href="javascript:void(0);"
                           onclick="refreshData('${url}?pagesize=${pagesize}&pageNum=${num}${p}');">${num}</a></li>
                [/#if]
            [/#list]
            [#if (pageNum?number < pageCount?number)]
                <li><a href="javascript:void(0);"
                       onclick="refreshData('${url}?pagesize=${pagesize}&pageNum=${pageNum?number + 1}${p}');">></a>
                </li>
                <li><a href="javascript:void(0);"
                       onclick="refreshData('${url}?pagesize=${pagesize}&pageNum=${pageCount}${p}');">>></a></li>
            [/#if]
        </ul>
    </div>
    [/#if]
[/#macro]

[#-- 编辑宏命令 --]
[#macro ec_editable type='js']
    [#switch type]
        [#case 'js']
            [#nested]
            [#break]

        [#case 'css']
            [#nested]
            [#break]

        [#case 'txt']
            [#nested]
            [#break]

        [#case 'html']
            [#nested]
            [#break]

        [#case 'shtml']
            [#nested]
            [#break]

        [#case 'xml']
            [#nested]
            [#break]

        [#case 'jsp']
            [#nested]
            [#break]

        [#case 'properties']
            [#nested]
            [#break]
    [/#switch]
[/#macro]

[#-- 判断图片宏命令 --]
[#macro ec_pic type='jpg']
    [#switch type]
        [#case 'jpg']
            [#nested]
            [#break]

        [#case 'jpeg']
            [#nested]
            [#break]

        [#case 'gif']
            [#nested]
            [#break]

        [#case 'png']
            [#nested]
            [#break]

        [#case 'bmp']
            [#nested]
            [#break]
    [/#switch]
[/#macro]

[#-- 根据文件类型显示小图标宏命令 --]
[#macro ec_icon type='unknown']
    [#switch type]
        [#case 'asp']
        asp
            [#break]

        [#case 'aspx']
        aspx
            [#break]

        [#case 'bmp']
        bmp
            [#break]

        [#case 'css']
        css
            [#break]

        [#case 'db']
        db
            [#break]

        [#case 'doc']
        doc
            [#break]

        [#case 'docx']
        doc
            [#break]

        [#case 'exe']
        exe
            [#break]

        [#case 'flv']
        flv
            [#break]

        [#case 'folder']
        folder
            [#break]

        [#case 'gif']
        gif
            [#break]

        [#case 'html']
        html
            [#break]

        [#case 'jpg']
        jpg
            [#break]

        [#case 'jpeg']
        jpeg
            [#break]

        [#case 'js']
        js
            [#break]

        [#case 'jsp']
        jsp
            [#break]

        [#case 'mov']
        mov
            [#break]

        [#case 'mp3']
        mp3
            [#break]

        [#case 'mp4']
        mp4
            [#break]

        [#case 'none']
        none
            [#break]

        [#case 'pdf']
        pdf
            [#break]

        [#case 'php']
        php
            [#break]

        [#case 'png']
        png
            [#break]

        [#case 'rar']
        rar
            [#break]

        [#case 'rm']
        rm
            [#break]

        [#case 'shtml']
        shtml
            [#break]

        [#case 'sql']
        sql
            [#break]

        [#case 'swf']
        swf
            [#break]

        [#case 'txt']
        txt
            [#break]

        [#case 'unknow']
        unknow
            [#break]

        [#case 'wmp']
        wmp
            [#break]

        [#case 'wmv']
        wmv
            [#break]

        [#case 'xls']
        xls
            [#break]

        [#case 'xlsx']
        xls
            [#break]

        [#case 'zip']
        zip
            [#break]

        [#default]
        unknown
    [/#switch]
[/#macro]

[#-- 截取文字长度 --]
[#macro text_max length=50 value="" suffix="......"]
    [#if value?length <= length ]
    ${value}
    [#else]
    ${value?substring(0,length)}${suffix}
    [/#if]
[/#macro]

[#-- 计算文件大小,若不足1K按B计算，若大于1024KB按MB算，若大于1024MB按G算，若大于1024G按T算 --]
[#macro filesize value=""]
    [#if value?? ]
        [#assign num = value?number /]

    [#-- 若不足1KB(1024)则显示B --]
        [#if num < (1024)]${num} B
        [#-- 若小于1MB(1024*1024)则显示KB --]
        [#elseif num < (1024*1024)]
            [#assign val = num/(1024) /]${val} KB
        [#-- 若大于1MB(1024*1024)小于1G(1024*1024*1024)则显示MB --]
        [#elseif (num > (1024*1024)) && (num < (1024*1024*1024))]
            [#assign val = num/(1024*1024) /]${val} MB
        [/#if]
    [/#if]
[/#macro]

[#-- 选择框树形节点 --]
[#macro ec_select_tree nodes="" selectId=-1 attr="" level=0 ]
    [#if nodes?has_content]
        [#if !nodes?is_string]
            [#if nodes?? && (nodes?size > 0)]
                [#list nodes as node]
                    [#assign on='']

                    [#if selectId?has_content]
                        [#if selectId?is_number && selectId != -1]
                            [#if node.id == selectId]
                                [#assign on='selected="selected"']
                            [/#if]
                        [#elseif selectId?is_string]
                            [#if selectId?index_of(",") == -1]
                                [#if node.id?string == selectId]
                                    [#assign on='selected="selected"']
                                [/#if]
                            [#else]
                                [#list selectId?split(",") as sid]
                                    [#if node.id?string == sid]
                                        [#assign on='selected="selected"']
                                    [/#if]
                                [/#list]
                            [/#if]
                        [/#if]
                    [/#if]

                    [#if attr?? && attr != "" && (node[attr])?? ]
                        [#if node[attr]?is_boolean]
                            [#assign dataAttr='data-${attr}="${node[attr]?string}"'/]
                        [#else]
                            [#assign dataAttr='data-${attr}="${node[attr]?string}"'/]
                        [/#if]
                    [/#if]

                <option value="${node.id!}" ${on!} ${dataAttr!}>[#if level>0][#list 0..level as index]
                    &nbsp;&nbsp;[/#list]┣[/#if]${node["name"]!}</option>
                    [@ec_select_tree nodes=node.children! level=level+1 selectId=selectId attr=attr /]
                [/#list]
            [/#if]
        [/#if]
    [/#if]
[/#macro]

[#-- 图标显示 --]
[#macro icon filename=""]
    [#compress]
        [#if filename?? && filename !=""]
        <i class='EC-menu-icon-layout'><img src='${path}/icons/${filename}'></i>
        [#else]
        <i class='EC-menu-icon-layout'></i>
        [/#if]
    [/#compress]
[/#macro]

[#-- 状态文字 --]
[#macro rd_status code=0 success="已发布" failed="未发布"]
    [#compress]
        [#if code == 0]
        <font color='#ff0000'>${failed}</font>
        [#else]
        <font color='#6AD317'>${success}</font>
        [/#if]
    [/#compress]
[/#macro]

[#-- 签收人 --]
[#macro rd_assignee assignee="" complete=0]
    [#compress]
        [#if assignee?? && (""!=assignee)]
        ${assignee}
        [#elseif complete == 0]
        <font color='#ff0000;'>等待签收</font>
        [#else]
        -
        [/#if]
    [/#compress]
[/#macro]

[#-- 问题解决人组织关系 --]
[#macro relationship selectId]
    [@ec_relationship;map]
        [#if map?exists]
            [#list map?keys as key]
                [#if key == 'leadership']
                    [#assign nodes = map[key]]
                    [#if nodes?? && nodes?size>0]
                        [#list nodes as node]
                            [#assign on='']
                            [#if selectId?? && (node.key == selectId)]
                                [#assign on='selected="selected"']
                            [/#if]
                        <option value="${node.key!}" ${on!}>${node.value!}</option>
                        [/#list]
                    [/#if]
                [/#if]
                [#if key == 'colleague']
                    [#assign nodes = map[key]]
                    [#if nodes?? && nodes?size>0]
                        [#list nodes as node]
                            [#assign on='']
                            [#if selectId?? && (node.key == selectId)]
                                [#assign on='selected="selected"']
                            [/#if]
                        <option value="${node.key!}" ${on!}>${node.value!}</option>
                        [/#list]
                    [/#if]
                [/#if]
                [#if key == 'subordinate']
                    [#assign nodes = map[key]]
                    [#if nodes?? && (nodes?size > 0)]
                        [#list nodes as node]
                            [#assign on='']
                            [#if selectId?? && (node.key == selectId)]
                                [#assign on='selected="selected"']
                            [/#if]
                        <option value="${node.key!}" ${on!}>${node.value!}</option>
                        [/#list]
                    [/#if]
                [/#if]
            [/#list]
        [/#if]
    [/@ec_relationship]
[/#macro]

[#-- 表单字段 --]
[#macro form type="TEXT_INPUT"
value=""
placeholder=""
id=""
class=""
name=""
rows=""
cols=""
url="/upload"
deleteUrl="/upload"
imagePath=""
style=""
lang="en"
skin="whyGreen"]
    [#if "TEXT_INPUT" == type]
    <input type="text" placeholder="${placeholder!}" id="${id!}" name="${name!}" value="${value!}" class="${class!}"/>
    [#elseif "RADIO_INPUT" == type]
    <input type="radio" placeholder="${placeholder!}" id="${id!}" name="${name!}" value="${value!}" class="${class!}">
    [#elseif "CHECKBOX_INPUT" == type]
    <input type="checkbox" placeholder="${placeholder!}" id="${id!}" name="${name!}" value="${value!}"
           class="${class!}">
    [#elseif "SELECT" == type]
    <select id="${id!}" name="${name!}" value="${value!}" class="${class!}" data-placeholder="${placeholder!}">
        <option value="">--无--</option>
    </select>
    [#elseif "TEXTAREA" == type]
    <textarea rows="${rows}" cols="${cols}" id="${id!}" name="${name!}" class="${class!}"
              data-placeholder="${placeholder!}" style="width: 100%;">${value!}</textarea>
    [#elseif "DATE_BOX" == type]
        [#if value == ""]
            [#assign dateValue="${.now?string('yyyy-MM-dd HH:mm:ss')}"/]
        [#else]
            [#assign dateValue = value/]
        [/#if]
        [@EC.form_date id="${id!}" name="${name!}" value="${dateValue}" class="${class!'Wdate'}" style="${style!}" lang="${lang!}" skin="${skin!}"/]
    [#elseif "TEXT_EDITOR" == type]
    [#--[@EC.form_kindeditor id="${id!}" name="${name!}" value="${value!}" class="${class!}" width="" height=""/]--]
        [@EC.form_editor id="${id!}" name="${name!}" value="${value!}" class="${class!}" rows="40" cols="80" type="all"/]
    [#elseif "SIMPLE_TEXT_EDITOR" == type]
    [#--[@EC.form_kindeditor id="${id!}" name="${name!}" value="${value!}" class="${class!}" width="" height=""/]--]
        [@EC.form_editor id="${id!}" name="${name!}" value="${value!}" class="${class!}" rows="40" cols="80" type="simple"/]
    [#elseif "UPLOAD_PIC" == type]
        [@EC.form_ckfinder_pic id="${id!}" name="${name!}" value="upload" class="${class!}" relativeUrl="${url!}"
        deleteUrl="${deleteUrl!}" imagePath="${imagePath!}"/]
    [#elseif "UPLOAD_FILE" == type]
        [@EC.form_ckfinder_file id="${id!}" name="${name!}" value="upload" class="${class!}" relativeUrl="${url!}"
        deleteUrl="${deleteUrl!}" imagePath="${imagePath!}"/]
    [/#if]
[/#macro]

[#macro form_ckfinder_pic
id="browse" name="avatar" class="" style="width: 100%;" value="upload"
relativeUrl="/fileupload/uploadavatar" maxFileSize="1mb" resizeWidth="200" resizeHeight="200"
resizeQuality="90" filters='{title: "Image files", extensions: "jpg,gif,png"}'
btnText="选择" dialogTitle="文件上传" dialogBtnText="关闭" deleteUrl="/delete" imagePath=""]
<input type="hidden" name="${name}" id="${id}" value="${imagePath!}"/>
<button type="button" class="btn btn-mini" id="imgUpload_${id}">${btnText}</button>
[#--<button type="button" class="btn btn-mini" data-toggle="modal" data-target="#fileUploadModal_${id}">--]
</button>
<script>
    $("#imgUpload_${id}").on("click", function () {
        CKFinder.popup({
            resourceType: "Images",
            chooseFiles: true,
            selectActionFunction: function (fileUrl, data) {
                $("#${id}").val(fileUrl);
                createImg(fileUrl);
            }
        });
        function createImg(url) {
            var $img = $(' <img src="${path}' + url + '"/>');
            var $title = $('<div class="EC-img-pre-title">' + url + '</div>');
            var $cancelBtn = $('<button type="button" class="btn btn-mini btn-danger">取消</button>');
            $("#imgPreview_${id}").show().empty().append($img).append($title).append($cancelBtn);

            $cancelBtn.on("click", function () {
                $("#imgPreview_${id}").empty().hide();
                $("#${id}").val("");
            });
        }
    });
</script>
[#--表单字段--]
<div id="imgPreview_${id}" class="EC-img-pre">
    [#if imagePath!=""]
        <img src="${path}${imagePath}"/>

        <div class="EC-img-pre-title">${imagePath}</div>
        <script>
            var $cancelBtn = $('<button type="button" class="btn btn-mini btn-danger">取消</button>');
            $cancelBtn.on("click", function () {
                $("#imgPreview_${id}").empty().hide();
                $("#${id}").val("");
            });
            $("#imgPreview_${id}").show().append($cancelBtn);
        </script>
    [/#if]
</div>
[/#macro]

[#-- File Upload --]
[#macro form_ckfinder_file
id="browse" name="avatar" class="" style="width: 100%;" value="upload"
deleteUrl ="/fileupload/uploadavatar"
relativeUrl="/fileupload/uploadavatar" maxFileSize="1mb" resizeWidth="200" resizeHeight="200"
resizeQuality="90" filters='{title: "Image files", extensions: "jpg,gif,png"}'
btnText="选择" dialogTitle="文件上传" dialogBtnText="关闭"  imagePath=""]
[#--<input type="text" size="48" name="url" id="${id}" />--]
<input type="text" name="${name}" id="${id}" value="${imagePath!}"/>
<button type="button" class="btn btn-mini" id="fileUpload_${id}">${btnText}</button>
[#--<button type="button" class="btn btn-mini" data-toggle="modal" data-target="#fileUploadModal_${id}">--]
</button>
<script>
    $("#fileUpload_${id}").on("click", function () {
        CKFinder.popup({
            resourceType: "Files",
            chooseFiles: true,
            selectActionFunction: function (fileUrl, data) {
                $("#${id}").val(fileUrl);
                // createImg(fileUrl);
            }
        });
    });
    function createImg(url) {
        var $img = $(' <img src="${path}' + url + '"/>');
        var $title = $('<div class="EC-img-pre-title">' + url + '</div>');
        var $cancelBtn = $('<button type="button" class="btn btn-mini btn-danger" onclick="cancelChoose()">取消</button>');
        $("#imgPreview__${id}").show().empty().append($img).append($title).append($cancelBtn);
    }
    function cancelChoose() {
        $("#imgPreview__${id}").empty().hide();
        $("#${id}").val("");
    }
</script>
[#--表单字段--]
<div id="filePreview_${id}" class="EC-img-pre">
</div>
[/#macro]

[#-- Upload Images --]
[#--
    id:上传按钮的id属性值默认值为:browse,注意:如果在一个表单中有多个文件上传控件,务必确保该id的唯一性
    name:文件上传到后端时的参数名称 默认值为:"file"
    class:为上传按钮添加css class属性便于对上传按钮进行样式的设计默认值为:空
    style:设置上传区域的css样式(inline 方式)
    value:上传按钮的显示值默认值为:上传
    imagePath:当前系统中保存的图片路径
    relativeUrl:上传文件时的上传路径,默认值为:upload
    maxFileSize:上传文件的最大值,默认为:1mb
    裁剪图片设置
    resizeWidth:裁剪后图片的宽度,默认值:200
    resizeHeight:裁剪后图片的宽度,默认值:200
    resizeQuality:裁剪图片的品质,默认值:90

    filters:设定上传文件的格式限定,默认值:'{title: "Image files", extensions: "jpg,gif,png"}'
    btnText:上传按钮文字描述信息
    dialogTitle:对话框标题
    dialogBtnText:对话框关闭按钮提示信息
    deleteUrl:图片删除的请求路径
--]
[#macro form_upload
id="browse"
relativeUrl="/asdad"
name="avatar"
class=""
style="width: 100%;"
value="upload"
maxFileSize="50mb"
resizeWidth="200"
resizeHeight="200"
resizeQuality="90"
filters='jpg,gif,png'
btnText="选择"
dialogTitle="文件上传"
imagePath=""
click=""
callback=""
]
<div class="CE-Modal hidden" title="${dialogTitle}" id="fileUploadModal_${id}">
    <div id="${id}" style="${style}" class="CE-Uploader">
        <p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
    </div>
</div>
    <script type="text/javascript">
        $(function () {
            //初始化上传插件
            var $uploader = $("#${id}");

            function initUploader($uploader) {
                $uploader.plupload({
                    // General settings
                    runtimes: 'html5,flash,silverlight,html4',
                    url: "${relativeUrl}",

                    // Maximum file size
                    max_file_size: '${maxFileSize}',
                file_data_name: '${name}',

//                                chunk_size: '1mb',
                    multi_selection: false,
                    // Resize images on clientside if we can
                    resize: {
                        quality: ${resizeQuality},
                        crop: true // crop to exact dimensions
                    },

                    // Specify what files to browse for
                    filters: [
                        {
                            title: "Image files",
                            extensions: "${filters!'jpg,gif,png'}"
                        }
                    ],

                    // Rename files by clicking on their titles
                    rename: true,

                    // Sort files
                    sortable: true,

                    // Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
                    dragdrop: true,

                    // Views to activate
                    views: {
                        list: true,
                        thumbs: true, // Show thumbs
                        active: 'thumbs'
                    },

                    // Flash settings
                    flash_swf_url: '${springMacroRequestContext.getContextUrl("/resources/js/plupload/Moxie.swf")}',

                    // Silverlight settings
                    silverlight_xap_url: '${springMacroRequestContext.getContextUrl("/resources/js/plupload/Moxie.xap")}',
                    init: {
                        PostInit: function (uploader) {
                            orginalOptions = $.extend(true, {}, uploader.getOption());
                        },
                        FilesAdded: function (uploader, files) {
                            //if user choose multi files only keep the latest
                            if (uploader.files.length == 2) {
                                $uploader.plupload("removeFile", uploader.files[0]);
                            }
                        },
                        BeforeUpload: function (uploader, files) {
                            uploader.refresh();
                        },
                        FileUploaded: function (uploader, file, response) {
                            response = $.parseJSON(response.response);
                            var path = '${path!}' + '/';
                            if (response.code === "1000") {
                                CEUtil.msg.success("Upload Success");
                            } else {
                                CEUtil.msg.error("Upload Failed," + response.message);
                            }
                        },
                        UploadComplete: function (uploader, files) {
                            uploader.refresh();
                            ${callback!}
                        }
                    }
                });
            }

            $("#${click!}").on("click", function () {
                CEUtil.modal.open({
                    id: "fileUploadModal_${id}",
                    before: function () {
                    },
                    after: function () {
                    },
                    success:function(layero, index){
                        var $uploader = $(layero).find(".CE-Uploader");
                        initUploader($uploader);
                    }
                });
            });
        });
    </script>
[#--<div class="modal" id="fileUploadModal_${id}" tabindex="-1" role="dialog" data-backdrop="static">--]
    [#--<div class="modal-dialog">--]
        [#--<div class="modal-content">--]
            [#--<div class="modal-header">--]
                [#--<button type="button" class="close" data-dismiss="modal">--]
                    [#--<span aria-hidden="true">&times;</span>--]
                [#--</button>--]
                [#--<h4 class="modal-title"><span class="label label-info"><i--]
                        [#--class="icon-cloud-upload"></i></span>${dialogTitle}</h4>--]
            [#--</div>--]
            [#--<div class="modal-body">--]
                [#--<div id="${id}" style="${style}" class="replace">--]
                    [#--<p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>--]
                [#--</div>--]

                [#--<script type="text/javascript">--]
                    [#--$(function () {--]
                        [#--//初始化上传插件--]
                        [#--var $uploader = $("#${id}");--]

                        [#--function initUploader($uploader) {--]
                            [#--$uploader.plupload({--]
                                [#--// General settings--]
                                [#--runtimes: 'html5,flash,silverlight,html4',--]
                                [#--url: "${relativeUrl}",--]

                                [#--// Maximum file size--]
                                [#--max_file_size: '${maxFileSize}',--]
                            [#--file_data_name: '${name}',--]

[#--//                                chunk_size: '1mb',--]
                                [#--multi_selection: false,--]
                                [#--// Resize images on clientside if we can--]
                                [#--resize: {--]
                                    [#--quality: ${resizeQuality},--]
                                    [#--crop: true // crop to exact dimensions--]
                                [#--},--]

                                [#--// Specify what files to browse for--]
                                [#--filters: [--]
                                    [#--{--]
                                        [#--title: "Image files",--]
                                        [#--extensions: "${filters!'jpg,gif,png'}"--]
                                    [#--}--]
                                [#--],--]

                                [#--// Rename files by clicking on their titles--]
                                [#--rename: true,--]

                                [#--// Sort files--]
                                [#--sortable: true,--]

                                [#--// Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)--]
                                [#--dragdrop: true,--]

                                [#--// Views to activate--]
                                [#--views: {--]
                                    [#--list: true,--]
                                    [#--thumbs: true, // Show thumbs--]
                                    [#--active: 'thumbs'--]
                                [#--},--]

                                [#--// Flash settings--]
                                [#--flash_swf_url: '${springMacroRequestContext.getContextUrl("/resources/js/plupload/Moxie.swf")}',--]

                                [#--// Silverlight settings--]
                                [#--silverlight_xap_url: '${springMacroRequestContext.getContextUrl("/resources/js/plupload/Moxie.xap")}',--]
                                [#--init: {--]
                                    [#--PostInit: function (uploader) {--]
                                        [#--orginalOptions = $.extend(true, {}, uploader.getOption());--]
                                    [#--},--]
                                    [#--FilesAdded: function (uploader, files) {--]
                                        [#--//if user choose multi files only keep the latest--]
                                        [#--if (uploader.files.length == 2) {--]
                                            [#--$uploader .plupload("removeFile", uploader.files[0]);--]
                                        [#--}--]
                                    [#--},--]
                                    [#--BeforeUpload: function (uploader, files) {--]
                                        [#--uploader.refresh();--]
                                    [#--},--]
                                    [#--FileUploaded: function (uploader, file, response) {--]
                                        [#--response = $.parseJSON(response.response);--]
                                        [#--var path = '${path!}' + '/';--]
                                        [#--if (response.code === "1000") {--]
                                            [#--gallery.show();--]
                                        [#--} else {--]
                                            [#--$("input[name='${name}']").val("");//上传失败后清除之前保存在隐藏字段中的值--]
                                            [#--alert(response.message);--]
                                        [#--}--]
                                    [#--},--]
                                    [#--UploadComplete: function (uploader, files) {--]
[#--//                            uploader.setOption(orginalOptions);--]
                                        [#--uploader.refresh();--]
                                    [#--${callback!}--]
                                    [#--}--]
                                [#--}--]
                            [#--});--]
                        [#--}--]

                        [#--$("#${click!}").on("click", function () {--]
                            [#--CEUtil.modal.open({--]
                                [#--id: "fileUploadModal_${id}",--]
                                [#--before: function () {--]
                                    [#--initUploader();--]
                                [#--},--]
                                [#--after: function () {--]
                                    [#--uploader.plupload("destroy");--]
                                [#--}--]
                            [#--});--]

                            [#--var index = layer.open({--]
                                [#--type: 1,--]
                                [#--content: $("#fileUploadModal_${id}").html(),--]
                                [#--success:function(layero, index){--]
                                    [#--initUploader($(layero).find(".replace"));--]
                                [#--}--]
                            [#--});--]
                            [#--$("#fileUploadModal_${id}").modal("show");--]
                        [#--});--]
[#--//                        initUploader();--]
                        [#--//窗口打开时初始化上传插件--]
                        [#--$("#fileUploadModal_${id}").on("show.bs.modal", function (e) {--]
                            [#--initUploader();--]
                        [#--});--]
                        [#--//对话框关闭时清空队列--]
                        [#--$("#fileUploadModal_${id}").on("hidden.bs.modal", function (e) {--]
                            [#--$uploader.plupload("destroy");--]
                        [#--});--]
                    [#--});--]
                [#--</script>--]
            [#--</div>--]
        [#--</div>--]
    [#--</div>--]
[#--</div>--]
[/#macro]

[#-- 上传组件 --]
[#--[#macro upload--]
[#--url=""--]
[#--click=""--]
[#--buttonText="选择文件"--]
[#--buttonClass="easyui-linkbutton"--]
[#--fileSizeLimit="50MB"--]
[#--filters ="*.*"--]
[#--queueID="uploadQueue"--]
[#--removeCompleted="true"--]
[#--multi="false"--]
[#--width="100"--]
[#--height="25"--]
[#--lineHeight="25"--]
[#--checkExisting=""--]
[#--method="post"--]
[#--callback=""--]
[#--modal = "Y"--]
[#--]--]
[#--[#if modal == "Y"]--]
[#--<div class="modal fade " tabindex="-1" role="dialog" data-backdrop="static" id="uploadbox-${timestamp!}"--]
[#--style="display: none;">--]
[#--<div class="modal-dialog modal-lg">--]
[#--<div class="modal-content">--]
[#--<div class="widget-header">--]
[#--<h5 class="bigger lighter">上传文件</h5>--]

[#--<div class="widget-toolbar">--]
[#--<a href="#" data-dismiss="modal"><i class="icon-remove"></i></a>--]
[#--</div>--]
[#--</div>--]
[#--<div class="widget-body">--]
[#--<div class="widget-main padding-18">--]
[#--上传的文件将在这里显示--]
[#--<div id="queue-${timestamp!}"></div>--]
[#--</div>--]
[#--<div class="widget-toolbox">--]
[#--<div class="btn-toolbar">--]
[#--<div class="btn-group">--]
[#--<a href="javascript:void(0);" id="moduleUpload-${timestamp!}" class="easyui-linkbutton"><i--]
[#--class="icon-cloud-upload"></i>上传文件</a>--]
[#--</div>--]
[#--</div>--]
[#--</div>--]

[#--</div>--]
[#--</div>--]
[#--</div>--]
[#--</div>--]
[#--[#if !click??]--]
[#--<button class="btn btn-small btn-success" onclick="modal.open({id:'uploadbox-${timestamp!}'});">--]
[#--<i class="icon-plus"></i>${buttonText!}--]
[#--</button>--]
[#--[#else]--]
[#--<script>--]
[#--$(function(){--]
[#--$("#${click}").on("click",function(){--]
[#--$("#uploadbox-${timestamp!}").modal("show");--]
[#--})--]
[#--})--]
[#--</script>--]
[#--[/#if]--]
[#--[#elseif modal == "N"]--]
[#--<a href="javascript:void(0);" id="moduleUpload-${timestamp!}"><i class="icon-cloud-upload"></i>上传文件</a>--]
[#--[/#if]--]
[#--<script type="text/javascript">--]
[#--$(function () {--]
[#--$("#moduleUpload-${timestamp!}").uploadify({--]
[#--//基本设置--]
[#--swf: "${path}/resources/js/uploadify/uploadify.swf"--]
[#--, modal: false--]
[#--, buttonClass: '${buttonClass!}'--]
[#--, buttonImage: ''--]
[#--, buttonText: '${buttonText!}'--]
[#--, fileSizeLimit: '${fileSizeLimit}'	//文件大小限制--]
[#--, fileTypeExts: '${filters}'	//文件类型,格式为"*.*",若有多个格式以";"分割。例如:"*.jpg;*.gif"--]
[#--, queueID: '${queueID}' //显示队列的DIV--]
[#--, removeCompleted: ${removeCompleted}    //上传成功后的文件，是否在队列中自动删除--]
[#--, preventCaching: true--]
[#--, auto: true--]
[#--, multi:${multi}--]
[#--, width:${width}--]
[#--, height:${height}--]
[#--, lineHeight:${lineHeight}--]
[#--, removeTimeout: 1--]
[#--//服务器地址和方式设置--]
[#--//			,checkExisting:"${checkExisting}" //检查上传文件是否存，触发的url，返回1/0--]
[#--, uploader: "${url}"--]
[#--, method: "${method}"--]
[#--//			,formData: formData--]
[#--, onUploadError: function (file, errorCode, errorMsg, errorString) {--]
[#--//若为-280为用户取消上传--]
[#--if (errorCode == "-280") {--]
[#--bootbox.alert("[" + file.name + "] 取消上传");--]
[#--} else {--]
[#--bootbox.alert('文件: <font color="#ff0000">[' + file.name + ']</font> 上传失败,' +--]
[#--'<font color="#ff0000">错误原因:</br> '--]
[#--+ "错误码 :" + errorCode + "</br>"--]
[#--+ "错误消息: " + errorMsg + "</br>"--]
[#--+ "错误描述 : " + errorString + "</br></font>");--]
[#--}--]

[#--}--]
[#--//上传成功后触发的事件--]
[#--, onUploadSuccess: function (file, newFilename, response) {--]
[#--if (newFilename != "" && response) {--]
[#--//$.messager.alert("[" + file.name + "] 上传成功","上传成功","info");--]
[#--${callback!}--]
[#--} else {--]
[#--//错误的参数--]
[#--bootbox.alert("[" + file.name + "] 上传失败");--]
[#--}--]
[#--}--]
[#--});--]
[#--})--]
[#--</script>--]
[#--[/#macro]--]

[#--
    ckeditor编辑器标签
    id:默认为editor1
    name:默认为editor1
    url:自定保存内容到后台处理的URL
    title:编辑器内容标题
    rows:默认为10
    cols:默认为80
--]
[#macro form_editor
    name="editor1"
    id="editor1"
    url=""
    title=""
    rows="40"
    cols="80"
    value="This is my textarea to be replaced with CKEditor."
    class=""
    type="all"
    ]
<textarea name="${name}" id="${id}" rows="${rows}" cols="${cols}" class="${class!}">${value?html!}</textarea>
<script>
    var editor = CKEDITOR.replace("${id}", {
        [#if "all" == type]
        customConfig: '${path}/resources/ckeditor/config.js'
        [#else]
        customConfig: '${path}/resources/ckeditor/simple_config.js'
        [/#if]
    });
</script>
[/#macro]

[#--
    kindeditor编辑器标签
    id:默认为editor_id
    name:默认为content
    width:宽度,默认为700px
    height:高度,为300px
    class:样式
--]
[#macro form_kindeditor name="content" id="editor_id"  width="700px" height="300px" value="This is my textarea to be replaced with CKEditor." class=""]
<textarea id="${id}" name="${name}" style="width:${width};height:${height};" class="${class}">
${value?html!}
</textarea>
<script>
    $(function () {
        window.editor = KindEditor.create('textarea[name="${name}"]', {
            allowFileManager: true,
            afterBlur: function () {
                this.sync();
            },
            uploadJson: '${path}/resources/uploadJsp/upload_json.jsp',
            fileManagerJson: '${path}/resources/uploadJsp/file_manager_json.jsp',
        });
    })
</script>
[/#macro]

[#--
    form_date日期选择宏标签
    id:默认为空
    name:默认为空
    class:日期输入框样式 默认值为:Wdate
    value:日期输入框值:默认值为：当前时间
    style:最高级样式属性
    lang:多语言：中文（zh-cn）,英文（en）
    skin:主题颜色（default,whyGreen,blue,simple）
--]
[#macro form_date id="" name="" class="Wdate" value="" style="" lang="zh-cn" skin="whyGreen"]
<input type="text" name="${name}" id="${id}" class="${class}" value="${value}" style="${style}"
       onFocus="WdatePicker({skin:'${skin}',startDate:'%y-%M-%d %H:%m:%s',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,lang:'${lang}'})"
       readonly="readonly"/>
[/#macro]

[#--
	get file extension
--]
[#macro extension filename=""]
    [#compress ]
        [#if filename?? && (filename?last_index_of(".") != -1)]
        ${filename?substring(filename?last_index_of(".") + 1,filename?length)}
        [/#if]
    [/#compress]
[/#macro]

[#macro remove_extension filename=""]
    [#compress ]
        [#if filename?? && (filename?last_index_of(".") != -1)]
        ${filename?substring(0,filename?last_index_of("."))}
        [#else]
        ${filename}
        [/#if]
    [/#compress]
[/#macro]

[#--
 Codemirror macro,auto analisis file exstension and choose the right type
 --]
[#macro codemirror filename=""]
    [#if filename??]
        [#compress ]
            [#if filename?ends_with(".html")
            || filename?ends_with(".htm")
            || filename?ends_with(".shtml")]
            text/html
            [#elseif filename?ends_with(".js")]
            text/javascript
            [#elseif filename?ends_with(".css")]
            text/css
            [/#if]
        [/#compress]
    [/#if]
[/#macro]

[#macro filed_type_list]
<option value="TEXT_INPUT">Text input box</option>
[#--<option value="RADIO_INPUT">单选框</option>--]
[#--<option value="CHECKBOX_INPUT">多选框</option>--]
[#--<option value="SELECT">下拉框</option>--]
<option value="TEXTAREA">Textarea</option>
<option value="DATE_BOX">Date input box</option>
<option value="TEXT_EDITOR">Rich text box</option>
<option value="SIMPLE_TEXT_EDITOR">Simple text box</option>
<option value="UPLOAD_PIC">Upload img</option>
<option value="UPLOAD_FILE">Upload file</option>
[/#macro]