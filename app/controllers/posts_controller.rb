class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end
end
