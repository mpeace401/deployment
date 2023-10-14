class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new()
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.available = true
    if Item.count != 0
      count = Item.last.id + 1
      @item.id = count
    else
      @item.id = 1
    end
    
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

  def update
  end

  def delete
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully removed." }
      format.json { head :no_content }
    end
  end

  def member_items
    @items = Item.where(available: true)
  end

  def export
    @items = Item.all

    # respond_to do |format|
    #   format.csv {send_data @items.to_csv, filename: "items-#{Date.today}.csv"}
    # end
    send_data @items.to_csv, filename: "items-#{Date.today}.csv"
  end

  def import
    if params[:file].present?
      csv_text = File.read(params[:file].path)
      csv = CSV.parse(csv_text, headers: true)
      csv.each do |row|
        item_hash = row.to_hash
        item_hash["available"] = case item_hash["available"].downcase.strip
                                 when 'true', 't', '1'
                                   true
                                 else 
                                   false # Default value when it's not explicitly true.
                                 end
        
        item = Item.find_or_initialize_by(id: item_hash["id"])
        item.update!(item_hash)
      end
  
      redirect_to items_path, notice: "Items imported successfully!"
    else
      redirect_to items_path, alert: "Please upload a CSV file."
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to items_path, alert: "There was an issue with importing items. Error: #{e.message}"
  end   
  
  private
    def item_params 
      params.require(:item).permit(:name, :serial_number, :description)
    end
end
