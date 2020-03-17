module Api
    module V1
        class ResultsController < ApplicationController
            def send
                result_params = params[:result].permit(:email, :age, :job, :wage, :sex)
                result = Result.new(result_params)
                if result.email
                    # ResultMailer.welcome_email(result.email, result.age, result.job, result.wage, result.sex).deliver_now
                    redirect_to '/api/v1/questions'
                else
                    render json: { status: "ERROR" }
                end
            end
        end
    end
end