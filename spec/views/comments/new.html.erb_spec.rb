require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      body: "MyText",
      article_id: 1,
      parent_id: 1,
      user_id: 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[article_id]"

      assert_select "input[name=?]", "comment[parent_id]"

      assert_select "input[name=?]", "comment[user_id]"
    end
  end
end
