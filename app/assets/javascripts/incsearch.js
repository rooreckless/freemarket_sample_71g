function buildSearchHTML(data){
  // ajax通信後のdataをhtmlにまぜて返します。
  var returnHTML=``;
  for (var i=0;i<data.products.length;i++){
    returnHTML+=
    `<a class="#" href="/products/${data.products[i].id}">
      <div class="fifthContent__list searchList">
        <div class="fifthContent__list--image">
          <image src="${data.images[i].image.url}">
        </div>
        <div class="fifthContent__list--underBox">
          <div class="itemName">
            ${data.products[i].name}
          </div>

          <div class="itemInformations">
            <div>
            ${data.products[i].price}
            円
            </div>
            <div>
            <i class="fa fa-star likeIcon"></i>
            ０
            </div>
            <div>
            出品者 ${data.salerusers[i].nikname} さん
            </div>
          </div>
          <div>
          (税込み)
          </div>
        </div>
      </div>
    </a>`;
  }
  return returnHTML;
  
}
$(function(){
  $('#result_form').on('keyup', function(e){
    // フォーム内で、キーが押されれば発火します。
    e.preventDefault();
    //ajax通信ではフォームの内容をまるごとわたします。(ある意味でhtml版と同じ感覚で)それでもparams(:content)で同様に入力値だけ引き出せます。
    // どうしても入力値だけ渡したいならdocument.getElementById("content").valueです。
    var formData = new FormData(this);
    //ajax通信でのdata(フォーム)の渡し先をフォームのaction値と同じにしたのでhtml版と同じになります。
    var url = $(this).attr('action');
    //ajax通信開始
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      // ajax通信完了後ですが、条件分岐します。
      // もし入力値が「なにもない」か「空白だけ」の場合と、検索結果がない場合と、検索できた場合に分けます。
      if($("#content").val().length==0 || $("#content").val()==" " ||$("#content").val()=="　"){
        var html='出品された商品名で検索いたします。入力をお願いいたします。'
      }else if (data.products.length > 0){
        // 検索できた場合はメソッドにてデータを加工してもらいます。
        var html=buildSearchHTML(data);
      }else{
        // 検索結果がない
        var html='出品された商品名で検索しておりますが、該当するものがございませんでした。'
      }
      // 各場合
      $('.searchLists').html(html);
      // インクリメンタルサーチだからボタンを再度押せるようにする必要はないのですが、この書き方で可能です。
      $('.searchBox__submit').prop("disabled", false);
    }).fail(function(){
      alert("error");
    });
  })
})