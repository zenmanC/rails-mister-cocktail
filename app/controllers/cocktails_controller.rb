class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @cocktails = Cocktail.search(params[:query])

      @result = if @cocktails.count == 1
        "Showing #{@cocktails.count} cocktail matching \"#{params[:query]}\""
      else
        "Showing #{@cocktails.count} cocktails matching \"#{params[:query]}\""
      end

    else
      @cocktails = Cocktail.all.order(:name)
    end
  end

  def show

  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def tagged
    if params[:tag].present?
      @cocktails = Cocktail.tagged_with(params[:tag])
    else
      @cocktails = Cocktail.all
    end
  end


private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :photo2, :tag_list)
  end
end
