module Api
    module V2
        class QuestionsController < ApplicationController
            include Secured

            def index
                questions = Question.all
                render json: { status: "SUCCESS", message: "Loaded questions", data: questions }
            end
        end
    end
    
end
