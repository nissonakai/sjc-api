module Api
    module V2
        class ValuesQuestionsController < ApplicationController
            include Secured

            def current
                current_survey = Survey.find_by(selected: true)
                questions = ValuesQuestion.where(survey_id: current_survey.id)
                render json: { status: "SUCCESS", message: "Loaded current values_questions", data: questions }
            end

            def index
                questions = ValuesQuestion.all
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions }
            end

            def show
                questions = ValuesQuestion.where(survey_id: params[:id])
                render json: { status: "SUCCESS", message: "Loaded question", data: questions }
            end

            def create
                question = ValuesQuestion.new(question_params)
                if question.save
                    render json: { status: 'SUCCESS', data: question }
                else
                    render json: { status: "ERROR", data: question.errors }
                end
            end

            def update
                question = ValuesQuestion.find(params[:id])
                if question.update(question_params)
                  render json: { status: 'SUCCESS', message: 'Updated the post', data: question }
                else
                  render json: { status: 'ERROR', message: 'Not updated', data: question.errors }
                end
            end

            def destroy
                question = PersonalityQuestion.find(params[:id])
                question.destroy
                render json: { status: 'SUCCESS', message: 'Deleted the post', data: question }
            end

            private
            def question_params
                choices = [*(1..4)].map {|num| "choice#{num}".to_sym }
                params.require(:question).permit(:title, :category, :survey_id, :type, *choices)
            end
        end
    end
end
