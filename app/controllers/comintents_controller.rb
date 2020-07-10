class ComintentsController < ApplicationController
  def index
    @warehouse = Warehouse.find(params[:warehouse_id])
    @comintents = @warehouse.comintents.all
  end

  def show
    @warehouse = Warehouse.find(params[:warehouse_id])
    @comintent = @warehouse.comintents.find(params[:id])
    @clients = @comintent.clients.all
  end
end
