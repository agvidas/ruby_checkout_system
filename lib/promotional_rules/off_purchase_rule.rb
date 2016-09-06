class OffPurchaseRule < Rule
  
  def apply(items)
    total_price(items) >= promotion_amount ? apply_discount(items, amount_off) : false
  end
  
  private
  
  def total_price(items)
    items.map(&:price).inject(:+)
  end
  
  def apply_discount(items, percent)
    percent = 1.0 - (percent.to_f / 100.0)
    items.map { |item| change_price(item, percent) }
  end 
  
  def change_price(item, percent)
     item.price = item.price * percent
  end 
end