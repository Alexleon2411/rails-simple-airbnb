class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :destroy, :update]

  def index
    @flats = Flat.all
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @flats = Flat.all
    end
  end

  def show

  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)
    if @flat.save
      redirect_to flats_path, notice: "the flat has been created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy

    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
  params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
