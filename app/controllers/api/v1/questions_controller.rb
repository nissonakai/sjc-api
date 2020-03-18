module Api
    module V1
        class QuestionsController < ApplicationController
            before_action :set_question, only: [:update, :destroy]

            def index
                questions = Question.all
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions }
            end

            def show
                questions = Question.where(survey_id: params[:id])
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions }
            end

            def create
                question = Question.new(question_params)
                if question.save
                    render json: { status: 'SUCCESS', data: question }
                else
                    render json: { status: "ERROR", data: question.errors }
                end
            end

            def destroy
                question.destroy
                render json: { status: 'SUCCESS', message: 'Deleted the post', data: question }
            end

            def update
                if question.update(question_params)
                  render json: { status: 'SUCCESS', message: 'Updated the post', data: question }
                else
                  render json: { status: 'ERROR', message: 'Not updated', data: question.errors }
                end
            end
        
            private
      
            def set_question
              question = Question.find(params[:id])
            end
      
            def question_params
              params.require(:question).permit(:title, :category, :survey_id)
            end
        end
    end
    
end
