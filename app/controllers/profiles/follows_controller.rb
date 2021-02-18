class Profiles::FollowsController < ApplicationController
    before_action :authenticate_user!

    def update
        pp params
        @user = User.find(params[:profile_id])
        pp @user
        if current_user.follow(@user)
            redirect_to profile_path(@user), success: 'You now follow this profile!'
        else
            redirect_to profile_path(@user), alert: 'Something went wrong...'
        end
    end
    
end