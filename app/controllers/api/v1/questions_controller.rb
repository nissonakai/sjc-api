module Api
    module V1
        class QuestionsController < ApplicationController
            include Secured

            def index
                questions = Question.all.includes(:personality)
                personalities = questions.map {|question| question.personality }
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions, personalities: personalities }
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
                question = Question.find(params[:id])
                question.destroy
                render json: { status: 'SUCCESS', message: 'Deleted the post', data: question }
            end

            def update
                question = Question.find(params[:id])
                if question.update(question_params)
                  render json: { status: 'SUCCESS', message: 'Updated the post', data: question }
                else
                  render json: { status: 'ERROR', message: 'Not updated', data: question.errors }
                end
            end
        
            private
            
            def question_params
              params.require(:question).permit(:title, :category, :survey_id, personality_attributes: [:type1, :type2, :type3, :type4, :type5, :type6])
            end
        end
    end
    
end
