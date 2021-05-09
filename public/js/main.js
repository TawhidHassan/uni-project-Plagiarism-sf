
$(document).ready(function(){

	$("#btn").on('click',function(){
	alert("ssss ")

    });


    $("#projectName").keyup(function(){
        var text = $(this).val();
        
    });

    $("#result").hide()
    $("#projectName").keyup(function(){
        var query = $(this).val();
        if(query==""){
            $("#result").hide()
        }
        var  i, j, x = "";
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "GET",
            url:  "/app/searching/"+query,
            success: function(data){
                var jsonData = JSON.parse(data);
                 // console.log(jsonData[0]["project_name"])
                if(data.length>0){
                    $("#result").show()
                    for(var i=0;i<jsonData.length;i++){
                        // console.log(jsonData[i]["project_name"])
                       var text=jsonData[i]["project_name"]
                       x += "<h6>"+"<b>"+i+"</b>"+" "+ text + "</h6>";  
                    }
                    document.getElementById("listRes").innerHTML = x;
                    
                }else{
                    $("#result").hide()
                }

                
            }
          });
        
    });

});