function uploadComplete() {
	var fileObj = document.getElementById('file').files[0]; // 获取文件对象
	var size = fileObj.size;
	var fileName = fileObj.name;
	var chunks = Math.max(Math.floor(fileObj.size / chunkSize), 1) + 1;// 分割块数
	$.ajax({
		url : "/home/fileSize?uuid=" + uuid,
		dataType : "json",
		success : function(list) {
			console.log(list)
			var result = (list / size * 100).toFixed(2);
			var width = result * 10;
			$("#d").css("width", width + "px");
			$("#l").html(result + "%")
			if (result == "100.00") {
				$.get("/HOME/hebing?uuid=" + uuid + "&chunks=" + chunks
						+ "&fileName=" + fileName, "", function() {
					window.location.reload();
				})
			}

		}

	});
}