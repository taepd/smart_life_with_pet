
 
<script>
var dindex = '${donate.dindex}'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'dindex':dindex},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.dcindex+'">'+'댓글번호 : '+value.dcindex+' / 작성자 : '+value.userid;
                a += '<a onclick="commentUpdate('+value.dcindex+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.dcindex+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.dcindex+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentMain").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
            	commentMain(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(dcindex, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+dcindex+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+dcindex+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+dcindex).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(dcindex){
    var updateContent = $('[name=content_'+dcindex+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'dcindex' : dcindex},
        success : function(data){
            if(data == 1) commentMain(dindex); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(dcindex){
    $.ajax({
        url : '/comment/delete/'+dcindex,
        type : 'post',
        success : function(data){
            if(data == 1) commentMain(dindex); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>
