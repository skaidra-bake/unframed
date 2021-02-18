class Profiles::UnfollowsController < ApplicationController
    before_action :authenticate_user!

    def update
        @user = User.find(params[:profile_id])
        pp params
        pp @user
        if current_user.stop_following(@user)
            redirect_to profile_path(@user), success: "You unfollowed #{@user.username}!"
        else
            redirect_to profile_path(@user), alert: 'Something went wrong...'
        end
    end
    
end