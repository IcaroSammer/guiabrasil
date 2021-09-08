    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");

    });
    $("#hide").click(function(){
      $("#show").hide(1000);
	  $("#itemHide").hide(1000);

	});
 	
	$("#show").click(function(){
	  $("#itemHide").show(1000);
	  $("#show").hide(1000);
	});
	
	
   	$("#addTag").click(function(){
      	 
        	var $div = $(this).next();
	        	$div.find("")
	            .last()
	            .clone()
	            .appendTo($div.append('<input class="text optional" type="text" value="" name="publication[tag][]" id="publication_">'))
	            .attr("id",function(i,oldVal) {
                return oldVal.replace(/\d+/,function(m){
                    return (+m + 1);
                });
            });
       		return false;
    	
   	});
/*
   	<select class="form-control select required" multiple="multiple" name="restaurant[chef][business_establishment][]" id="restaurant_chef_business_establishment"><option value="ATRACOES">Atracoes</option>
<option value="CIDADES">Cidades</option>
<option value="HOTEIS">Hoteis</option>
<option value="RESTAURANTES">Restaurantes</option></select>
*/

$(document).ready(function(){
	el_select = $("name=[hotel[payments_form]]");
	el_select.hide();
	$.each(el_select.find("option"), function(){
		$("#novo_select_container ul").append(
		'<li><input type="checkbox" value="'+$(this).val()+'" />'+$(this).text()+'</li>'
		);
	});

	$("#novo_select input[type=checkbox]").on("click",function(){
		if($(this).is(":checked")){
			$("name=[hotel[payments_form]] option[value="+$(this).val()+"]").attr("selected","selected");
		}else{
			$("name=[hotel[payments_form]] option[value="+$(this).val()+"]").removeAttr("selected");
		}
	});

	$("#novo_select li:not(:eq(0))").on("click",function(){
		$(this).find("input").trigger("click");
	});

	$("#novo_select_container li:eq(0)").on("click", function(){
		if($("#novo_select").hasClass("novo_select_fechado")){
			$("#novo_select").removeClass("novo_select_fechado").addClass("novo_select_aberto");
			$("#novo_select_container").css("height","auto");
		}else{
			$("#novo_select").removeClass("novo_select_aberto").addClass("novo_select_fechado");
			$("#novo_select_container").css("height","21px");
		}
	});

	$("#novo_select_container li input, #novo_select_container li").on("click", function(e){
		e.stopPropagation();
	});
	
	$(document).on('click',function(){
		if($("#novo_select").hasClass("novo_select_aberto")){
			$("#novo_select").removeClass("novo_select_aberto").addClass("novo_select_fechado");
			$("#novo_select_container").css("height","21px");
		}
	});
});

$('#restaurant_chef_attributes_main_courses_5').prop('checked', true);

