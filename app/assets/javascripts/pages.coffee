$(document).ready ->
  $("#new_user_form").on("ajax:success", (e, data, status, xhr) ->
    $("#user_url").append xhr.responseText["url"]
    $("#new_user_form").hide()
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"