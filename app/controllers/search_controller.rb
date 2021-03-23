# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @posts = Search.run(params.permit!)
  end
end
