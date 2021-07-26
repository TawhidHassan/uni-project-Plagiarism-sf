
$(document).ready(function(){

	var query;


    

    $("#reset").on('click',function(){
        $("#projectName").val('');
        query=""
        });

    $("#result").hide()
    $("#projectName").keyup(function(){
         query = $(this).val();
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
                       x += "<h5>"+"<b>"+i+"</b>"+" "+ text + "</h5>"+"<br><hr>";
                    }
                    document.getElementById("listRes").innerHTML = x;

                }else{
                    $("#result").hide()
                }


            }
          });

    });


    $("#projectDes").keyup(function(){

        query = $(this).val();
        if(query==""){
            $("#result").hide()
        }
        var  i, j, x = "";
        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "GET",
            url:  "/app/searchingDes/"+query,
            success: function(data){
                var jsonData = JSON.parse(data);
                // console.log(jsonData[0]["project_name"])
                if(data.length>0){
                    $("#result").show()
                    for(var i=0;i<jsonData.length;i++){
                        // console.log(jsonData[i]["project_name"])
                        var text=jsonData[i]["project_name"]
                        x += "<h5>"+"<b>"+i+"</b>"+" "+ text + "</h5>"+"<br><hr>";
                    }
                    document.getElementById("listRes").innerHTML = x;

                }else{
                    $("#result").hide()
                }


            }
        });

    });

});


