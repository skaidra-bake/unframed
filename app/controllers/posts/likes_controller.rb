# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def update
      @post = Post.find(params[:post_id])

      if current_user.favorite(@post)
        respond_to do |format|
          format.html { redirect_to @post, success: 'You now like this post!' }
          format.js { head :created }
        end
      else
        redirect_to @post, alert: 'Something went wrong'
      end
    end
  end
end
