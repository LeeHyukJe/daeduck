$(function(){
    // http://192.168.8.36:7800/manager/WNRun.do?target=recommend&query=TEST&label=daeduck&datatype=json

    var params = {
        "target":'recommend',
        "query":'test',
        "label":"daeduck",
        "datatype":"json"
    }
    $.ajax({
        url : '/recommend',
        type : 'POST',
        datatype : 'json',
        contentType : "application/json",
        data: JSON.stringify(params),
        success:function(data){
            console.log('추천서비스'+data);
            var str = '';
            data.Data.Word.forEach(each=>{
                str += "<li href=\"#\">"+each+"</li>";
            })

            $('#recommend').html(str);
        },
        error : function(error){

        }
    })
})