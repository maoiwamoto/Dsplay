$(function(){
    
    function countInputText(input) {
        const piyo = $(input).next('p').find('#counter');
        const mofu = $(input).next('p').find('#limit');
        const maxLength = mofu.data("count");
        let countNum = String($(input).val().length);
        piyo.text(countNum + "文字");
        mofu.text(maxLength + "文字");
    }
    
      // ページ表示時に文字数をカウントして表示
  $("input#input_text,textarea#input_text").each(function(){
    countInputText($(this));
  });
  
    // フォーム入力時に文字数をカウントして表示
  $("input#input_text,textarea#input_text").on('keyup',function(){
       let countNum = String($(this).val().length);
       const thisCounter = $(this).next('p').find('#counter');
       const thisLimit = thisCounter.next('span#limit').data('count');
     // 現在の文字数と最大文字数を比較して、
   // 現在の文字数が多ければ赤く表示する
    if ( parseInt(countNum) > parseInt(thisLimit) ) {
      thisCounter.text(countNum + "文字").css('color','red');
    } else {
        thisCounter.text(countNum + "文字").css('color','inherit');
    }
  });
 
});