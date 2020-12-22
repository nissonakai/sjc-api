module Api
    module V2
        class ResultsController < ApplicationController
            def send_mail
                @result = Result.new(result_params)
                ResultMailer.result_email(@result).deliver_later
                if @result.email != ""
                    ResultMailer.recommend_email(@result).deliver_later
                end
                render json: { status: 'SUCCESS', data: @result }
            end

            def result_params
                params[:result].permit(:age, :email, :sex, :area, :status, :distance, :importance, :valuesResult, :valuesDesc, :valuesImportance, :personalityResult, :personalityDesc)
            end

        end
    end
end