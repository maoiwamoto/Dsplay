$(function(){
    
    const hoge = $('#input_text');
    const piyo = $('#counter');
    const mofu = $('#limit');
    const maxLength = mofu.data("count");
    let countNum = String(hoge.val().length);
    piyo.text(countNum + "文字");
    mofu.text(maxLength + "文字");
    
 hoge.on("keyup", function() {
   let countNum = String($(this).val().length);
      // 現在の文字数と最大文字数を比較して、
   // 現在の文字数が多ければ赤く表示する
    if ( parseInt(countNum) > parseInt(maxLength) ) {
      piyo.text(countNum + "文字").css('color','red');
    } else {
        piyo.text(countNum + "文字").css('color','inherit');
    }
 });
 
});