class CategoriesController < ApplicationController
  def index
    # pagination cursor based, using default limit 10
    last_seen = params[:last_seen] || 0
    @categories = Category.where("id > ?",last_seen).limit(10)
  end

  def create
    @category = Category.new(categories_params)
    respond_to do |format|
      if @category.save
        # [TODO] add I18n
        format.html { redirect_to categories_path, notice: 'Category created successfully' }
      else
        format.htm { render :new , status: 'Unprocessable_entity' }
      end
    end
  end

  private
  def categories_params
    params.permit(:name, :description)
  end
end
