# frozen_string_literal: true

class TimelinesController < ApplicationController
  def show
    @book = Book.find(params[:book_id])
    #フォローユーザーのみ表示
  end
end
