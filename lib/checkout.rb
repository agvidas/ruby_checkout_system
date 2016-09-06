require_relative 'product.rb'
require_relative 'promotional_rules/rule.rb'
require_relative 'promotional_rules/off_purchase_rule.rb'
require_relative 'promotional_rules/two_or_more_rule.rb'

class Checkout
  
  def initialize(promotional_rules)
    @rules = promotional_rules
    @items = []
  end
  
  def scan(item)
    @items << item
  end
  
  def total
    apply_rules
    amount_to_pay
  end
  
  private
  
  def apply_rules
    @rules.each do |rule|
      rule.apply(@items)
    end
  end
  
  def amount_to_pay
    @items.map(&:price).inject(:+).round(2)
  end
  
end