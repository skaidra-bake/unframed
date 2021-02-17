class Posts::UnlikesController < ApplicationController
    before_action :authenticate_user!

    def update
        @post = Post.find(params[:post_id])

        if current_user.unfavorite(@post)
            redirect_to @post, success: 'You now unlike this post'
        else
            redirect_to @post, alert: 'Something went wrong'
        end
    end
end