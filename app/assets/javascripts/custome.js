var datatable;
datatable = function(){
  $('#datatable').dataTable();
}
$(document).ready(datatable);
$(document).on('page:load',datatable);

function flash_msg(msg, type) {
    setTimeout(function() {
        toastr.options = {
            closeButton: true,
            showMethod: 'slideDown',
            timeOut: 3000
        };

        if (type == 'error'){
          toastr.error(msg);
        }else{
          toastr.success(msg);
        }

    }, 1000);
}