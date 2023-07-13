class ChildrenController < ApplicationController

  def index
    @children = current_user.children.order(:date).all
    @children_by_day = @children.group_by { |child| child.date.to_date } unless @children.empty?

    puts @children_by_day.inspect
  end
 
  def create
    @child = current_user.children.build(data_params)
    # @child = Child.new(data_params)
    puts data_params.inspect
    if @child.save 
      puts "Child record saved successfully."
      redirect_to children_path, notice: 'Child successfully created.'
    else
      puts "Error saving child record: #{@child.errors.full_messages}"
      flash.now[:alert] = 'Error creating child.'
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  private
  
  def data_params
    params.require(:child).permit(:name, :date, :height)
  end
end
