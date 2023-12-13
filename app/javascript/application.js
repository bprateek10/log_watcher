// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"
import 'jquery'



$(document).ready(function(){
	$.ajax({
    url: '/streaming.json', // replace with your actual endpoint
    type: 'GET',
    dataType: 'json',
    success: function(data) {
      $("#logs")[0].innerHTML += data.data.replaceAll("\n", "<br>")
    },
    error: function(error) {
      console.log('Error:', error);
    }
  });
})