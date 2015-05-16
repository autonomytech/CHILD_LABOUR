var datatable;
datatable = function(){
  $('#datatable').dataTable({
    "order": [[1, 'desc']]
  });
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

function child_labour_year_wise_report(){
  var y = { year: $('#date_year').val()};
  $.get('/reports/child_labour_year_wise_report',y, function(){});
}

function child_begger_year_wise_report(){
  var y = { year: $('#date_year').val()};
  $.get('/reports/child_begger_year_wise_report',y, function(){});
}