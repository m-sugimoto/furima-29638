class ItemsController < ApplicationController
before_action :authenticate_user!, only:[:new, :create, :edit, :update] 
before_action :set_item, only: [:show, :edit, :update]
before_action :login_check, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
    @items = Item.includes(:user)
  end  

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path 
    else
     render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render 'edit'
    end
  end

    #def destory
      #item.destory
    #end

  private
  def item_params
    params.require(:item).permit(:image, :commodity, :explan, :category_id, :status_id, :prefecture_id, :postage_id, :sendingday_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def login_check
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end
end


