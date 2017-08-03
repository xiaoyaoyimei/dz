$("#nav").hover(function(){
    $(this).css("color","red")
    $("#yx").css("display","block")
},function(){
    $(this).css("color","black")
    $("#yx").css("display","none")
})
$("#yx li ol li").each(function(){
    console.log($("#yx li ol li"))
  
})
$("#yx>li").each(function(){
   $(this).hover(function(){
    $(this).find("ol").css("display","inline-block")
   },function(){
     $(this).find("ol").css("display","none")
   })
})