jQuery.noConflict();
function load_table(table_id) {
	jQuery(document).ready(function() {
		jQuery('#' + table_id).dataTable({
			"bJQueryUI": true,
			"bLengthChange": false,
			"bPaginate": false,
			"sDom": '<"fg-toolbar ui-widget-header ui-corner-tl ui-corner-tr ui-helper-clearfix"lfr>t',
			"oLanguage": {
				"sUrl": "/javascripts/datatable/zh-cn.txt"
			}
		});
	});
}