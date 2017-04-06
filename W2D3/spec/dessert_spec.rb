require 'rspec'
require 'dessert'

describe Dessert do
  let(:chef) { double("chef", name: 'Spencer') }
  let(:cookie) { Dessert.new("cookie", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('cookie', '10', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("chocolate")
      expect(cookie.ingredients).to include("chocolate")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['flour', 'egg', 'salt', 'raisin', 'oatmeal']
      ingredients.each { |ingredient| cookie.add_ingredient(ingredient) }

      expect(cookie.ingredients).to eq(ingredients)
      cookie.mix!
      expect(cookie.ingredients).not_to eq(ingredients)
      expect(cookie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(2)
      expect(cookie.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Spencer the Great Baker")
      expect(cookie.serve).to eq("Chef Spencer the Great Baker has made 10 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
