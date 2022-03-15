require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do #feature block

    # SETUP

    before :each do
      @category = Category.create! name: 'Apparel'
    index = ["apparel1.jpg","apparel2.jpg","apparel3.jpg","apparel4.jpg","apparel5.jpg","apparel6.jpg","electronics1.jpg","electronics2.jpg", "electronics3.jpg","furniture1.jpg", "furniture2.jpg"]
      5.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset(index[n]),
          quantity: 10,
          price: 64.99
        )
      end
    end

     #describe block


  scenario "They will add products to cart" do #scenario Block
    # ACT
    visit root_path
    
    find('button', text: 'Add', match: :first).click
    cart_tag = find(:css, "a[href='/cart']")
    expect(cart_tag).to have_text("My Cart (1)")
    sleep 5
    # DEBUG / VERIFY
    
  save_screenshot
    
    
  end
end
