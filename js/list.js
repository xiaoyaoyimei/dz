$(function(){
$("#list").find('li').each(function () {
    $(this).find('div').click(function () {
        if($(this).find("i").length == 1){
            $(this).find("i").remove();
        }else{
            $(this).append("<i></i>");
        }
        
        $("#XZ").text(function(){
            var text="" ;
            $("#list li").each(function(){
                if($(this).find("i").length == 1){
                    text +=$(this).text();
                }
            }
        )
        return text
        }).css("color","red");
    }
    )
});
$("#list button").click(function(){
    if($("#list li div").find("i").length > 0){
        $("#list li div").find("i").remove();
        $("#XZ").text("")
    }else{
        alert("未选中任何选项");
    }
    
});
$("#Z_K").click(function(){
    $(this).toggleClass('glyphicon-minus');
    $(this).parent().next().slideToggle();
});
  $(".list .quick").each(function(){
            $(this).click(function(){
                window.location.href="fastdetail.html";
            })
        });
        $(".list .best").each(function(){
            $(this).click(function(){
                window.location.href="detail.html";
            })
        });
});