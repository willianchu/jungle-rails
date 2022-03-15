require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do #You will need to use the javascript-enabled browser by specifying js: true in the feature declaration
  
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


  scenario "They choose one especific product to see" do #scenario Block
    # ACT
    visit root_path
    
    find_link('Signup').click
    fill_in 'user[name]',  with: "Robot User"
    fill_in 'user[email]',  with: "us@robotics.com"
    fill_in 'user[password]',  with: "supersecret"
    fill_in 'user[password_confirmation]',  with: "supersecret"
    click_on "Submit"
    sleep 5
    # DEBUG / VERIFY
    expect(page).to have_css 'article.product', count: 5
  save_screenshot
    
    
  end
end
