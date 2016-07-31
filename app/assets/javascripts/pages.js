$(document).ready(function() {
  $("#new_user_form").on("ajax:success", function(e, data, status, xhr) {
  $("#user_url").append(xhr.responseText["url"]);
    return $("#new_user_form").hide();
  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_article").append("<p>ERROR</p>");
  });
});