class CategoriesController < ApplicationController
  layout false 
  def create
    @category = Category.new(category_params)
    if @category.save!
      redirect_to @category
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end


  def get_sub_by_category
     @subcategories = Subcategory.where(category_id: params[:category_id])
     render :json => @subcategories
  end

  private
  def category_params
    params.require(:category).permit(:name, :user_id)
  end
end
