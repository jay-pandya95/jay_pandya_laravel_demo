$(document).ready(function(){


  init_datatable()

    // if($('#product_table').length > 0) {
    //   $('#product_table').DataTable();
    // }

    init_validation();

    $(document).on('click','.search',function(){
      init_datatable()
    });

    $(document).on('click','.reset',function(){
      $('.min_price').val('');
      $('.max_price').val('');
      $('.stock').val('');
      init_datatable()
    });

    
});

function init_datatable() {
  if($('.product_table').length > 0) {

    var min_price = $('.min_price').val();
    var max_price = $('.max_price').val();
    var stock = $('.stock').val();

    $('.product_table').DataTable( {
      "destroy": true,
      "processing": true,
      "serverSide": true,
      "ajax" : {
        url : url+'/product', 
        type: "post",
        data: {
          _token: token,
          min_price : min_price,
          max_price: max_price,
          stock : stock,
        },
        order: [[0, 'desc']],
        columns: [
            { data: 'product_id', name: 'product_id' },
            { data: 'name', name: 'name' },
            { data: 'shop', name: 'shop' },
            { data: 'price', name: 'price' },
            { data: 'stock', name: 'stock' },
            { data: 'manage', name: 'manage' },
        ],
      }

    });
  }
}

function init_validation() {
  if($('#product_form').length > 0) {
    $('#product_form').validate({  
        rules: {  
          name: 'required',  
          shop_id : {
            required: true,
            remote: {
              url: url+'/product/duplicate',
              type: "post",
              data: {
                _token : token,
                name : function() {
                  return $( "#name" ).val();
                },
                product_id : $('.product_id').val(),
                shop_id: function() {
                  return $( ".shop_id" ).val();
                },
              }
            } 
          },  
          price: 'required',  
          stock: 'required',  
        },  
        messages: {  
          shop_id: {
            required: 'This field is required',
            remote: 'Product already added in this shop'
          },  
          name: 'This field is required',  
          price: 'This field is required',  
          stock: 'This field is required',  
        },  
      });  
  }
}