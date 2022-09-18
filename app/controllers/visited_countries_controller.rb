class VisitedCountriesController < ApplicationController
    
    def new
        @visited_country = current_user.visited_countries.build
    end

    def create
        binding.pry
        @visited_country = current_user.visited_countries.create(map_params)
        @visited_country.save
        redirect_to user_path(current_user.id)
    end
    
    def edit
        # @user = User.find(params[:user_id])
    end
    def update
        binding.pry
        # @user = User.find(params[:user_id])
        @visited_country.update(map_params)
        @visited_country.save
        redirect_to user_path(current_user.id)
    end

    private

    def map_params
        # @user = User.find(params[:user_id])
        params.require(:visited_country).permit(
            :country_id, :tag_list
        ).merge(user_id: current_user.id)
    end
end
