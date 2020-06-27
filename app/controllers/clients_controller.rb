class ClientsController < ApplicationController
  def index
    @warehouse = Warehouse.find(params[:warehouse_id])
    @clients = @warehouse.clients.all
  end

  def show
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.find(params[:id])
  end

  def new
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.build
  end

  def create
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.new(client_params)

    if @client.save
      redirect_to [@warehouse, @client]
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :plate, :dimension, :location, :brand, :qty)
  end
end
