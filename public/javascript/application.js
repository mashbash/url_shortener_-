$(document).ready(function(){ 
  $('#shorten-url').submit(function(e){
    e.preventDefault();
      


     $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize(),
        dataType: "json",
        success: function(data, status, xhr){
          
          // var newUrl = "<li>Long URL:" + data.long_url + "</br>Short URL: "+ data.short_url + "</li><br>";
          var newUrl = "<li>Long URL: <a href='" + data.long_url + "'>" + 
                        data.long_url + "</a></br>Short URL: <a href='"
                        + data.short_url + "'> http://localhost:9292/" +
                        data.short_url + "</a><br>Times clicked: " + data.counter
                        + "</li><br>";
          $("ul").hide().prepend(newUrl).slideDown('slow');        
      }
    });
  });
});


