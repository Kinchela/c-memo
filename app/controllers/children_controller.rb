class ChildrenController < ApplicationController

  def index
    if user_signed_in?
      @child = current_user.children.build
      @child.records.build
      @height_data = current_user.children.map do |child|
        {
          name: child.name,
          data: child.records.order(date: :asc).pluck(:date, :height).to_h
        }
      end
      @weight_data = current_user.children.map do |child|
        {
          name: child.name,
          data: child.records.order(date: :asc).pluck(:date, :weight).to_h
        }
      end
    end
  end

  def create
    name = data_params[:name]
    records_attributes = data_params[:records_attributes]

    @child = current_user.children.find_by(name: name)

    if @child.nil?
      @child = current_user.children.build(data_params)
    else
      records_attributes.each do |index, records_attribute|
        date = records_attribute[:date]
        height = records_attribute[:height]
        weight = records_attribute[:weight]
        @child.records.build(date: date, height: height, weight: weight)
      end
    end

    if @child.save 
      flash[:success] = 'chart successfully created.'
      redirect_to children_path
    else
      flash.now[:alert] = 'Error creating child.'
      render 'children/index', status: :unprocessable_entity
    end
  end

  private

  def data_params
    params.require(:child).
      permit(:name, records_attributes: [:id, :child_id, :date, :height, :weight, :_destroy])
  end
end

