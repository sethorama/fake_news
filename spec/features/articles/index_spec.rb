require 'rails_helper'

describe "Visiting home page" do
  it "goes to articles page as root directory" do
    visit "/"
    expect(page).to have_content("Listing Articles")
  end
end