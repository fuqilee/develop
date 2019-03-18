/**
 * Bootstrap Table 默认参数
 */
$.extend($.fn.bootstrapTable.defaults, {
//  method: 'post',
	striped: true,
    pagination: true,
    sidePagination: 'server',
    pageNumber: 1,
	pageSize: 20,
	pageList: "[5, 10, 20,50,100]",
	responseHandler: "responseHandler",
//  contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	showColumns: true,
	
	queryParamsType: "",	//值为空时,参数为pageSize和pageNumber
	
	showToggle: true,
    showRefresh: true
});

$.extend($.fn.bootstrapTable.columnDefaults, {
    //align: 'center',
    valign: 'middle'
});

function responseHandler(res) {
	//alert(JSON.stringify(res));
	if (res.totalCount > 0) {
		return {
			"rows": res.rows,
			"total": res.totalCount
		}
	} else {
		return {
			"rows": [],
			"total": 0
		}
	}
}