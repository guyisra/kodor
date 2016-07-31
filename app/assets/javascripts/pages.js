$(document).ready(function() {
  $("#new_user_form").on("ajax:success", function(e, data, status, xhr) {
      url = JSON.parse(xhr.responseText)["url"]
      $("#new_user_url").append(url);
      $("#new_user_form").hide();
      $("#new_user_url").show();
  }).on("ajax:error", function(e, xhr, status, error) {
      window.alert('Url could not be generated. SHAME on you!')
  });
});