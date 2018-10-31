require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Mark") }
  subject(:green_tea) {Dessert.new("Ice Cream", 50, chef)}
  describe "#initialize" do
    it "sets a type" do
      expect(green_tea.type).to eq("Ice Cream")
    end
    it "sets a quantity" do
      expect(green_tea.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(green_tea.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pie", "boat load", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      green_tea.add_ingredient("matcha")
      expect(green_tea.ingredients).to include("matcha")
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["rice", "butter", "milk", "chocolate"]

      ingredients.each do |ingredient|
      green_tea.add_ingredient(ingredient)
     end

      expect(green_tea.ingredients).to eq(ingredients)
      ingredients.shuffle!
      expect(green_tea.ingredients).not_to eq(ingredients)
      expect(green_tea.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      green_tea.eat(10)
      expect(green_tea.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do

      expect(green_tea.eat(60)).to raise_error("not enough left")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Mark the Great Baker")
      expect(green_tea.serve).to eq("Chef Mark the Great Baker has made 50 Ice Creams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    end
  end
end
