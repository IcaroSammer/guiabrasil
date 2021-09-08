$(document).ready(function(){

	var $divHorario = $("#horario")
	var numFieldsTime = document.getElementsByName("tourist_attraction[start_1][]").length 
	var htmlInsert = '<div class="row form-group">'
	htmlInsert += '<div class="col-sm-3">'


	htmlInsert += '<div class="form-group text required tourist_attraction_start_1"><input class="text required form-control" required="required" aria-required="true" type="text" name="tourist_attraction[start_1][]" id="tourist_attraction_"></div>'
	htmlInsert += '</div>'
	htmlInsert += '<div class="col-sm-3">'
	htmlInsert += '<div class="form-group text required tourist_attraction_end_1"><input class="text required form-control" required="required" aria-required="true" type="text" name="tourist_attraction[end_1][]" id="tourist_attraction_"></div>'
	htmlInsert += '</div>'
	htmlInsert += '<div class="col-sm-3">'
	htmlInsert += '<div class="form-group text required tourist_attraction_start_2"><input class="text required form-control" required="required" aria-required="true" type="text" name="tourist_attraction[start_2][]" id="tourist_attraction_"></div>'
	htmlInsert += '</div>'
	htmlInsert += '<div class="col-sm-3">'
	htmlInsert += '<div class="form-group text required tourist_attraction_end_2"><input class="text required form-control" required="required" aria-required="true" type="text" name="tourist_attraction[end_2][]" id="tourist_attraction_"></div>'
	htmlInsert += '</div></div></div>'

	if (numFieldsTime < 7){
		for(i=1; i<=7-numFieldsTime; i++){
			console.log(i);
			$divHorario.find("").last().clone().appendTo($divHorario.append(htmlInsert));
		};
	};
});

