class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :explanation, :category_id, :condition_id, :burden_id, :prefecture_id,
                                 :estimated_shopping_date_id, :price).merge(user_id: current_user.id)
  end
end
