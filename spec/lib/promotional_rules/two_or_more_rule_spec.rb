describe '.TwoOrMoreRule' do
  let(:rule) { TwoOrMoreRule.new(amount_off: 8.5, item_code: '001') }
  
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
  
  let(:reduced_item_price) { [8.5, 8.5] }
  
  context '#apply' do
    it 'should reduce item 001 price to 8.5 from basket2' do
      applied_rule = rule.apply(basket2)
      expect(applied_rule).to eq(reduced_item_price)
    end
    
    it 'rule should not be applied for basket' do
      applied_rule = rule.apply(basket)
      expect(applied_rule).to be false
    end   
  end
end
