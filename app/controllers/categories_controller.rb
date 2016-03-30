class CategoriesController < ApplicationController
  before_action :authenticate_user!, only:[:create,:new,:destroy,:update]
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new category_params

    if @category.save
      redirect_to @category, notice: "Kategori Eklendi"
    else
      render 'new'
    end
  end

  def show
      @category = find_category
  end


  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
