<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/static/css/jquery.bxslider.min.css" rel="stylesheet">
<link href="${ctx }/static/css/c-d.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div style="background:#fff">
<div class="page-dz">
  <h1 class="headline">FA01-GN-01</h1>
</div>
  <div class="main">
    <span class="wz logo1"><i>1</i></span>
    <span class="wz logo2"><i>2</i></span>
    <img  width="600" id="source"  height="600" style="display:none">
    <ul>
    <li style="position:relative;" class="bei">
     <img src="${pageContext.request.contextPath }/static/img/cd-main.png" id="cd-main"></li>
</div>
<!-- 右侧选择定制 -->
	<div class="section">
    <dl >
      <dt><i class="glyphicon glyphicon-menu-down"></i>上传位置1的logo</dt>
      <dd>
     	<form class="panel-body form-horizontal" id="imgform" autocomplete="off" enctype="multipart/form-data">
							<input type="hidden" name="order_id" id="order_id"/>
							<input type="hidden" name="img_type" id="img_type" value=""/>
						<div  class="col-xs-12">
							<input name="img" type="file" class="yl imgfile" data-wz='logo1' style="width:60px;height:60px;" />
							<img  id="source1" src="${ftpImageUrl}/product/product_main_default.png" data-src="${ftpImageUrl}/product/product_main_default.png" style="width:60px; height:60px;"> 
						</div>
			<button class="btn btn-info save" data-ylogo="1" type="button">保存</button>
       </dd>
    </dl>
    <dl id="yzys">
    <dt><i class="glyphicon glyphicon-menu-down"></i>输入位置2的个性签名</dt>
    <dd class="choose-zt">
		<p class="price">黑色 - ￥0</p>
		<div><h5>字体</h5>
		<span class="t-yh" data-ys="font-family:'微软雅黑'">雅黑</span>
		<span class="t-st" data-ys="font-family:'宋体'">宋体</span>
		<span class="t-st" data-ys="font-family:'黑体'">黑体</span>
		<span class="t-ks" data-ys="font-family:'楷书'">楷书</span>
		<span class="t-pg" data-ys="font-family:'苹果丽'">苹果丽中黑</span>
		</div>
         <div><h5>字体类型</h5>
		<span class="t-x" data-ysl="font-style:'italic'">斜体</span>
		<span class="t-h" data-ysl="font-weight:'bold'">加粗</span>
		</div>
		<div><h5>字体颜色</h5>
		<span class="bg-white" data-ysc="font-color:'white'">白色</span>
		<span class="bg-red" data-ysc="font-color:'red'">红色</span>
		<span class="bg-green" data-ysc="font-color:'green'">绿色</span>
		<span class="bg-blue" data-ysc="font-color:'blue'">蓝色</span>
		<span class="bg-yellow" data-ysc="font-color:'yellow'">黄色</span>
	</div>
	<div><h5>字体大小</h5>
		<span class="t-xs" data-yss="font-size:'10px'">小</span>
		<span class="t-sm" data-yss="font-size:'12px'">正常</span>
		<span class="t-md" data-yss="font-size:'14px'">中</span>
		<span class="t-lg" data-yss="font-size:'16px'">大</span>
	</div>
	</dd>
	</dl>
    <div class="wzlogo">
    <input type="text" placeholder="最多20个字符,包含数字,字母,中文,符号" class="ttext"/>   
    <button class="glyphicon glyphicon-remove"></button>
    <button class="glyphicon glyphicon-ok"></button>
      <button class=" btn btn-info" onClick="hecheng()" >查看定制椅子</button>
     </div>
	</div>

<div id="imgBox" align="center">
</div>
</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.bxslider.min.js"></script>
<script>
$(function(){
	console.log("${ftpImageUrl }");
	$('.bxslider').bxSlider();
	var textstyle;
	$('.choose-zt span').click(function(){
		$(this).addClass('active').siblings().removeClass('active');
		var ys=$(this).data('ys');
		var ysl=$(this).data('ysl');
		var ysc=$(this).data('ysc');
		textstyle=$(this).data('ys');
		console.log(textstyle);
		
		
	})
	$('.glyphicon-ok').click(function(){
		var text=$(this).prevAll('input').text();
		$('.bei').append('<span>'+text+'</span>')
	})
	$('.glyphicon-remove').click(function(){
		$('.bei').find('span').text('');
		$(this).prevAll('input').text('');
	})
	$(".imgfile").on("change",function(){
		var wz=$(this).data('wz');
		var img_logo = $(this).val();
		if(img_logo != null){
			var filetype = img_logo.substring(img_logo.lastIndexOf("."));
			if(filetype == '.jpg' || filetype == '.png'){
				var url=window.URL.createObjectURL(this.files[0]);
				 $(this).next().attr("src",url);
				 $('#source').attr("src",url);
			}else{
				alert("只能上传.jpg或.png的图片格式");
			}
		}
		
	})
	$(".save").on("click", function(){
		debugger;
		var yl=$(this).data("ylogo");
		draw1(yl);
		var id = $('#table input[name="btSelectItem"]:checked').val();
		$("#order_id").val(id);
		var form = $("#imgform");
		var formData = new FormData($(form)[0]); 
		return false;
/* 	    $.ajax({  
	    	 url : ctx+"/servlet/order/upload",  
	         type: 'POST',  
	         data: formData,  
	         async: true,  
	         cache: false,  
	         contentType: false,  
	         processData: false,  
	         success: function (data) {
	        	 if(data.code=="success"){
	        		 $("#closeModal").click();
	        		 bootbox.alert("上传成功");
	        		 $("#table").bootstrapTable('refresh');
	        		 $('#imgform img').attr('src',$('#imgform img').data("src"));
	                 TableObj.oTableInit();
	        	 }else{
	        		 alert(data.message);
	        	 }
	         },  
	         error: function (data) { 
	        	 alert("上传失败");
	         }  
	    });   */
	});
	

}); 
function hecheng(){
	draw1(function(){
		document.getElementById('imgBox').innerHTML='<p style="padding:10px 0">合成图片成功！可以鼠标另存图片查看我是否是一张图片~~！</p><img src="'+base64[0]+'">';
	})
}
function convertCanvasToImage(canvas) {
       var hc_image = new Image();
          hc_image.setAttribute('crossOrigin', 'anonymous');
 var img3=$('#cd-main').attr('src');
var data=[img3,img1],base64=[];
	var c=document.createElement('canvas'),
		ctx1=c.getContext('2d'),
		len=data.length;
	c.width=600;
	c.height=600;
	ctx1.rect(0,0,c.width,c.height);
	ctx1.fillStyle='#fff';
	ctx1.fill();
	function drawing(n){
		if(n<len){
			var img=new Image;
			img.crossOrigin = 'Anonymous'; //解决跨域
			img.src=data[n];
	 	if(n==0){
				img.onload=function(){
					ctx1.drawImage(img,0,0,600,600);
					drawing(n+1);
				}
			}else if(n==1){
				img.onload=function(){
					ctx1.drawImage(img,255,130,60,60);
					drawing(n+1);
				}
			}
			else{
				img.onload=function(){
					ctx1.drawImage(img,225,365,120,40);
					drawing(n+1);
				}
			} 
			
		}else{
			//保存生成作品图片
			convertCanvasToImage(c);
            Canvas2Image.saveAsJPEG(c);
			fn();
		}
	}
	drawing(0);
}
</script>
</body>
</html>