$(document).ready(function(){
	$('a.info_action').on('click', function(){
		var elementId = this.getAttribute('id');
		$.ajax({
        type: "GET",
        //dataType: 'json',
        url: "/admin/client/" ,
        data: { elementId : elementId },    // multiple data sent using ajax
        success: function (data) {
          swal({
		    title: "Title", 
		    text: data.users,  
		    confirmButtonText: "V redu", 
		    allowOutsideClick: "true" 
			});
          console.log(data);
        },
        error: function (ajaxContext) {
	        swal({
		    title: "Fracaso",
		    allowOutsideClick: "true" 
			});
	    }
      });
	});

});