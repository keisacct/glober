class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_question, only: %i[ show edit update destroy ]
  impressionist :actions=> [:show]


  # GET /questions or /questions.json
  def index
    @questions = Question.order(created_at: :desc).page(params[:page]).per(12)
  end

  # GET /questions/1 or /questions/1.json
  def show
    @answers = Answer.where(question_id: @question.id)
    if @question.best_answer_id.present?
      @best_answer = Answer.where(question_id: @question.id).find_by(id: @question.best_answer_id)
    end
    impressionist(@question, nil, unique: [:session_hash])
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: "投稿が完了しました。" }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "完了しました。" }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "質問は完全に削除されました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :content, :best_answer_id).merge(user_id: current_user.id)
    end
end
