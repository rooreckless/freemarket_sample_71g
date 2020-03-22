$(function(){
  function appendOption(category){
    var html = `<option name="product[category_id]" value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='formBox__select' id='categorySelect2'>
    <select class="listing-select-wrapper__box--select2" id='parent_category2' name="product[category_id]"><option value="---">---</option>
    ${insertHTML}
    </select>
    </div>`;
    $('#categorySelect1').after(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='formBox__select' id='categorySelect3'>
    <select class="listing-select-wrapper__box--select3" id='parent_category3' name="product[category_id]"><option value="---">---</option>
    ${insertHTML}
    </select>
    </div>`;
    $('#categorySelect2').after(grandchildSelectHtml);
  }

  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; 
    if (parentCategory != "---"){ 
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#categorySelect2').remove();
        $('#categorySelect3').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#categorySelect2').remove();
      $('#categorySelect3').remove();
    }
  });


  $('#categorySelect__box').on('change', '#parent_category2', function(){
    var childId = $('#parent_category2 option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#categorySelect3').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#categorySelect3').remove();
    }
  });
});