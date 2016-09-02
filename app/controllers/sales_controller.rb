class SalesController < ApplicationController
  # GET /sales
  # GET /sales.json
  def index
    @upload = Sale.new
    @sales_group = SalesGroup.all
  end

  # POST /sales
  # POST /sales.json
  def create
    lines = upload_params[:text_file].tempfile.readlines.map(&:chomp)
    lines.shift
    sales_group = SalesGroup.create
    respond_to do |format|
      begin
        lines.each do |l|
          data = l.split(/\t/)
          @sale = Sale.create buyer_name: data[0].force_encoding('UTF-8'),
                           description: data[1].force_encoding('UTF-8'),
                           unit_price: data[2].force_encoding('UTF-8'),
                           amount: data[3].force_encoding('UTF-8'),
                           full_address: data[4].force_encoding('UTF-8'),
                           provider_name: data[5].force_encoding('UTF-8'),
                           sales_group: sales_group
        end
      rescue
        format.html { redirect_to root_url, notice: 'Ocorreu um erro no Uploado do arquivo!' }
      end
      format.html { redirect_to root_url, notice: 'O relatório foi adicionado com sucesso!' }
    end
  end

  private
  
  # Filter params
  def upload_params
    params.require(:sale).permit(:text_file)
  end
end
