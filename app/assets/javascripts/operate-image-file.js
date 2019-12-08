$(document).on("turbolinks:load", function() {

  let labelForInputTag = $(".items-contents__box__image__upload__image-label");
  let parentOfInputTag = $(".items-contents__box__image__upload");
  let willUpLoadUl = $("#will-upload-ul");
  let willUploadUl2 = $("#will-upload-ul2");
  let count = 0

  // inputタグを追加する関数
  let addFileFeild = (count) => {
    let inputTag = `
                  <input class="items-contents__box__image__upload__image-label__file-field" type="file" name="item[images_attributes][${count}][url]" id="item_images_attributes_${count}_url">
                ` 
    parentOfInputTag.append(inputTag);

    if (count <= 5) {

      willUpLoadUl.addClass(`width${count}`);
      labelForInputTag.addClass(`width-for-label${count}`);

    } else if (count >= 6) {

      willUploadUl2.addClass(`width${count}`);
      labelForInputTag.addClass(`width-for-label${count}`);

    }
  }

  let previewFile = (url, count) => {

    reader = new FileReader();

    if (count <= 5) {
      reader.onload = function (e) {
        let imageTag = `
                        <li class="li">
                          <div class="img-wrap">
                            <img src="${e.target.result}" class="img"></img>
                          </div>
                          <div class="flex">
                            <a class="edit-or-delete">編集</a>
                            <a class="edit-or-delete">削除</a>
                          </div>
                        </li>
                        `
        willUpLoadUl.append(imageTag);
      }
    } else if (count >= 6) {
      reader.onload = function (e) {
        let imageTag = `
                        <li class="li">
                          <div class="img-wrap">
                            <img src="${e.target.result}" class="img"></img>
                          </div>
                          <div class="flex">
                            <a class="edit-or-delete">編集</a>
                            <a class="edit-or-delete">削除</a>
                          </div>
                        </li>
                        `
          willUploadUl2.append(imageTag);
      }
    }

    reader.readAsDataURL(url);

  }
  

  // 画像が一枚アップロードされるたびに発火するイベント(アップロードする画像が11枚以上になったら処理は行われない)
  $(document).on('change', '.items-contents__box__image__upload__image-label__file-field', function() {
    let inputTag = $(".items-contents__box__image__upload__image-label__file-field");
   
    count = count + 1

    if (count <= 9) {

      labelForInputTag.attr("for", `item_images_attributes_${count}_url`);
      let url = inputTag[count - 1].files[0]
      
      previewFile(url, count);
      addFileFeild(count);

    } else if (count = 10) {

      labelForInputTag.attr("for", `item_images_attributes_${count}_url`);
      let url = inputTag[count - 1].files[0]
      
      previewFile(url, count);
      addFileFeild(count);
      labelForInputTag.addClass("hide-display");

    } else {

    }

  });

});