class DashboardController < ApplicationController
  before_action :require_user_logged_in!
  def index

  end

  def vehicle_dispatch

  end

  
  def calculate_dispatch
    @bundle = Bundle.find(params[:bundle])
    @barangay = Barangay.find(params[:barangay])

    respond_to do |format|
      format.turbo_stream
    end
  end
  
  def dispatch_load
    @bundle = Bundle.find(params[:bundle])
    @barangay = Barangay.find(params[:barangay])

    stock = @bundle.get_bundle_qty

    until stock <= 0
      Vehicle.all.order("capacity DESC").each do |v|
        if v.capacity < stock
          VehicleBundle.create(vehicle_id: v.id, bundle_id: @bundle.id, quantity: v.capacity)
          stock = stock - v.capacity
        else
          VehicleBundle.create(vehicle_id: v.id, bundle_id: @bundle.id, quantity: stock)
          stock = 0
        end
      end
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  def dispatch_unload
    Vehicle.all.each do |v|
      v.vehicle_bundles.delete_all
    end

    respond_to do |format|
      format.turbo_stream
    end
  end
  
  def calculate

  end

  def calculate_bundle
    @barangay = Barangay.find(params[:barangay])
    @barangay_puroks = @barangay.barangay_puroks.all
    @bundle = Bundle.find(params[:bundle])
    @bundle_items = @bundle.bundle_items.all
    
    respond_to do |format|
      format.turbo_stream
    end
  end
end