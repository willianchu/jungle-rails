require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do #You will need to use the javascript-enabled browser by specifying js: true in the feature declaration
  
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


  scenario "They see all products" do #scenario Block
    # ACT
    visit root_path
    sleep 5
    puts "<<<<<"
    puts @category.products[1].name
    
    find_link('Details', match: :first).click
    # click_link obj
    puts page.html
    # click_link obj
    
    sleep 5
    # DEBUG / VERIFY
  save_screenshot
    
    
  end
end
