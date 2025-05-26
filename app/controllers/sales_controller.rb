class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]
  before_action :fetch_customers, only: %i[new edit create update]
  before_action :fetch_products, only: %i[new edit create update]



  # GET /sales or /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    @product = Product.find_by(id: @sale.product_id)

    @sale.total = @product.price * @sale.quantity

    respond_to do |format|
      if @sale.save
        # UpdateStock.new(sale_params).call
        :update_stock
        format.html { redirect_to @sale, notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy!

    respond_to do |format|
      format.html { redirect_to sales_path, status: :see_other, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:quantity, :customer_id, :product_id)
    end

    def fetch_customers
      @customers = Customer.all
    end

    def fetch_products
      @products = Product.all
    end

    def update_stock
      stock = Stock.find_by(product_id: @sale.product_id)

      if stock.present?
        new_quantity = stock.quantity - @sale.quantity


        if new_quantity >= 0
          stock.update(quantity: new_quantity)
        else
          # Lógica de erro, por exemplo:
          raise "Estoque insuficiente para o produto #{@sale.product_id}"
        end
      end
    end
end
