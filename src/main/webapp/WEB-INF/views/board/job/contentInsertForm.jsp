
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
            htParams : {
                // 툴바 사용 여부
                bUseToolbar : true,            
                // 입력창 크기 조절바 사용 여부
                bUseVerticalResizer : true,    
                // 모드 탭(Editor | HTML | TEXT) 사용 여부
                bUseModeChanger : true,
            }
        });
        //전송폼
        $("#save").click(function(){ 
        	//적용할 textArea id = editor
			obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []); 
			$("#insertBoardFrm").submit(); 
		})
    });
</script>
