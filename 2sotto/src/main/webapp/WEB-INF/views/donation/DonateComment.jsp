<script>

//페이지 링크 비동기
$(function(){
		
		//페이지 당 건수
		$('#paging').change(function(){
			let data = {ps : $('#paging option:selected').val(),
					    cp : $('#cp').val() 
			           };		
			$.ajax({
				url:"NoticeListAjax.bit",
				data: data,
				type:"POST",		
				dataType: "json",
				success:function(responsedata){ 
					 console.log(responsedata);
					$('#noticetable').empty();
					$.each(responsedata,function(index,obj){	
						$('#noticetable').append(	
								"<tr><td>"+obj.ncindex+"</td>" +
								"<td><a href='AdminNoticeDetail.bit?ncindex="+obj.ncindex+"&cp=${cpage}&ps=${pagesize}'>" +
									obj.title+"</a></td>" +
								"<td>"+obj.rtime+"</td>" +
								"<td>"+obj.adminid+"</td>" +
								"<td>"+obj.ncstate+"</td><tr>"
						   
						);
					});
					$('#zero_config_info').empty();
					$('#zero_config_info').append("페이지 표시 글 수 " + responsedata.length);
					
					//페이지 번호 처리
					page($('#cp').val());
			   }
				
			
			}); 
		});
		
		//page()
		function page(cp){
			console.log('cp='+cp);
			$('#zero_config_paginate').empty();
			var pagesize = $('#paging option:selected').val();
			var totalnoticecount = $('#totalnoticecount').val();
			
			var pagecount;
			console.log('pagesize= '+pagesize);
			console.log('totalnoticecount= '+ totalnoticecount);
			if((totalnoticecount % pagesize) == 0){
				pagecount = totalnoticecount/pagesize;
			}else if(totalnoticecount/pagesize<1){
				pagecount=1;
			}else{
			
				pagecount = Math.floor(totalnoticecount/pagesize + 1); 
			}
			
			console.log('pagecount = '+pagecount);
			let tmp="";
			
			if(cp>1){
				tmp +='<a href="NoticeList.bit?cp=${cpage-1}&ps='+pagesize+'" cp="'+(cp-1)+'" ps="${pagesize}">이전</a>';
			}
			//page 목록 나열하기
			for(var i=1;i<=pagecount; i++){
				if(cp==i){
					tmp +=('<font color="red">['+i+']</font>');
				}else{
					tmp +=('<a href="NoticeList.bit?cp='+i+'&ps='+pagesize+'" cp="'+i+'" ps="'+pagesize+'" >['+i+']</a>');
				}
			}
			//다음 링크
			if(cp<pagecount){
				tmp += '<a href="NoticeList.bit?cp=${cpage+1}&ps='+pagesize+'" cp="'+(cp+1)+'" ps="${pagesize}">다음</a>';
			};
			$('#zero_config_paginate').append(tmp);
		};
		
		//페이지 링크 비동기
		$(document).on('click', '#zero_config_paginate a', function(e){
			e.preventDefault();
			let data = {ps : $(this).attr('ps'),
				        cp : $(this).attr('cp')
		           };		
		$.ajax({
			url:"NoticeListAjax.bit",
			data: data,
			type:"POST",		
			dataType: "json",
			success:function(responsedata){ 
				 console.log(responsedata);
				$('#noticetable').empty();
				$.each(responsedata,function(index,obj){	
					$('#noticetable').append(	
							"<tr><td>"+obj.ncindex+"</td>" +
							"<td><a href='NoticeDetail.bit?ncindex="+obj.ncindex+"&cp=${cpage}&ps=${pagesize}'>" +
								obj.title+"</a></td>" +
							"<td>"+obj.rtime+"</td>" +
							"<td>"+obj.adminid+"</td>" +
							"<td>"+obj.ncstate+"</td><tr>"
					   
					);
				});
				$('#zero_config_info').empty();
				$('#zero_config_info').append("총 공지글 수 " + $('#totalnoticecount').val());
				
				//페이지 번호 처리
				page(parseInt(data.cp));
		   }
			
		
		}); 
			
		});
		

});
</script>
