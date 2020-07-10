class ClientsController < ApplicationController
  def index

    @warehouse = Warehouse.find(params[:warehouse_id])
    @comintent = @warehouse.comintents.find(params[:comintent_id])
    @clients = @comintent.clients.all

  end

  def show
    @warehouse = Warehouse.find(params[:warehouse_id])
    @comintent = @warehouse.comintents.find(params[:comintent_id])
    @client = @comintent.clients.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'application',
               template: 'clients/show.html.erb',
               layout: 'pdf.html',
               encoding: 'utf8',
               page_size: 'a4',
               orientation: 'Portrait',
               print_media_type: false,
               grayscale: true
      end
    end
  end

  def new
    @warehouse = Warehouse.find(params[:warehouse_id])
    @comintent = warehouse.clients.find(params[:client_id])
    @client = @comintent.clients.build
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
    @comintent = @warehouse.comintents.find(params[:comintent_id])
    @client = @comintent.clients.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:warehouse_id])
    @comintent = @warehouse.comintents.find(params[:comintent_id])
    @client = @comintent.clients.find(params[:id])

    if @client.update(client_params)
      redirect_to warehouse_comintent_client_path(@warehouse, @client.comintent_id, @client)
    else
      render :edit
    end
  end

  def transfer_client
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.find(params[:id])
  end

  def transfer
    @warehouse = Warehouse.find(params[:warehouse_id])
    @client = @warehouse.clients.find(params[:id])

    if @client.update(client_params)
      redirect_to warehouse_client_path(@client.warehouse_id, @client)
    else
      render :transfer_client
    end
  end

  private

  def client_params
    params.require(:client).permit(:name,
                                   :plate,
                                   :dimension,
                                   :location,
                                   :brand,
                                   :qty,
                                   :warehouse_id,
                                   :search)
  end

  def transfer_params
    { warehouse_id: params[:warehouse_id] }
  end
end
