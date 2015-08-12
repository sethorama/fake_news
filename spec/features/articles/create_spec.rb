require 'rails_helper'

describe "Creating articles" do
  def create_article(options={})
    options[:title] ||= "My Title"
    options[:body] ||= "X" * 100

    visit "/articles"
    click_link "New Article"
    expect(page).to have_content("New Article")

    fill_in "Title", with: options[:title]
    fill_in "Body", with: options[:body]
    click_button "Save"
  end

  before do
    expect(Article.count).to eq(0)
  end

  it "redirects to the articles index page on success" do
    create_article
    expect(page).to have_content("My Title")
  end

  it "Throws an error with no title" do
    create_article title: ""
    expect(page).to have_content(/can't be blank/i)
    expect(Article.count).to eq(0)
  end

  it "Throws an error if the title is less than five characters" do
    create_article title: "1234"
    expect(page).to have_content(/is too short/i)
    expect(Article.count).to eq(0)
  end

  it "Throws an error with no body" do
    create_article body: ""
    expect(page).to have_content(/can't be blank/i)
    expect(Article.count).to eq(0)
  end

  it "Throws an error with a body less than 100 characters" do
    create_article body: "X" * 99
    expect(page).to have_content(/is too short/i)
    expect(Article.count).to eq(0)
  end
end