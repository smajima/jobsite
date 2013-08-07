# Zipcode to Address
$ ->
  $('#zipconv').on 'click', ->
    zipcode = $("input.zipcode").val()
    $.ajax
      url:'http://zipcloud.ibsnet.co.jp/api/search'    
      type:'GET'
      crossDomain:true
      data:{zipcode: zipcode}
      dataType:"jsonp"
      success:
        (data) ->
          if data.status != 200
            return

          size = data.results.length
          result = data.results[0]
          if size == 1
            $('.pref_code').val(result.prefcode)
            $('input.address0').val(result.address2)
            $('input.address1').val(result.address3)
          else
            $('.pref_code').val(result.prefcode)
            $('input.address0').val(result.address2)


    