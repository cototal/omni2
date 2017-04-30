class Notes::CategoriesController < ApplicationController
  def index
    @notes_categories = ::Notes::Category.all
  end

  def show
    @notes_category = ::Notes::Category.find(params[:id])
  end
end
