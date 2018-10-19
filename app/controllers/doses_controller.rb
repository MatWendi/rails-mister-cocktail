class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_detail)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    if @dose.save
     redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:cocktail_id])
  end

  def update
    @dose = Dose.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def params_detail
    params.require(:dose).permit(:description)
  end
end
