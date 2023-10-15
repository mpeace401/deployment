class ItemsController < ApplicationController

  # Display all items
  def index
    @items = Item.all
  end

  # Show details of a specific item
  def show
    @item = Item.find(params[:id])
  end

  # Initialize a new item instance for form rendering
  def new
    @item = Item.new
  end

  # Form for editing an item
  def edit
  end

  # Create a new item record
  def create
    @item = Item.new(item_params)
    @item.available = true

    # If there are existing items, set the new item ID to the next number.
    # Otherwise, set the ID to 1 for the first item.
    if Item.count != 0
      count = Item.last.id + 1
      @item.id = count
    else
      @item.id = 1
    end

    # Save the new item and redirect or render errors as necessary
    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
        flash[:notice] = "Successfully created item"
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # Update an item's details
  def update
  end
  

  # Confirm deletion of an item
  def delete
    @item = Item.find(params[:id])
  end

  # Remove an item from the database
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully removed." }
      format.json { head :no_content }
    end
  end

  def button_action
    @item = Item.find(params[:id])
    @item.update_attribute(:available, false)
    redirect_to items_path
  end

  # Display all items that are available
  def member_items
    @items = Item.where(available: true)
  end

  private

    # Strong parameters for item to prevent mass-assignment vulnerabilities
    def item_params
      params.require(:item).permit(:name, :serial_number, :description, :image, :available)
    end
end
