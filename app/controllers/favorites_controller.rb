class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  
    def index
      @user = current_user.id
      @favorites = Favorite.where(:favoritor_id => @user)
      render json: @favorites
    end

  def show
    render json: @favorite
  end

  def create
    @favorite = Favorite.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.json { render :show, status: :created, location: @favorite }
      else
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @favorite.destroy
      render json:Favorite.where(:favoritor_id => @user)
  end

  private
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def favorite_params
      params.require(:favorite).permit(:favoritable_id, 
                                        :favoritable_type, 
                                        :favoritor_id, 
                                        :favoritor_type, 
                                        :scope,
                                        :blocked,
                                        :created_at,
                                        :update_at)
    end
end
