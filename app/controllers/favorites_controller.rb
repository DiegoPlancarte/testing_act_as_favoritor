class FavoritesController < ApplicationController
  before_action :set_favorites, only: [:index, :show, :edit, :update, :destroy]

  def show
    render json: @favorites
  end

  def index
    render json: @favorites
  end

  private
    def set_favorites
      @user = current_user.id
      @favorites = Favorite.where(:favoritor_id => @user)
    end

    def favorite_params
      params.require(:favorite).permit(:favoritable_id, 
                                        :favoritable_type, 
                                        :favoritor_id, 
                                        :favoritor_type, 
                                        :scope)
    end
end
