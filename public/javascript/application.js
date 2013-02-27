$(document).ready(function(){ 

var successFunction = function(data, status, xhr){
        // var newUrl = "<li>Long URL:" + data.long_url + "</br>Short URL: "+ data.short_url + "</li><br>";
        var newUrl = "<li>Long URL: <a href='" + data.long_url + "'>" + 
                      data.long_url + "</a></br>Short URL: <a href='"
                      + data.short_url + "'> http://localhost:9292/" +
                      data.short_url + "</a><br>Times clicked: " + data.counter
                      + "</li><br>";
        $("ul")..hide()prepend(newUrl).slideDown('slow');        
    };

  $('#shorten-url').submit(function(e){
    e.preventDefault();

     $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize(), //takes the json data sent from the server
        dataType: "json", //#request to server -> I want it back as JSON
        success: successFunction,
        error: function(){
          alert("I got an error");
        }
    });
  });
});

//refer to url_controller

