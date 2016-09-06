require_relative '../../lib/checkout'

describe '.Checkout' do
  let(:rules) do
    [
      TwoOrMoreRule.new(amount_off: 8.5, item_code: '001'),
      OffPurchaseRule.new(promotion_amount: 60, amount_off: 10)
    ]
  end
  
  let(:basket) do
    [
      Product.new('001', 'Travel Card Holder', 9.25),
      Product.new('002', 'Personalised cufflinks', 45.0),
      Product.new('003', 'Kids T-shirt', 19.95)
    ]
  end
  
  let(:basket2) do
    [
      Product.new('001', 'Travel Card Holder', 9.25),
      Product.new('003', 'Kids T-shirt', 19.95),
      Product.new('001', 'Travel Card Holder', 9.25)
    ]
  end
  
  let(:basket3) do
    [
      Product.new('001', 'Travel Card Holder', 9.25),
      Product.new('002', 'Personalised cufflinks', 45.0),
      Product.new('001', 'Travel Card Holder', 9.25),
      Product.new('003', 'Kids T-shirt', 19.95)
    ]
  end
  
  let(:checkout) { Checkout.new(rules) }
  
  context '#scan' do
    it 'should have scanned items' do
      basket.each { |item| checkout.scan(item) }
      expect(checkout.instance_variable_get("@items")).to eq(basket)
    end
  end
  
  context '#total' do
    it 'should return correct price for basket' do
      basket.each { |item| checkout.scan(item) }
      expect(checkout.total).to eq(66.78)
    end
    
    it 'should return correct price for basket2' do
      basket2.each { |item| checkout.scan(item) }
      expect(checkout.total).to eq(36.95)
    end
    
    it 'should return correct price for basket3' do
      basket3.each { |item| checkout.scan(item) }
      expect(checkout.total).to eq(73.76)
    end
  end
  
end