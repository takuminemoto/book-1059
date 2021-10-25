# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = if @model == 'user'
                 User.search_for(@content, @method)
               else
                 Book.search_for(@content, @method)
               end
  end
end
