class TwoOrMoreRule < Rule
  
  def apply(items)
    two_or_more?(items) ? items_to_change_by_rule(items) : false
  end
  
  private
  
  def two_or_more?(items)
    items.select { |item| item.code == item_code}.size >= 2    
  end
  
  def items_to_change_by_rule(items)
    return items if item_code == nil
    items.select { |item| item.code == item_code }.map { |item| change_item_price(item) }
  end
  
  def change_item_price(item)
    item.price = amount_off
  end
end