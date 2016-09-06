describe '.OffPurchaseRule' do
  let(:rule){ OffPurchaseRule.new(promotion_amount: 60, amount_off: 10) }
  
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
      Product.new('001', 'Travel Card Holder', 9.25),
    ]
  end
  
  let(:reduced_basket_prices) { [8.33, 40.5, 17.95] }
  let(:reduced_basket2_prices) { [8.33, 17.95, 8.33]}  
  context '#apply' do
    it 'should reduce the price by 10%' do
      applied_rule = rule.apply(basket).map { |item| item.round(2) }
      expect(applied_rule).to eq(reduced_basket_prices)
    end
    
    it 'rule should not be applied for basket2' do
      applied_rule = rule.apply(basket2)
      expect(applied_rule).to be false
    end
    
  end
end
