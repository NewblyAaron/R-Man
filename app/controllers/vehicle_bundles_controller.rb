class VehicleBundlesController < DashboardController
  before_action :set_vehicle
  before_action :set_vehicle_bundle, only: %w[ edit update destroy ]

  def index
    @vehicle_bundles = @vehicle.vehicle_bundles.all
  end

  def new
    @vehicle_bundle = VehicleBundle.new
  end

  def edit

  end

  def create
    @vehicle_bundle = VehicleBundle.new(vehicle_bundle_params)

    if @vehicle_bundle.save
      redirect_to vehicle_bundles_path(vehicle_id: @vehicle.id), notice: "#{@vehicle_bundle.bundle.name} was successfully created."
    else
      flash.now[:notice] = "Vehicle bundle failed to save!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @vehicle_bundle.update(vehicle_bundle_params)
      redirect_to vehicle_bundles_path(vehicle_id: @vehicle.id), notice: "#{@vehicle_bundle.bundle.name} was successfully updated."
    else
      flash.now[:notice] = "Bundle item failed to update!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    bundle_name = @vehicle_bundle.bundle.name
    @vehicle_bundle.destroy

    redirect_to vehicle_bundles_path(vehicle_id: @vehicle.id), notice: "#{bundle_name} was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def set_vehicle_bundle
    @vehicle_bundle = VehicleBundle.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vehicle_bundle_params
    params.require(:vehicle_bundle).permit(:vehicle_id, :bundle_id, :quantity)
  end
end