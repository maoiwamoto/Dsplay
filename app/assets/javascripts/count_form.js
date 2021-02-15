$(function(){
    
    const hoge = $('#input-text');
    const piyo = $('#counter');
    let countNum = String(hoge.val().length);
    piyo.text(countNum + "文字");
    
 hoge.on("keyup", function() {
   let countNum = String(hoge.val().length);
   piyo.text(countNum + "文字");
 });
 
});