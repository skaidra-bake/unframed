# frozen_string_literal: true

class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def show
    @user = User.friendly.find(params[:id])
    @collections = @user.collections
    @posts = @user.posts.with_an_image.all.order_by_newest
  end
end
