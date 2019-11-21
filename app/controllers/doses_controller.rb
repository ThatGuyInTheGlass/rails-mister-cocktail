class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]
  before_action :set_cocktail, only: [:new]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = @dose.cocktail
    if @dose.save
      redirect_to @cocktail, notice: 'Your cocktail was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path, notice: 'We removed your cocktail from the database.'
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
