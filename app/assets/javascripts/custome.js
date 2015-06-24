var datatable, tokeninput;
datatable = function(){
  $('#datatable').dataTable({
    "order": [[1, 'desc']],
    oLanguage: {
      sLengthMenu: '_MENU_ नोंदण्या दाखवा',
      sInfo: '_TOTAL_ पैकी _START_ ते _END_ नोंदण्या दर्शवित आहे',
      sInfoFiltered: '',
      sInfoEmpty: 'कोणतीही नोंदणी नाही',
      sEmptyTable: 'टेबल मध्ये कोणताही डेटा उपलब्ध नाही',
      sZeroRecords: 'कोणतेही जुळणारे रेकॉर्ड सापडले नाही',
      sSearch: 'शोधा',
      sSearchPlaceholder: "शोधण्यासाठी टाइप करा",
      oPaginate: {
        sFirst: 'पहिले पृष्ठ',
        sPrevious: 'मागील पृष्ठ',
        sNext: 'पुढील पृष्ठ',
        sLast: 'अंतिम पृष्ठ'
      }
    }
  });
}

tokeninput = function(){
  $("#involve_member").tokenInput("/users.json", 
    {propertyToSearch: "full_name",
     preventDuplicates: true,
     hintText: "शोधण्यासाठी टाइप करा",
     noResultsText: "कोणतेही रेकॉर्ड आढळले नाही",
     searchingText: "शोधत आहे..."});
}

$(document).ready(datatable);
$(document).on('page:load',datatable);
$(document).ready(tokeninput);
$(document).on('page:load',tokeninput);

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

function show_hidden_data(id, array, type, arrays){
  if(type == 'law'){
    if($('.law_' + id).hasClass('checked')){
      $('.law_' + id).removeClass('checked');
      $('.law_data_' + id).addClass('hidden');
      array.forEach(function(i) {
        $('.act_' + i).prop('checked', false);
        $('.act_' + i).removeClass('checked');
        $('.act_data_' + i).addClass('hidden');
      });
      arrays.forEach(function(j) {
        $('.section_' + j).prop('checked', false);
      });
    }else{
      $('.law_' + id).addClass('checked')
      $('.law_data_' + id).removeClass('hidden');
    }
  }else{
    if($('.act_' + id).hasClass('checked')){
      $('.act_' + id).removeClass('checked');
      $('.act_data_' + id).addClass('hidden');
      array.forEach(function(i) {
        $('.section_' + i).prop('checked', false);
      });
    }else{
      $('.act_' + id).addClass('checked')
      $('.act_data_' + id).removeClass('hidden');
    }
  }
}

function selectAll(){
  $('.check_box').prop('checked', true);
}

function unselectAll(){
  $('.check_box').prop('checked', false);
}

function getval(){
  var checkboxes = document.getElementsByName('child');    
  var checkboxesChecked = [];
  // loop over them all
  for (var i=0; i<checkboxes.length; i++) {
     // And stick the checked ones onto an array...
    if (checkboxes[i].checked) {
      checkboxesChecked.push(checkboxes[i].value);
    }
  }
  window.open('/reports/get_child_labour?childs='+checkboxesChecked);
}

document.addEventListener("DOMContentLoaded", function() {
    var elements = document.getElementsByTagName("INPUT");
    for (var i = 0; i < elements.length; i++) {
        elements[i].oninvalid = function(e) {
            e.target.setCustomValidity("");
            if (!e.target.validity.valid) {
                e.target.setCustomValidity("हे फील्ड रिक्त सोडले जाऊ शकत नाही");
            }
        };
        elements[i].oninput = function(e) {
            e.target.setCustomValidity("");
        };
    }
});

function show_hidden_field(type) {
  if(type == 'adhar_card'){
    if($('#employer_is_adhar_card').hasClass('checked')){
      $('#employer_is_adhar_card').removeClass('checked');
      $('#employer_adhar_card').addClass('hidden');
      $('#employer_adhar_card').val('');
    }else{
      $('#employer_is_adhar_card').addClass('checked');
      $('#employer_adhar_card').removeClass('hidden');
    }
  }else if (type == 'voter_card'){
    if($('#employer_is_voter_card').hasClass('checked')){
      $('#employer_is_voter_card').removeClass('checked');
      $('#employer_voter_card').addClass('hidden');
      $('#employer_voter_card').val('');
    }else{
      $('#employer_is_voter_card').addClass('checked');
      $('#employer_voter_card').removeClass('hidden');
    }
  }else{
    if($('#employer_is_pan_card').hasClass('checked')){
      $('#employer_is_pan_card').removeClass('checked');
      $('#employer_pan_card').addClass('hidden');
      $('#employer_pan_card').val('');
    }else{
      $('#employer_is_pan_card').addClass('checked');
      $('#employer_pan_card').removeClass('hidden');
    }
  }
}
