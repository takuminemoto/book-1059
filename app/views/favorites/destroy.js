/*global $*/
$("#book_<%= @book.id %> .favorite-btn").html("<%= j(render 'favorites/favorite-btn', book: @book) %>");