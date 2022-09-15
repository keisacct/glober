class AnswersController < ApplicationController
    before_action :authenticate_user!, only: %i[ new create edit update destroy ]
    before_action :set_question, only: %i[ new create edit update destroy ]
    before_action :set_answer, only: %i[ edit update destroy ]
    before_action :move_to_question_page, only: %i[ edit update destroy ]

    def new
        @answer = @question.answers.build
    end

    def create
        @answer = @question.answers.create(answer_params)

        respond_to do |format|
            if @answer.save
                format.html { redirect_to question_url(@question), notice: "回答の投稿が完了しました。" }
                format.json { render question_path(@question), status: :created, location: @answer }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @answer.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end
    
    def update
      # binding.pry
      respond_to do |format|
        if @answer.update(answer_params)
          format.html { redirect_to question_url(@answer.question_id), notice: "回答が編集されました。" }
          format.json { render question_path(@answer.question_id), status: :ok, location: @answer }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @answer.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def destroy
      # if current_user.id == @answer.user.id
      respond_to do |format|
        if @answer.destroy
          format.html { redirect_to question_url(@answer.question_id), notice: "回答が完全に削除されました。" }
          format.json { render question_path(@answer.question_id), status: :ok, location: @answer }
        end
      end
      # else
        # render question_path(@answer.question_id), error: "回答を削除できませんでした。"
      # end
    end

    private

    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    def answer_params
      set_question
      params.require(:answer).permit(:content).merge(user_id: current_user.id, question_id: @question.id)
    end

    def move_to_question_page
      set_question
      set_answer
      if current_user.id != @answer.user.id
        redirect_to question_path(@question)
      end
    end


end
