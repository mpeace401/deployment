class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def delete
    @item = Items.find(params[:id])
  end

  def destroy
  end
end
