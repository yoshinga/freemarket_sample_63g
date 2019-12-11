$(window).on("turbolinks:load", function() {

  let labelForInputTag = $(".items-contents__box__image__upload__edit__image-label");
  let inputTag = $(".items-contents__box__image__upload__edit__image-label__file-field");
  let parentOfInputTag = $(".items-contents__box__image__upload__edit"); 
  let willUpLoadUl = $("#will-upload-ul-edit"); //5まいまで
  let willUploadUl2 = $("#will-upload-ul2-edit"); //6まい目から
  console.log(inputTag)
  let count = 0

  // 登録済画像と新規追加画像を全て格納する配列（ビュー用）
  // let images = [];
  // 登録済画像データだけの配列（DB用）
  // let registered_images_ids = [];
  // 新規投稿画像データだけの配列（DB用）
  // let new_images_ids = [];

  // 登録済み画像のプレビュー表示
  gon.images.forEach(function(image, index){
    console.log(image)
    console.log(image.url)
    console.log(image.url.url)
    console.log(index)
    // count = index + 1
    // let inputTag2 = `
    //               <input class="items-contents__box__image__upload__edit__image-label__file-field" type="file" name="item[images_attributes][${index}][url]" id="item_images_attributes_${index}_url">
    //             `
    // parentOfInputTag.append(inputTag2);
    // labelForInputTag.attr("for", `item_images_attributes_${count}_url`)
    // inputTag.attr("id", `item_images_attributes_${count}_url`)
    // inputTag.attr("name", `item[images_attributes][${count}][url]`)
    // console.log(count)
    let img = ` <li class="li">
                    <div class="img-wrap">
                      <img class="img" src="${image.url.url}"></img>
                    </div>
                    <div class="flex">
                      <a class="edit-or-delete">編集</a>
                      <a class="edit-or-delete">削除</a>
                    </div>
                  </li>`

    willUpLoadUl.append(img)
    // カスタムデータ属性を付与
    // img.data("image", index);
    // binary_data = gon.images_binary_datas

    // 表示するビューにバイナリバイナリーデータを付与
    // img.find("img").attr({
    //   src: "data:image/jpeg;base64,"
  });
    // console.log(binary_data)
    // 登録済画像のビューをimagesに格納
    // images.push(img);
    // registered_images_ids.push(image.id);
// });
  

  if (images.length <= 4) {
    $('#will-upload-ul-edit').empty();
    $.each(images, function (index, image) {
      image.data('image', index)
      willUpLoadUl.append(image)
    });
    labelForInputTag.css({
      'width': `calc(100% - (20% * ${images.length}))`
    });
  };

  // inputタグを追加する関数
  let addFileFeild = (count) => {
    let inputTag = `
                  <input class="items-contents__box__image__upload__edit__image-label__file-field" type="file" name="item[images_attributes][${count}][url]" id="item_images_attributes_${count}_url">
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
  $(document).on('change', '.items-contents__box__image__upload__edit__image-label__file-field', function () {
    let inputTag = $(".items-contents__box__image__upload__edit__image-label__file-field");

    console.log(count)
    console.log(inputTag)
    console.log(inputTag[0])
    console.log(inputTag[0].files[0])

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
