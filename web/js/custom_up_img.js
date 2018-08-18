$(document).ready(function(){$("#up-img-touch").click(function(){$("#up-modal-frame").modal({});
});
});
$(function(){'use strict';
    var $image=$('#up-img-show');
    $image.cropper({aspectRatio:'1',autoCropArea:0.8,preview:'.up-pre-after',responsive:true,});
    var $inputImage=$('.up-modal-frame .up-img-file');
    var URL=window.URL||window.webkitURL;
    var blobURL;
    if(URL){$inputImage.change(function(){var files=this.files;
        var file;
        if(files&&files.length){file=files[0];
            if(/^image\/\w+$/.test(file.type)){blobURL=URL.createObjectURL(file);
                $image.one('built.cropper',function(){URL.revokeObjectURL(blobURL);
                }).cropper('reset').cropper('replace',blobURL);
                $inputImage.val('');
            }else{window.alert('Please choose an image file.');
            }}});
    }else{$inputImage.prop('disabled',true).parent().addClass('disabled');
    }
    $('.up-modal-frame .up-btn-ok').on('click',function(){

        var $modal_loading=$('#up-modal-loading');

        var $modal_alert=$('#up-modal-alert');

        var img_src=$image.attr("src");

        if(img_src=="")
        {set_alert_info("没有选择上传的图片");

            $modal_alert.modal();
            return false;
        }
        $modal_loading.modal();

        var url=$(this).attr("url");

        var parameter=$(this).attr("parameter");

        var parame_json=eval('('+parameter+')');

        var width=parame_json.width;

        var height=parame_json.height;
        console.log(parame_json.width);
        console.log(parame_json.height);


        var canvas=$image.cropper('getCroppedCanvas',{width:width,height:height});
        var data=canvas.toDataURL();
        var fd=new FormData();
        fd.append("img",data);
        $.ajax({
            url:url,
            type:"POST",
            contentType: false,
            processData: false,
            data:fd,

            success:function(datas,textStatus){
                $modal_loading.modal('close');
                set_alert_info(data.result);
                $modal_alert.modal();
                if(data=="ok"){
                    $("#up-img-touch img").attr("src",data.file);
                    var img_name=data.file.split('/')[2];
                    $(".up-img-txt a").text(img_name);
                    $("#up-modal-frame").modal('close');
                }},
            error:function(){
                $modal_loading.modal('close');

                set_alert_info("上传文件失败了！");
                $modal_alert.modal();
            }});


       /* $.ajax({
            url:url,
            dataType:'json',
            type:"POST",
            contentType: false,
            processData: false,
            data:{"image":data.toString()},
            success:function(data,textStatus){
                $modal_loading.modal('close');
                set_alert_info(data.result);
                $modal_alert.modal();
                if(data=="ok"){
                    $("#up-img-touch img").attr("src",data.file);
                    var img_name=data.file.split('/')[2];
                    $(".up-img-txt a").text(img_name);
                    $("#up-modal-frame").modal('close');
                }},
            error:function(){
                $modal_loading.modal('close');

                set_alert_info("上传文件失败了！");
                $modal_alert.modal();
            }});*/
    });
    $('#up-btn-left').on('click',function(){$("#up-img-show").cropper('rotate',90);
    });
    $('#up-btn-right').on('click',function(){$("#up-img-show").cropper('rotate',-90);
    });
});
function set_alert_info(content){$("#alert_content").html(content);
}