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
    total = 0

    lines = upload_params[:text_file].tempfile.readlines.map(&:chomp)
    lines.shift
    respond_to do |format|
      sales_group = SalesGroup.create
      lines.each do |l|
        data = l.split(/\t/)
        @sale = Sale.new buyer_name: data[0].force_encoding('UTF-8'),
                         description: data[1].force_encoding('UTF-8'),
                         unit_price: data[2].force_encoding('UTF-8'),
                         amount: data[3].force_encoding('UTF-8'),
                         full_address: data[4].force_encoding('UTF-8'),
                         provider_name: data[5].force_encoding('UTF-8'),
                         sales_group: sales_group

        format.json { render json: @sale.errors, status: :unprocessable_entity } unless @sale.save!
      end

      format.json { render json: sales_group.to_json({:include => :sales, :methods => :total}).to_json }
    end
  end


  private

  # Filter params
  def upload_params
    params.require(:sale).permit(:text_file)
  end
end
