(function($) {
  $.fn.inputFilter = function(inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
      if (inputFilter(this.value)) {
        this.oldValue = this.value;
        this.oldSelectionStart = this.selectionStart;
        this.oldSelectionEnd = this.selectionEnd;
      } else if (this.hasOwnProperty("oldValue")) {
        this.value = this.oldValue;
        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
      } else {
        this.value = "";
      }
    });
  };
}(jQuery));

$('#numberonly').focusout(function(){
  var numberonly = Number.parseInt($('#numberonly').val());
  if (Number.isInteger(numberonly) == true ){
    
    if (numberonly>=0){
      $('#numberonly').val(numberonly);
    } else{
      $('#numberonly').val(0);
    }
    
    }else{
      $('#numberonly').val(0);
    }

  //alert(numberonly);
}); 
function validation(val){
  
} 




