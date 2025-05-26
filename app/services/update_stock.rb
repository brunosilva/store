class UpdateStock
  def initialize(params)
    @product_id = params[:product_id]
    @quantity = params[:quantity]
  end

  def call
    stock = Stock.find_by(product_id: @product_id)

    if stock.present?
      new_quantity = stock.quantity - @quantity.to_i


      if new_quantity >= 0
        stock.update(quantity: new_quantity)
      else
        # Lógica de erro, por exemplo:
        raise "Estoque insuficiente para o produto "
      end
    end
  end
end
