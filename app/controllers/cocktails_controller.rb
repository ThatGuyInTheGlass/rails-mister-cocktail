class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
     @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      @dose.save
      redirect_to @cocktail, notice: 'Your cocktail was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail, notice: 'Your Cocktail was successfully updated.'
    else
      render :edit
    end
  end

  # def destroy
  #   @cocktail.destroy
  #   redirect_to cocktail_url, notice: 'We removed your cocktail from the database.'
  # end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

   def dose_params
     params.require(:cocktail).require(:dose).permit(:description, :ingredient_id)
   end
end
