class Rule
  attr_accessor :promotion_amount, :amount_off, :item_code
  
  def initialize(promotion_amount: 0,amount_off: 0, item_code: nil)
    @promotion_amount, @amount_off, @item_code  = promotion_amount, amount_off, item_code
  end
  
end