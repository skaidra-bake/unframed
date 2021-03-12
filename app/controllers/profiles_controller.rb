class ProfilesController < ApplicationController
    # before_action :authenticate_user!

    def show
        @user = User.friendly.find(params[:id])
    end

end
