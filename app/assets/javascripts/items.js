$(document).on('turbolinks:load',(function(){
  $(function(){
    var index = [1,2,3,4,5,6,7,8,9,10];
    $(".flexbox").on("click", ".delete-btn", function(){
      var targetIndex = Number($(this).attr("index"));
      index.push(targetIndex);
      if($(this).parent().parent().attr("class") == "new-wrapper__main__preview-first"){
        $(".new-wrapper__main__preview .new-wrapper__main__preview__image:first").appendTo(".new-wrapper__main__preview-first");
      }
      if(index.length > 5){
        $(".new-wrapper__main__image-field").css("width",(index.length-5)*124);
      }else if(index.length == 5){
        $("#image-field-second").remove();
        $(".new-wrapper__main__preview").remove();
        $(".new-wrapper__main__preview-first").attr("class", "new-wrapper__main__preview");
        $(".new-wrapper__main__image-field").css("display","flex");
      }else if(index.length == 0){
        $("#image-field-second").css("display","flex");
        $("#image-field-second").css("width",index.length*124);
      }else{
        $("#image-field-second").css("width",index.length*124);
      }
      $("#image-wrapper").attr("for",`item_images_attributes_${targetIndex}_image`);
      $(this).parent().remove();
      $(`#item_images_attributes_${targetIndex}_image`).remove();
      $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${targetIndex}][image]" id="item_images_attributes_${targetIndex}_image">`);
    })
    var buildImage = function(url){
      if(index.length != 0){
        $(".new-wrapper__main__preview").append(`
          <div class="new-wrapper__main__preview__image">
          <img class="new-wrapper__main__preview__image__img" src="${url}">
          <div class="delete-btn" index=${index[0]}><i class="far fa-times-circle"></i></div>
        `);
        $(".flexbox").append(`<input class="file-field" type="file" name="item[images_attributes][${index[1]}][image]" id="item_images_attributes_${index[1]}_image">`);
        $("#image-wrapper").attr("for",`item_images_attributes_${index[1]}_image`);
        index.shift();
        if(index.length > 5){
          $("#image-field-second").remove();
          $(".new-wrapper__main__image-field").css("display","flex");
          $(".new-wrapper__main__image-field").css("width",(index.length-5)*124);
        }else if(index.length == 5){
          $(".new-wrapper__main__image-field").css("display","none");
          $("#image-wrapper").append(`
            <div class="new-wrapper__main__image-field" id="image-field-second">
              <i class="fas fa-camera"></i>
              <div class="new-wrapper__main__image-field__text">
                ドラッグアンドドロップ
                <br>
                またはクリックしてファイルをアップロード
              </div>
            </div>
          `);
          $(".new-wrapper__main__preview").attr("class", "new-wrapper__main__preview-first");
          $(".new-wrapper__main__preview-first").after(`<div class="new-wrapper__main__preview"></div>`);
        }else if(index.length == 0){
          $("#image-field-second").css("display","none");
        }
        $("#image-field-second").css("width",index.length*124);
      }
    }
    $(".flexbox").on("change", function(e){
      var blob = window.URL.createObjectURL(e.target.files[0]);
      buildImage(blob);
    })
  })
}))