class DesignsController < ApplicationController
  def show
    @design = Design.find params[:id]
  end

  def create
    @design = Design.new design_params
    @design.save
    redirect_to @design
  end

  def new
    @design = Design.new
  end

  private
    def design_params
      params.require(:design).permit(:name, :description, :image)
    end
end
