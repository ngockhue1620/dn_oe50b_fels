class LessionsController < ApplicationController
  def index
    @lessions = Lession.paginate(page: params[:page], :per_page => 6)
  end

  def show
    @lession = Lession.find_by(id: params[:id])
    if @lession.present?
      @lession
    else
      flash[:warning] = t "lessions.not_found"
    end
  end

  def new
    @lession = Lession.new
  end

  def edit
    @lession = Lession.find_by(id: params[:id])
    if @lession.present?
      @lession
    else
      flash[:danger] = t "mess.have_error"
      redirect_to root_url
    end
  end

  def create
    @lession = Lession.new(lession_params)
    if @lession.save
      redirect_to @lession
    else
      flash[:danger] = t "mess.have_error"
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

  def destroy
    @lession = Lession.find_by(id: params[:id])
    if @lession.present?
      if @lession.destroy
        flash[:success] =  t "mess.success"
        redirect_to lessions_path
      else
        flash[:danger] = t "mess.have_error"
        redirect_to lessions_path
      end
    else
      flash[:danger] = t "lessions.not_found"
      redirect_to lessions_path
    end
  end

  private

  def set_lession
    @lession = Lession.find(params[:id])
  end

  def lession_params
    params.require(:lession).permit(:name, :description, :image, :duration)
  end
end
