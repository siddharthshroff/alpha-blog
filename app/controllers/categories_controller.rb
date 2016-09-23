class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:edit, :update, :show]
  
  def new 
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created"
      redirect_to categories_path
    else 
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @category.update(category_params)
      flash[:success] = "Category was successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  
  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
  
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "You cannot add or edit categories"
      redirect_to categories_path
    end
  end
  
  def set_category
    @category = Category.find(params[:id])
  end

end 
