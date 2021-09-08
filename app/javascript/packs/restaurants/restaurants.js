$(document).ready(function(){

	var $divHorario = $("#horario")
	var numFieldsTime = document.getElementsByName("restaurant[start_1][]").length 
	var htmlInsert = '<div class="row form-group">'
	htmlInsert += '<div class="col-sm-2">'


	htmlInsert += '<div class="form-group text required restaurant_start_1"><input class="text required form-control" required="required" aria-required="true" type="text" name="restaurant[start_1][]" id="restaurant_"></div>'
	htmlInsert += '</div>'
	htmlInsert += '<div class="col-sm-2">'
	htmlInsert += '<div class="form-group text required restaurant_end_1"><input class="text required form-control" required="required" aria-required="true" type="text" name="restaurant[end_1][]" id="restaurant_"></div>'
	htmlInsert += '</div>'
	htmlInsert += '<div class="col-sm-2">'
	htmlInsert += '<div class="form-group text required restaurant_start_2"><input class="text required form-control" required="required" aria-required="true" type="text" name="restaurant[start_2][]" id="restaurant_"></div>'
	htmlInsert += '</div>'
	htmlInsert += '<div class="col-sm-2">'
	htmlInsert += '<div class="form-group text required restaurant_end_2"><input class="text required form-control" required="required" aria-required="true" type="text" name="restaurant[end_2][]" id="restaurant_"></div>'
	htmlInsert += '</div></div></div>'

	if (numFieldsTime < 7){
		for(i=1; i<=7-numFieldsTime; i++){
			console.log(i);
			$divHorario.find("").last().clone().appendTo($divHorario.append(htmlInsert));
		};
	};
});

