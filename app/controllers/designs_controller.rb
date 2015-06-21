class DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def show
    @design = Design.find params[:id]
  end

  def create
    @design = Design.new design_params
    if @design.save
      redirect_to @design
    else
      render 'new'
    end
  end

  def new
    @design = Design.new
  end

  private
    def design_params
      params.require(:design).permit(:name, :description, :image)
    end
end
