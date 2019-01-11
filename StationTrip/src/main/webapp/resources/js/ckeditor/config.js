/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

// CKEDITOR.editorConfig = function( config ) {
// 	// Define changes to default configuration here. For example:
// 	// config.language = 'fr';
// 	// config.uiColor = '#AADC6E';
//     width : '620px'
//     toolbar : "basic";
// };

CKEDITOR.editorConfig = function( config ) {
     // Define changes to default configuration here. For example:
     // config.language = 'fr';
     // config.uiColor = '#AADC6E';  
   config.docType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
   config.font_defaultLabel = '굴림';
   config.font_names = '굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;Trebuchet MS/Trebuchet MS;Verdana/Verdana';
   config.fontSize_defaultLabel = '12px';
   config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
   config.language = "ko";
   config.resize_enabled = false;
   config.enterMode = CKEDITOR.ENTER_BR;
   config.shiftEnterMode = CKEDITOR.ENTER_P;
   config.startupFocus = true;
   config.uiColor = '#eaebe7';
   config.toolbarCanCollapse = false;
   config.menu_subMenuDelay = 0;
   config.width ='100%';
//    config.toolbar = [['Font','FontSize'],['Bold','Italic','Underline','Strike','Subscript','Superscript','TextColor','BGColor','Blockquote','RemoveFormat','NumberedList','BulletedList'],'/',['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],['Link','Unlink','Find','Replace','SelectAll','-','Image','Table','Smiley','SpecialChar'],'/',['Source','Preview','Templates','Print'],['Cut','Copy','Paste','PasteText','PasteFromWord','Undo','Redo','Maximize']];
  config.toolbar =
[
// [ 'NewPage','Preview' ],
// [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ],
[ 'Bold','Italic','Strike','-','RemoveFormat' ],
[ 'Find','Replace','-','SelectAll','-','Scayt' ],
[ 'Image','Flash','Table','HorizontalRule','SpecialChar','PageBreak'],
[ 'Styles','Format' ]
];
  
   /*
  'About','Save','Styles','ShowBlocks','Format','SpellChecker','Scayt','NewPage','Anchor','Outdent','Indent',
  '-',
  ],'/',[
  ['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
  ['Flash','HorizontalRule','PageBreak'],
  */
 }; 