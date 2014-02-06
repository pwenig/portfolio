$(document).ready(function(){
	$("#more_projects").hide();
	$("#experience").on("click", "a.show_more", function(event){

		$("#more_projects").slideToggle();

		var text = $(this).text();
		
		$(this).text(text == "show more projects" ? "collapse" : "show more projects");
		event.preventDefault();
	});
});