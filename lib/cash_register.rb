# require 'pry'

class CashRegister

  attr_accessor :total, :discount, :last_transaction
  
  def initialize(discount=0)
    @discount = discount
    @total = 0
    @cart = []
  end

  def add_item(title, price, quantity=1)
    @total += (price * quantity)
    quantity.times { @cart << title }
    @last_transaction = price * quantity
  end
  
  def apply_discount
    if @discount > 0
      @total -= (@total * @discount/100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @cart 
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
