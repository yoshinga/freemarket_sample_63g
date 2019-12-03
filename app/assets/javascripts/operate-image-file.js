$(document).on("turbolinks:load", function() {

  let labelForInputTag = $(".items-contents__box__image__upload__image-label");
  let parentOfInputTag = $(".items-contents__box__image__upload");
  let count = 0

  // inputタグを追加する関数
  let addFileFeild = (count) => {
    let inputTag = `
                  <input class="items-contents__box__image__upload__image-label__file-field" type="file" name="item[images_attributes][${count}][url]" id="item_images_attributes_${count}_url">
                ` 

    parentOfInputTag.append(inputTag);
  }

  // 画像が一枚アップロードされるたびに発火するイベント(アップロードする画像が11枚以上になったら処理は行われない)
  $(document).on('change', '.items-contents__box__image__upload__image-label__file-field', function() {
   
    count = count + 1

    if (count <= 9) {

      labelForInputTag.attr("for", `item_images_attributes_${count}_url`);
      addFileFeild(count);

    } else {

    }

  });

});