class LessionsController < ApplicationController
  def index
    @lessions = Lession.all
  end

  def show
    @lession = Lession.find_by(id: params[:id])
    if @lession.present?
      @lession
    else
      flash[:warning] = t "courses.not_found"
    end
  end

  def new
    @lession = Lession.new
  end

  def edit
    @lession = Lession.find_by(id: params[:id])
    return  @lession
  end

  def create
    @lession = Lession.new(lession_params)
    if @lession.save
      redirect_to @lession
    else
      flash[:danger] = t "me"
      render :new
    end
  end

  def update
    @lession = Lession.find_by(id: params[:id])

    if @lession.update(lession_params)
      redirect_to @lession
    else
      render :edit
    end
  end

  def destroy; end

  private

  def set_lession
    @lession = Lession.find(params[:id])
  end

  def lession_params
    params.require(:lession).permit(:name, :description, :image, :duration)
  end
end
