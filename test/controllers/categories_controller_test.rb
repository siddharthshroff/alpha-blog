require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "Sports")
    @user = User.create(username: "Sid", email: "sid@example.com", password: "password", admin: true)
  end
  
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get categories new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get categories show " do
    get(:show, 'id': @category.id)
    assert_response :success
  end
  
  test "should redirect when admin user is not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: { name: "Sports" }
    end
    assert_redirected_to categories_path
  end
  
  
end
