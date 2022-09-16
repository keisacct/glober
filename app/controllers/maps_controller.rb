class MapsController < ApplicationController

    def edit
    end
    def update
        @map.update(map_params)
        @map.save
        redirect_to user_path(current_user.id)
    end

    private

    def map_params
        @user = User.find(params[:user_id])
        params.require(:map).permit(
            :country_id
        ).merge(user_id: current_user.id)
    end
end
