class UpdateStock
  def initialize(params)
    @params = params
  end

  def call
    stock = Stock.find_by(product_id: @params)

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
