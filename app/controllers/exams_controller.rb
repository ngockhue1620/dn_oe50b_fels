class ExamsController < ApplicationController

  def show
    @lession = Lession.find_by(id: params[:id])
    if @lession.present?
      # tạo mới một cái exam cho user
      @exam = Exam.new(user_id: session[:user_id], lession_id: params[:id], score: 0)
      @exam.save
      # khỏi tạo 1 sesion exam
      session[:exam_id] = @exam.id
      # lấy câu hỏi trong ngân hàng câu hỏi thuộc về 1 lession
      @questions = @lession.questions
    else
      flash[:warning] = t "lessions.not_found"
      redirect_to lessions_path
    end
  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams or /exams.json
  def create
    # khi chọn đáp án xong và submit -> data nhận về là một chuổi hash
    # question => { "question_id" => "answer_id"}
    @questions_id = exam_params[:question].keys # key của 1 hash là question id của câu hỏi
    @user_selected = exam_params[:question]
    @lession = Lession.find_by(id: exam_params[:lession_id]) # check xem lession có tồn tại
    @exam = Exam.find_by(id: session[:exam_id]) # tìm xem thử người dùng này đã có 1 seesion bắt đầu thì chưa
    if @lession.present? && @exam.present?
      @questions = Question.where(id: @questions_id).includes(:answers) # đọc bộ câu hỏi ra
      @score = 0 # điểm bằng 0
      @questions.each do |question|

        question.answers.each do |answer|
          # nếu đáp án người ta chọn bằng với đáp án đúng trong db thì tăng điểm lên
          if exam_params[:question][question.id.to_s.to_sym].to_i == answer.id && answer.is_right == true
            @score += 1
          end
        end
        # lưu lịch sử đáp án người ta chọn với 1 câu hỏi
        @exam_detail =  ExamDetail.new(
          exam: @exam,
          question: question,
          answer_id: exam_params[:question][question.id.to_s.to_sym]
        )
        @exam_detail.save
      end
      @exam.score = @score
      @exam.save
      redirect_to "/exams_details/#{session[:exam_id]}"
    else
      flash[:warning] = t "lessions.not_found"

    end


  end

  # PATCH/PUT /exams/1 or /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: "Exam was successfully updated." }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1 or /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: "Exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def exam_params
      params.require(:exam).permit(:lession_id, :exam_id,:question => {})
    end
end
