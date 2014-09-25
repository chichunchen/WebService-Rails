class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order("updated_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json {
        @products.map { |p| p.image = "1" if p.image != nil }
        render :json => @products.to_json
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    begin
      set_product
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid product #{params[:id]}"
      redirect_to products_path, :notice => 'Invalid product'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :price, :description, :image_url)
  end


end
