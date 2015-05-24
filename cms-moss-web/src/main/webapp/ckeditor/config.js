/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights
 *          reserved. For licensing, see LICENSE.html or
 *          http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
/*	config.toolbar = [ [ 'Source', '-', 'Save', 'NewPage', 'Preview', '-', 'Templates' ],
			[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Print', 'SpellChecker', 'Scayt' ],
			[ 'Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll', 'RemoveFormat' ], '/',
			[ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript' ],
			[ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote' ],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ], [ 'Link', 'Unlink', 'Anchor' ],
			[ 'Image', 'Smiley', 'SpecialChar' ], [ 'Styles', 'Format', 'Font', 'FontSize' ],
			[ 'TextColor', 'BGColor' ] ];*/

	// Remove some buttons, provided by the standard plugins, which we don't
	// need to have in the Standard(s) toolbar.
	config.removeButtons = 'Underline,Subscript,Superscript';
	config.baseFloatZIndex = 100000;
	// Se the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';

	// Make dialogs simpler.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	if (contextPath == undefined || contextPath == null) {
		contextPath = "";
	}

	config.filebrowserBrowseUrl = 'http://localhost:8080/cms-moss-web/ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = 'http://localhost:8080/cms-moss-web/ckfinder/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = 'http://localhost:8080/cms-moss-web/ckfinder/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = 'http://localhost:8080/cms-moss-web/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = 'http://localhost:8080/cms-moss-web/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = 'http://localhost:8080/cms-moss-web/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
	config.language = "zh-cn";

};
