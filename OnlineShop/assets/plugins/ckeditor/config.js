/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	config.language = 'fr';
    
	config.extraPlugins = 'syntaxhighlight';
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.filebrowserBrowseUrl = '~/asset/plugins/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '~/asset/plugins/ckfinder/ckfinder.html?type=Images';
    config.filebrowserFlashBrowseUrl = '~/asset/plugins/ckfinder/ckfinder.html?type=Flash';
    config.filebrowserUploadUrl = '~/asset/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '~/Data/images';
    config.filebrowserFlashUploadUrl = '~/asset/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
    config.enterMode = CKEDITOR.ENTER_BR;
};
