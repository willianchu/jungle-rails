require 'rails_helper'

RSpec.describe Product, type: :model do # step 1

  category = Category.create(name: "Foreign Languages")
  product = Product.create(name: "Amazing Product", description: "test description", price_cents: 100, image: "test.jpg", quantity: 15, category: category) # step 2
  nil_product = Product.create(name: nil, description: nil, price_cents: nil, category: nil) # step 2

  it "has NOT been saved with all 4 attributes" do
    expect(nil_product.valid?).to eq(false)
  end

  it "HAS been saved with all 4 attributes" do
    expect(product.valid?).to eq(true)
  end
  
  it "expect error to be found within the .errors.full_messages array" do
    expect(nil_product.errors.full_messages).to include("Name can't be blank")
  end
  #Set all fields to a value but the validation field being tested to nil
  it "compare all fields to nil" do
    expect(nil_product.name).to eq(nil)
    expect(nil_product.description).to eq(nil)
    expect(nil_product.price_cents).to eq(nil)
    expect(nil_product.category).to eq(nil)
  end

  it "is valid with valid attributes" do # test all
    expect(product).is_a? Product
  end

  it "must have a name field" do # step 2
    expect(product.name).to eq("Amazing Product")
  end

  it "must have a price field" do
    expect(product.price_cents).is_a? Numeric
  end

  it "must have a description field" do
    expect(product.description).is_a? String
  end

  it "must have a category field" do
    expect(product.category).is_a? Category
  end
end

