$(document).on('turbolinks:load', function(){
    
const imgModal = $('<div id="img_modal">');
const bgArea = $('<div id="img_modal_bg">');
const imgArea = $('<div id="img_modal_body">');
const zoomImg = $('<img id="zoom_img">');
const closeIcon = $('<span id="close_icon"></span>');
    

    $('body').append(imgModal);
    imgModal.append(bgArea,imgArea);
    imgArea.append(zoomImg);
    imgModal.append(closeIcon);
    imgModal.remove();

$(".main_img_area img").click(function(){
    const thisImg = $(this).attr('src');
    zoomImg.attr({src:thisImg});
    $('body').append(imgModal);
    
    bgArea.add(closeIcon).click(function(){
       imgModal.remove(); 
    });
    
    
    });

    
});