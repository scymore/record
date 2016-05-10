/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    config.height = 500; //height
    config.toolbarGroups = [
        {name: 'document', groups: ['mode', 'document', 'doctools']},
        {name: 'clipboard', groups: ['clipboard', 'undo']},
        {name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing']},
        {name: 'forms', groups: ['forms']},
        '/',
        {name: 'basicstyles', groups: ['basicstyles', 'cleanup']},
        {name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph']},
        {name: 'links', groups: ['links']},
        {name: 'insert', groups: ['insert']},
        '/',
        {name: 'styles', groups: ['styles']},
        {name: 'colors', groups: ['colors']},
        {name: 'tools', groups: ['tools']},
        {name: 'others', groups: ['others']},
        {name: 'about', groups: ['about']}
    ];

    config.removeButtons = 'Flash,About';

    config.language = 'zh-cn';
    config.linkShowAdvancedTab = 0;
    //Integrate CKFinder and setting configurations.
    //config.filebrowserBrowseUrl = '../resources/ckfinder/ckfinder.html',
    config.filebrowserImageBrowseUrl = '../resources/ckfinder/ckfinder.html?type=Images',
    //config.filebrowserFlashBrowseUrl = '../resources/ckfinder/ckfinder.html?type=Flash',
    //config.filebrowserUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
    //config.filebrowserImageUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
    //config.filebrowserFlashUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
    config.filebrowserWindowWidth = '1000',
    config.filebrowserWindowHeight = '700'

};
