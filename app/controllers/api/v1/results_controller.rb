module Api
    module V1
        class ResultsController < ApplicationController
            def send
                result_params = params[:result].permit(:email, :age, :job, :wage, :sex, :place, :dormitory, :answers, :result_title)
                result = Result.new(result_params)
                if result.email
                    ResultMailer.result_email(result.email, result.age, result.job, result.wage, result.sex, result.place, result.dormitory, result.answers, result.result_title).deliver
                    redirect_to '/api/v1/questions'
                else
                    render json: { status: "ERROR" }
                end
            end
        end
    end
end