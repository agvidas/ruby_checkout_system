# Checkout system

# Interface
  To use it from project dir.
  
    irb -r ./lib/checkout.rb
  Example how to use the interface.
    
    co = Checkout.new(promotional_rules)
    co.scan(item) 
    co.scan(item) 
    price = co.total 
  
  Example with data:
    
    promotional_rules = [
      TwoOrMoreRule.new(amount_off: 8.5, item_code: '001'),
      OffPurchaseRule.new(promotion_amount: 10, amount_off: 10)
    ]
    
    items = [
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('002', 'Personalised cufflinks', 45.0),
        Product.new('001', 'Travel Card Holder', 9.25),
        Product.new('003', 'Kids T-shirt', 19.95)
    ]
    
    co = Checkout.new(promotional_rules)
    
    items.each { |item| co.scan(item) }
    
    co.total
    
     => 73.76 
# Specs
    rspec
