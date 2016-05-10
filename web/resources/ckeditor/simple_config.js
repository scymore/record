/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    config.height = 500; //height
    config.toolbar = [
        { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
        { name: 'editing', items: [ 'Scayt' ] },
        { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
        { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
        { name: 'document', items: [ 'Source' ] },
        '/',
        { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
        { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
        { name: 'styles', items: [ 'Styles', 'Format','Font','FontSize','TextColor','BGColor' ] },
        { name: 'about', items: [ 'About' ] },
        { name: 'tools', items: [ 'Maximize' ] }
    ];
    config.removeButtons = 'Underline,Subscript,Superscript,Image,Table,Anchor,Scayt,Flash,About';

    config.language = 'zh-cn';
    config.linkShowAdvancedTab = 0;
    //Integrate CKFinder and setting configurations.
    //config.filebrowserBrowseUrl = '../resources/ckfinder/ckfinder.html',
    //config.filebrowserImageBrowseUrl = '../resources/ckfinder/ckfinder.html?type=Images',
    //config.filebrowserFlashBrowseUrl = '../resources/ckfinder/ckfinder.html?type=Flash',
    //config.filebrowserUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
    //config.filebrowserImageUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
    //config.filebrowserFlashUploadUrl = '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash',
    //config.filebrowserWindowWidth = '1000',
    //config.filebrowserWindowHeight = '700'

};
