class BarangayPuroksController < ApplicationController
  before_action :set_barangay
  before_action :set_purok, only: %w[ show edit update destroy ]

  def index

  end

  def new
    @purok = BarangayPurok.new
  end

  def edit

  end

  def create
    @purok = BarangayPurok.new(purok_params)

    if @purok.save
      redirect_to barangay_puroks_url(barangay_id: @barangay.id), notice: "Purok successfully created and added."
    else
      flash.now[:notice] = "Purok failed to save!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @purok.update(purok_params)
      redirect_to barangay_puroks_url(barangay_id: @purok.barangay_id), notice: "Purok successfully modified."
    else
      flash.now[:notice] = "Purok failed to update!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @purok.destroy

    redirect_to barangay_puroks_url(@barangay), notice: "Purok successfully destroyed."
  end

  private
  def set_barangay
    @barangay = Barangay.find_by_id(params[:barangay_id])
  end

  def set_purok
    @purok = BarangayPurok.find_by_id(params[:id])
  end

  def purok_params
    params.require(:barangay_purok).permit(:barangay_id, :name, :population)
  end
end