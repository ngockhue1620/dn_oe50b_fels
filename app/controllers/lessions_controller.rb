class LessionsController < ApplicationController
  def index
    @lessions = Lession.all
  end

  def show; end

  def new
    @lession = Lession.new
  end

  def edit; end

  def create; end

  def update; end

  def destroy; end

  private

  def set_lession
    @lession = Lession.find(params[:id])
  end

  def lession_params
    params.require(:lession).permit(:name)
  end
end
