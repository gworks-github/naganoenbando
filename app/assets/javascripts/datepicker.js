ready = ->
  dateFormat = 'yy-mm-dd';
  $('.date-picker').datepicker(
    dateFormat: 'yy-mm-dd',
    // 2017-08-15以降を選択可能
    minDate: new Date(2017, 8 - 1, 15),
    // 2017-10-15まで選択可能
    maxDate: new Date(2017, 10 - 1, 15),
  );
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
