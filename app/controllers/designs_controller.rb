class DesignsController < ApplicationController
  def index
    @designs = Design.all
  end

  def show
    @design = Design.find params[:id]
  end

  def edit
    @design = Design.find params[:id]
  end

  def update
    @design = Design.find params[:id]
    if @design.update design_params
      redirect_to @design
    else
      render 'edit'
    end
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new design_params
    if @design.save
      redirect_to @design
    else
      render 'new'
    end
  end

  def destroy
    @design = Design.find params[:id]
    @design.destroy

    redirect_to designs_path
  end

  private
    def design_params
      params.require(:design).permit(:name, :description, :image)
    end
end
