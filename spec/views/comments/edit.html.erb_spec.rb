require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      body: "MyText",
      article_id: 1,
      parent_id: 1,
      user_id: 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[article_id]"

      assert_select "input[name=?]", "comment[parent_id]"

      assert_select "input[name=?]", "comment[user_id]"
    end
  end
end
