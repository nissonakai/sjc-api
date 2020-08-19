module Api
    module V2
        class PersonalityQuestionsController < ApplicationController
            include Secured

            def current
                current_survey = Survey.find_by(selected: true)
                questions = PersonalityQuestion.where(survey_id: current_survey.id)
                render json: { status: "SUCCESS", message: "Loaded current personality_questions", data: questions }
            end

            def index
                questions = PersonalityQuestion.all
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions }
            end

            def show
                questions = PersonalityQuestion.where(survey_id: params[:id])
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions }
            end

            def create
                question = PersonalityQuestion.new(question_params)
                if question.save
                    render json: { status: 'SUCCESS', data: question }
                else
                    render json: { status: "ERROR", data: question.errors }
                end
            end

            def update
                question = PersonalityQuestion.find(params[:id])
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
                counts = [*(1..6)].map {|num| "count#{num}".to_sym }
                choices = [*(1..2)].map {|num| "choice#{num}".to_sym }
                params.require(:question).permit(:title, :category, :survey_id, :type, *counts, *choices)
            end
        end
    end
end
