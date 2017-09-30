$(function() {
  if($('#create-brand-account-page').length > 0) {
    uploadConfig('#user_company_logo', '#image-preview', '#image-label');
    uploadConfig('#user_company_images_0', '#upload-company-img0', '#upload-company-img0 label');
    uploadConfig('#user_company_images_20', '#upload-product-img20', '#upload-product-img20 label');
    var $addCompanyImgBtn = $('#add-company-img');
    var $addProductImgBtn = $('#add-product-img');

    $addCompanyImgBtn.on('click', function() {
      var $lastImgForm = $('#company-images .image-form').last();
      var lastFormOrder = parseInt($lastImgForm.data('order'));
      var newFormOrder = lastFormOrder + 1;
      var newFormId = 'upload-company-img' + newFormOrder;
      var $newForm = $lastImgForm.clone();
      $newForm.attr('data-order', newFormOrder);
      $newForm.attr('id', newFormId);
      $newForm.attr('style', 'background-image: url("")');
      $newForm.find('input[type="file"]').attr('name', 'user[company_images_attributes][' + newFormOrder  + '][product_image]');
      $newForm.find('input[type="hidden"]').first().attr('name', 'user[company_images_attributes][' + newFormOrder  + '][image_type]');
      $newForm.find('input[type="hidden"]').last().attr('name', 'user[company_images_attributes][' + newFormOrder  + '][position]');
      $lastImgForm.after($newForm);
      var newFormInputField = '#' + newFormId + ' input[type="file"]';
      var newFormPreviewBox = '#' + newFormId;
      var newFormLabelField = '#' + newFormId + ' label';
      uploadConfig(newFormInputField, newFormPreviewBox, newFormLabelField);
      $('.remove-img i').on('click', function() {
        $(this).closest('.image-form').remove();
      });
    });

    $addProductImgBtn.on('click', function() {
      var $lastImgForm = $('#product-images .image-form').last();
      var lastFormOrder = parseInt($lastImgForm.data('order'));
      var newFormOrder = lastFormOrder + 1;
      var newFormId = 'upload-product-img' + newFormOrder;
      var $newForm = $lastImgForm.clone();
      $newForm.attr('data-order', newFormOrder);
      $newForm.attr('id', newFormId);
      $newForm.attr('style', 'background-image: url("")');
      $newForm.find('input[type="file"]').attr('name', 'user[company_images_attributes][' + newFormOrder  + '][product_image]');
      $newForm.find('input[type="hidden"]').first().attr('name', 'user[company_images_attributes][' + newFormOrder  + '][image_type]');
      $newForm.find('input[type="hidden"]').last().attr('name', 'user[company_images_attributes][' + newFormOrder  + '][position]');
      $lastImgForm.after($newForm);
      var newFormInputField = '#' + newFormId + ' input[type="file"]';
      var newFormPreviewBox = '#' + newFormId;
      var newFormLabelField = '#' + newFormId + ' label';
      uploadConfig(newFormInputField, newFormPreviewBox, newFormLabelField);
      $('.remove-img i').on('click', function() {
        $(this).closest('.image-form').remove();
      });
    });

    $('#search-address').click(function() {
      var zipcode = $('#zipcode').val();
      var prefecture = $('#prefecture').val();
      var city = $('#city').val();
      var town = $('#town').val();
      $.ajax({
        type: 'GET',
        url: '/zipcode',
        data: {zipcode: zipcode, prefecture: prefecture, city: city, town: town}
      })
        .done(function(data) {
          if(data && data.zipcode) {
            $('#zipcode').val(data.zipcode);
          } else if(data) {
            $('#prefecture').val(data.prefecture);
            $('#city').val(data.city);
            $('#town').val(data.town);
          }
        });
    });
  }

  function uploadConfig(inputField, previewBox, labelField) {
    $.uploadPreview({
      input_field: inputField,
      preview_box: previewBox,
      label_field: labelField,
      label_default: 'Choose File',
      label_selected: '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>',
      no_label: false
    });
  }
});
