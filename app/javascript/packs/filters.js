import $ from 'jquery';

$(document).on('turbolinks:load', function() {
  $("#filter-internal-id").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#inventory-table tbody tr").filter(function() {
      $(this).toggle($(this).find('td').eq(2).text().toLowerCase().indexOf(value) > -1);
    });
  });

  $("#filter-availability").on("change", function() {
    var value = $(this).val();
    $("#inventory-table tbody tr").filter(function() {
      $(this).toggle($(this).find('td').eq(3).text() === value || value === "");
    });
  });
});
