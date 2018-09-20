jQuery ->
  models = $('#quote_quote_vehicles_attributes_0_model_id').html()
  # console.log(models)
  $('#quote_quote_vehicles_attributes_0_brand_id').change ->
    brand = $('#quote_quote_vehicles_attributes_0_brand_id :selected').text()
    options = $(models).filter("optgroup[label='#{brand}']").html()
    console.log(options)
    if options
      $('#quote_quote_vehicles_attributes_0_model_id').html(options)
      $('#quote_quote_vehicles_attributes_0_model_id').parent().show()
    else
      $('#quote_quote_vehicles_attributes_0_model_id').empty()
