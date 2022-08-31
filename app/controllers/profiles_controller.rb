class ProfilesController < ApplicationController
    before_action  :authenticate_user!, only: [:edit, :update]
    before_action :move_to_curernt_page, only: [:edit, :update]
    before_action :set_profile, only: [:edit, :update]

    def edit
    end

    def update
        @profile.update(profile_params)
        if @profile.save
            redirect_to user_path(current_user.id)
        else
            render :edit
        end
    end

    private
    def set_profile
        @profile = current_user.profile
    end

    def move_to_curernt_page
        set_profile
        if @profile.user_id != current_user.id
            redirect_to root_path
        end
    end

    def profile_params
        params.require(:profile).permit(
            :user_icon, :name, :introduction, :twitter_url,
            :linkedin_url, :facebook_url, :blog_url
        )
    end
end
