var CEUtil = {};

/** *********生成随机密码工具**************** */
/** *************************************** */
/** *************************************** */
/**
 * 得到指定长度中的随机数，例如：从0～10，得到0到10之间的数
 *
 * @param {Object}
 *            lbound 下标
 * @param {Object}
 *            ubound 长度
 */
CEUtil.getRandomNum = function (lbound, ubound) {
    return (Math.floor(Math.random() * (ubound - lbound)) + lbound);
}


CEUtil.conver2array = function (src) {
    var array = new Array();
    var sa = src.split(",")
    return sa;
}

/**
 *
 * @param {Object}
 *            num 密码长度
 */
CEUtil.makeRandomPwd = function (num) {
    var numberChars = "0123456789";
    var lowerChars = "abcdefghijklmnopqrstuvwxyz";
    var upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var charSet = numberChars + lowerChars + upperChars;
    if (typeof num == "undefined")
        num = 8;
    var result = "";
    for (var i = 0; i < num; i++) {
        result += charSet.charAt(getRandomNum(0, charSet.length));
    }
    return result;
}

/**
 * 显示验证码
 *
 * @param element
 * @param path
 */
CEUtil.verifycode = function (element, path) {
    var $e = $(element);
    path += '?' + Math.floor(Math.random() * 100);
    var $img = $('<img alt="Loading verify code" src="'
        + path
        + '" height="30" style="vertical-align:middle;cursor: pointer;" onclick="CEUtil.verifycode(this,\''
        + path + '\');"/>');
    $e.siblings("img").remove();
    $e.after($img.fadeIn());
    if ("A" == $e[0].tagName || "IMG" == $e[0].tagName) {
        $e.remove();
    }
}
/**
 * 全选
 */
CEUtil.checkAll = function (e) {
    var $operator = $(e);
    var $items = $operator.parents("table").find("[type='checkbox']").not(
        $operator);
    if ($operator.prop("checked")) {
        $items.prop("checked", true);
    } else {
        $items.prop("checked", false);
    }
}

/**
 * 检查表单值是否为空
 */
CEUtil.isFormEmpty = function ($form) {
    var params = $form.serialize();
    if (params == "") {
        return true;
    }

    var entries = params.split("&");
    for (var i = 0; i < entries.length; i++) {
        var entry = entries[i].split("=");
        if ($.trim(entry[entry.length - 1]) != "" && entry[i] != "queryType") {
            return false;
        }
    }
    return true;
}

CEUtil.getJsonLength = function (jsonData) {

    var jsonLength = 0;

    for (var item in jsonData) {

        jsonLength++;

    }

    return jsonLength;

}

CEUtil.formatter = {
    isNull: function (string) {
        if (string == null || string == "" || typeof string == "undefined") {
            return true;
        }

        return false;
    },
    combinURL: function (url, params) {
        if (formatter.isNull(url)) {
            return null;
        }
        params = formatter.isNull(params) == true ? "" : params;

        var array = url.split("?");
        if (array.length > 1) {
            url = array[0];
            params += "&" + array[1];
        }
        url += "?" + params;
        return url;
    }
};
// 全选反选
// 参数:selected:传入this,表示当前点击的组件
// treeMenu:要操作的tree的id；如：id="userTree"
CEUtil.treeChecked = function (selectAll, tree) {
    var checkAll = function ($e, $children) {
        $e.on("change", function () {
            if ($e.prop("checked")) {
                $children.prop("checked", true);
            } else {
                $children.prop("checked", false);
            }
        })
    }

    // 子菜单选中则选中父菜单，所有子菜单都不选中则父菜单不选中
    var uncheckRoot = function (e) {
        $e = $(e);
        // 父菜单
        var $parent = $e.closest("li").parent("ul").prev("label").find(
            "[type='checkbox']");

        // 同级菜单
        var $brothers = $e.closest("li").siblings("li");

        $e.on("change", function () {
            var i = 0;
            // 子菜单选中则选中父菜单
            if ($(this).prop("checked")) {
                if (typeof $parent.attr("id") == "undefined") {
                    $parent.prop("checked", true);
                }
            } else {
                // 所有子菜单不选中，则父菜单不选中
                $brothers.each(function () {
                    $brother = $(this).find("[type='checkbox']");
                    if (!$brother.prop("checked")) {
                        i++;
                    }
                });
                if (i == $brothers.length) {
                    $parent.prop("checked", false);
                }
            }
        });
    }

    var $selectAll = $(selectAll);
    var $tree = $(tree);
    var $items = $tree.find("[type='checkbox']");
    checkAll($selectAll, $items);

    $items.each(function (i) {
        uncheckRoot(this);
        var $self = $(this);

        var $childRoot = $self.closest("label").next("ul");
        if ($childRoot.length == 1) {
            var $children = $childRoot.find("[type='checkbox']");
            checkAll($self, $children);
        }
    });

    // var roots = $(treeMenu).tree('getRoots');// 返回tree的所有根节点数组
    // if (selected.checked) {
    // for (var i = 0; i < roots.length; i++) {
    // var node = $(treeMenu).tree('find', roots[i].id);// 查找节点
    // $(treeMenu).tree('check', node.target);// 将得到的节点选中
    // }
    // } else {
    // for (var i = 0; i < roots.length; i++) {
    // var node = $(treeMenu).tree('find', roots[i].id);
    // $(treeMenu).tree('uncheck', node.target);
    // }
    // }
}

/**
 * 显示时间面板
 *
 * @param setting
 */
CEUtil.timePannel = function (setting) {
    var defaultSetting = {
        max: "",
        min: "",
        lang: 'en',
        now: "%y-%M-%d",
        dateFmt: "yyyy-MM-dd"
    };
    setting = $.extend({}, defaultSetting, setting || {});
    var minDate = setting.min == "" ? "" : "#F{$dp.$D(\'" + setting.min
    + "\')}";
    var maxDate = setting.max == "" ? setting.now : "#F{$dp.$D(\'"
    + setting.max + "\')}";
    WdatePicker({
        dateFmt: setting.dateFmt,
        lang: setting.lang,
        readOnly: true,
        minDate: minDate,
        maxDate: maxDate
    });
}

/**
 * 撤销事件，当按下删除<--键，清空该表单字段所有内容
 */
CEUtil.repeal = function (event) {
    var target = event.srcElement || event.target;
    var code = event.keyCode;
    if (code == 8) {
        $(target).val("");
    }
}

/** **************************************************************** */
/** **********************ACE STYLE 方法************************* */
/** **********************Date : 2015.03.26***************************** */
/** **********************Author:jiepeng*************************************** */
CEUtil.getTime = function () {
    var date = new Date();
    date = date.getTime();
    return date;
}

/**
 * 加载文件
 */
CEUtil.loadFile = function (url, selector) {
    url = path + url;
    var $wraper = $("#main-content");
    if (typeof selector != "undefined") {
        $wraper = $(selector);
    }
    var index = layer.load();
    $.ajax({
        url: url,
        type: "get",
        success: function (data) {
            layer.close(index);
            $wraper.empty().append(data);
        }
    });
}

CEUtil.confirm = function (url, msg, callback) {
    url = path + url;
    if (typeof msg == "function") {
        callback = msg;
        msg = undefined;
    }
    var tip = typeof msg == "undefined" ? "Are you sure you want to delete these items?" : msg;
    layer.confirm(tip, {
            title: "Warning",
            icon: 3,
            btn: ['Yes', 'No']
        },
        function (index) {
            var loadIndex = layer.load();
            $.ajax({
                url: url,
                type: "get",
                dataType: "json",
                success: function (data) {
                    layer.close(loadIndex);
                    if (data.code == "1000") {
                        CEUtil.dataTable.refresh();
                        CEUtil.msg.success("Operate success");
                    } else {
                        CEUtil.msg.error("Failed,ERROR:" + (typeof data.message == "undefined"?"":data.message));
                    }
                    if (callback) {
                        callback(data);
                    }
                }
            });
            layer.close(index);
        });
}
CEUtil.batchConfirm = function (e, path, tipTxt, msg, callback) {
    if (typeof tipTxt == "function") {
        callback = tipTxt;
        tipTxt = undefined;
    }

    if (typeof msg == "function") {
        callback = msg;
        msg = undefined;
    }
    var tip = typeof tipTxt == "undefined" ? "Please choose one item to delete!" : tipTxt;
    var checkboxes = $(e).find(":checked");
    if (checkboxes.length == 0) {
        CEUtil.msg.warning(tip);
    } else {
        var ids = "";
        checkboxes.each(function (i) {
            var key = $(this).attr("name");
            ids += key + "=" + $(this).val() + "&";
        });
        if (path.indexOf("?") != -1) {
            path = path + "&" + ids;
        } else {
            path = path + "?" + ids;
        }


        CEUtil.confirm(path, msg, callback);
    }
}
CEUtil.msg = {
    success: function (msg) {
        layer.msg(msg, {
            icon: 1
        });
    },
    error: function (msg) {
        layer.msg(msg, {
            icon: 2
        });
    },
    warning: function (msg) {
        layer.msg(msg, {
            icon: 0
        });
    }
}

/**
 * 校验规则封装对象
 */
CEUtil.formValidtor = {
    // 模态校验规则
    modalValid: function (setting) {
        var valid = {
            handler: "",
            rules: {},
            messages: {},
            submitHandler: function (form) {
                var $form = $(form);
                var url = $form.attr("action");
                var method = $form.attr("method");
                var nvp = $form.serialize();
                $.ajax({
                    url: url,
                    type: method,
                    data: nvp,
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "1000") {
                            CEUtil.modal.close();
                            CEUtil.dataTable.refresh();
                            CEUtil.msg.success("Operate success");
                        } else {
                            CEUtil.msg.error("Failed,ERROR:" + data.message);
                        }
                        if (setting.callbackFunc != undefined) {
                            setting.callbackFunc(data);
                        }
                    }
                });
            }
        }

        var settings = $.extend({}, valid, setting);
        var $form = $(settings.handler);
        var $modal = $form.closest("[role='dialog']");
        // 进行表单验证
        var url = $form.attr("action");

        $form.validate({
            errorPlacement: function (error, element) {
                $(element).parent().append(error);
            },
            rules: settings.rules,
            messages: settings.messages,
            submitHandler: settings.submitHandler
        });
    },
    valid: function (setting) {
        var valid = {
            handler: "",
            rules: {},
            messages: {},
            submitHandler: function (form) {
                if (CKEDITOR.instances) {
                    for (instance in CKEDITOR.instances) {
                        CKEDITOR.instances[instance].updateElement();
                    }
                }
                var $form = $(form);
                var url = $form.attr("action");
                var method = $form.attr("method");
                var nvp = $form.serialize();
                $.ajax({
                    url: url,
                    type: method,
                    data: nvp,
                    dataType: "json",
                    success: function (data) {
                        if (data.code == "1000") {
                            CEUtil.msg.success("Operate success");
                        } else {
                            CEUtil.msg.error("Failed,Error:" + data.message);
                        }
                        if (setting.callbackFunc != undefined) {
                            setting.callbackFunc(data);
                        }
                    }
                });
            }
        }

        var settings = $.extend({}, valid, setting);
        // 进行表单验证
        var $form = $(settings.handler);
        var url = $form.attr("action");

        return $form.validate({
            errorPlacement: function (error, element) {
                $(element).parent().append(error);
            },
            rules: settings.rules,
            messages: settings.messages,
            submitHandler: settings.submitHandler
        });
    }
}
/**
 * 数据表格
 */
CEUtil.dataTable = {
    tableID: "",
    showType: "list",// 表格类型，list为普通数据表格，tree为树形表格
    url: "",
    callback: function () {
    },
    remote: function () {
        $.ajax({
            url: CEUtil.dataTable.url,
            type: "post",
            success: function (data) {
                if (data) {
                    // alert(dataTable.tableID)
                    $(CEUtil.dataTable.tableID).find("tbody").empty().append(data);
                    $(CEUtil.dataTable.tableID).find("tbody").treetable("loadBranch",
                        data);
                    $(CEUtil.dataTable.tableID).treetable({
                        expandable: true,
                        force: true
                    });
                    CEUtil.dataTable.callback();
                }
            }
        });
    },
    initTable: function (options) {
        CEUtil.dataTable.tableID = options.tableID;
        CEUtil.dataTable.url = options.url;
        CEUtil.dataTable.data = options.data;
        CEUtil.dataTable.showType = options.showType;
        CEUtil.dataTable.callback = typeof options.callback == "undefined" ? CEUtil.dataTable.callback
            : options.callback;
        switch (CEUtil.dataTable.showType) {
            case "tree":
                $
                    .ajax({
                        url: CEUtil.dataTable.url,
                        type: "post",
                        success: function (data) {
                            if (data) {
                                $(CEUtil.dataTable.tableID).find("tbody").empty().append(data);
                                $(CEUtil.dataTable.tableID).treetable({
                                    expandable: true
                                });
                                CEUtil.dataTable.callback();
                            }
                        }
                    });
                break;
            default:
                var remote = {
                    "ajax": {
                        "url": CEUtil.dataTable.url,
                        "type": options.type == null ? "POST" : options.type,
                        "data": function (d) {
                            var start = Number(d.start);
                            var pagesize = Number(d.length);
                            var page = (start / pagesize) + 1;
                            d.page = (start / pagesize) + 1;
                            d.rows = pagesize;
                            d.columns = "";
                            d.order = "";
                            if(options.addParams instanceof Function){
                                options.addParams(d);
                            }
                        }
                    }
                }
                options = $.extend({}, options, remote);
                $(CEUtil.dataTable.tableID).dataTable(options);
                CEUtil.dataTable.callback();
                break;
        }
    },
    refresh: function (tableId) {
        switch (CEUtil.dataTable.showType) {
            case "tree":
                $.ajax({
                    url: CEUtil.dataTable.url,
                    type: "post",
                    success: function (data) {
                        if (data) {
                            $(CEUtil.dataTable.tableID).find("tbody").empty();
                            $(CEUtil.dataTable.tableID).treetable("loadBranch", null, data);
//						$(dataTable.tableID).find("tbody").empty().append(data);
                            $(CEUtil.dataTable.tableID).treetable("collapseAll");
                            CEUtil.dataTable.callback();
                        }
                    }
                });
                break;
            default:
                $(tableId!=undefined?tableId:CEUtil.dataTable.tableID).DataTable().ajax.reload();
                CEUtil.dataTable.callback();
                break;
        }
    }
}

/**
 * 模态框动作 2015.04.28
 */
CEUtil.modal = {
    open: function (setting) {
        var defaultSetting = {
            id: null,
            url: null,
            before: function () {
            },
            after: function () {
            },
            success: function (layero, index) {
            },
        }

        var conf = $.extend({}, defaultSetting, setting);
        var $modal = null;
        if (conf.before != undefined) {
            conf.before();
        }
        var genrateLayer = function (data) {
            var $data = $(data);
            var title = $data.attr("title");
            title = title == "null" || typeof title == "undefined" ? false : title;
            var closeBtn = $data.attr("data-closeBtn");
            closeBtn = closeBtn == null || typeof closeBtn == "undefined"?1:parseInt(closeBtn);
            layer.open({
                type: 1,
                title: title,
                area: '600px',
                closeBtn: 1,
                zIndex: 11,
                closeBtn:closeBtn,
                content: $data.html(), //注意，如果str是object，那么需要字符拼接。
                success: function (layero, index) {
                    var $closeBtn = $(layero).find("[data-dismiss]");
                    if ($closeBtn != null && typeof $closeBtn != "undefined") {
                        $closeBtn.on("click", function () {
                            var closeType = $(this).data("dismiss");
                            switch (closeType) {
                                case "dialog":
                                    layer.closeAll('dialog'); //关闭信息框
                                    break;
                                case "page":
                                    layer.closeAll('page'); //关闭所有页面层
                                    break;
                                case "iframe":
                                    layer.closeAll('iframe'); //关闭所有的iframe层
                                    break;
                                case "loading":
                                    layer.closeAll('loading'); //关闭加载层
                                    break;
                                case "tips":
                                    layer.closeAll('tips'); //关闭所有的tips层
                                    break;
                                default :
                                    layer.closeAll(); //疯狂模式，关闭所有层
                                    break;
                            }
                        });
                    }

                    if (conf.success != undefined) {
                        conf.success(layero, index);
                    }
                },
                end: function () {
                    if (conf.after != undefined) {
                        conf.after();
                    }
                }
            });
        }

        // 若URL不为空，则进行AJAX获取远程页面
        if (conf.url != null) {
            var index = layer.load();
            $.get(conf.url, function (data) {
                layer.close(index);
                genrateLayer(data);
            }, "html");
        } else if (conf.id != null) {
            genrateLayer("#" + conf.id);
        }

    },
    close: function () {
        layer.closeAll();
        $(".select2-container").remove();
    }
}

CEUtil.refreshMenu = function (url) {
    $.ajax({
        url: url,
        type: "get",
        dataType: "json",
        success: function (record) {
            if (record.code == "1000") {
                CEUtil.msg.success("Refresh success!");
                location.reload();
            } else {
                CEUtil.msg.error("Refresh failed!");
            }
        }
    });
}

CEUtil.cleanVal = function (id) {
    $(id).val("");
}