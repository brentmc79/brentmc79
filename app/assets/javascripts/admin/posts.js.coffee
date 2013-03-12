# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
  $("a.btn-delete").on "mouseover", () ->
    $(this).addClass "btn-danger"
  .on "mouseout", () ->
    $(this).removeClass "btn-danger"

  if $("form#new_post").length > 0
    slug = $("input#post_slug")
    $("input#post_title")
    .focus()
    .on "keyup", () ->
      slug.val($(this).val().trim().replace(/[^a-zA-Z0-9]+/g,"-"))
