# frozen_string_literal: true

module Posts
  class UnlikesController < ApplicationController
    before_action :authenticate_user!

    def update
      @post = Post.find(params[:post_id])

      if current_user.unfavorite(@post)
        respond_to do |format|
          format.html { redirect_to @post, success: 'You now unlike this post' }
          format.js { head :ok }
        end
      else
        redirect_to @post, alert: 'Something went wrong'
      end
    end
  end
end
