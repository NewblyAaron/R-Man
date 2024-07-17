class BundleItemsController < DashboardController
  before_action :set_bundle
  before_action :set_bundle_item, only: %w[ edit update destroy ]

  def index
    @bundle_items = @bundle.bundle_items.all
  end

  def new
    @bundle_item = BundleItem.new
  end

  def edit
  end

  def create
    @bundle_item = BundleItem.new(bundle_items_params)

    if @bundle_item.save
      redirect_to bundle_items_path(bundle_id: @bundle.id), notice: "#{@bundle_item.item.name} was successfully created."
    else
      flash.now[:notice] = "Bundle item failed to save!"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bundle_item.update(bundle_items_params)
      redirect_to bundle_items_path(bundle_id: @bundle.id), notice: "#{@bundle_item.item.name} was successfully updated."
    else
      flash.now[:notice] = "Bundle item failed to update!"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item_name = @bundle_item.item.name
    @bundle_item.destroy

    redirect_to bundle_items_path(bundle_id: @bundle.id), notice: "#{item_name} was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bundle
    @bundle = Bundle.find(params[:bundle_id])
  end

  def set_bundle_item
    @bundle_item = BundleItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bundle_items_params
    params.require(:bundle_item).permit(:bundle_id, :item_id, :quantity)
  end
end