class ClientsController < ApplicationController
  def index
    @warehouse = Warehouse.find(params[:warehouse_id])
    @clients = @warehouse.clients.all
  end

  def show
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'application',
               template: 'clients/show.html.erb',
               layout: 'pdf.html',
               encoding: 'utf8',
               page_size: 'a5',
               orientation: 'Landscape'
      end
    end
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

  def edit
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.find(params[:id])

    if @client.update(client_params)
      redirect_to warehouse_client_path(@warehouse, @client)
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :plate, :dimension, :location, :brand, :qty, :warehouse_id)
  end
end
