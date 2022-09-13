class AnswersController < ApplicationController
    before_action :set_question, only: %i[ new create ]

    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(answer_params)
        @answer.save
        # respond_to do |format|
        #     if @answer.save
        #         format.html { redirect_to answer_url(@answer), notice: "投稿が完了しました。" }
        #         format.json { render :show, status: :created, location: @answer }
        #     else
        #         format.html { render :new, status: :unprocessable_entity }
        #         format.json { render json: @answer.errors, status: :unprocessable_entity }
        #     end
        # end
    end


    private

    def set_question
        @question = Question.find(params[:question_id])
    end

    def answer_params
        set_question
        params.require(:answer).permit(:content).merge(user_id: current_user.id, question_id: @question.id)
    end


end
