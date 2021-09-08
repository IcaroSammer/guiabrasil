import $ from 'jquery';
import datepickerFactory from 'jquery-datepicker';
import datepickerPTBRFactory from 'jquery-datepicker/i18n/jquery.ui.datepicker-pt-BR';

// Just pass your jquery instance and you're done
datepickerFactory($);
datepickerPTBRFactory($);

$(function() {
  $('#datepicker').datepicker();
  $.datepicker.regional['pt-BR'];
});