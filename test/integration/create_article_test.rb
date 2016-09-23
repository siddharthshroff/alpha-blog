require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "Sid", email: "sid@example.com", password: "password")
  end
  
  test "test create an article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: { title: "test", description: "this is a test description" }
    end
    assert_template 'articles/show'
    assert_match "test", response.body
  end
  
end