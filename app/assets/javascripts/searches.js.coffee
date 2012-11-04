# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

query_string = $('#search-term').text()

if query_string
  terms = $(query_string.split(' '))
  $('article').each (index, element) =>
    terms.each (index, term) =>
      article = $(element)
      article.html(article.html().replace(new RegExp("("+term+")", 'gi'), "<span style='background-color:yellow'>$1</span>"))
