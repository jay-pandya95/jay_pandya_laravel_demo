$(document).ready(function(){

    if($('#shop_table').length > 0) {
      $('#shop_table').DataTable();
    }


    if($('#shop_form').length > 0) {
      $('#shop_form').validate({  
          rules: {  
            name: 'required',  
            address: 'required',  
            email: {  
              required: true,  
              email: true, 
              remote: {
                url: url+'/shop/duplicate',
                type: "post",
                data: {
                  email: function() {
                    return $( ".email" ).val();
                  },
                   _token : token,
                   shop_id : $('#shop_id').val(),
                }
              } 
            },  
          },  
          messages: {  
            name: 'This field is required',  
            address: 'This field is required',  
            email: {
              required: 'This field is required',
              email: 'enter valid email address',
              remote: 'Email already exists'
            }
          },  
        });  
    }
});