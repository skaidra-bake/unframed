class Posts::LikesController < ApplicationController
    before_action :authenticate_user!

    def update
        @post = Post.find(params[:post_id])

        if current_user.favorite(@post)
            redirect_to @post, success: 'You now like this post!'
        else
            redirect_to @post, alert: 'Something went wrong'
        end
    end
    
end