require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :title => "Title",
        :body => "X" * 100
      ),
      Article.create!(
        :title => "Title",
        :body => "X" * 100
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => ("X" * 100).to_s, :count => 2
  end  
end
