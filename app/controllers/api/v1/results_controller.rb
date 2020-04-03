module Api
    module V1
        class ResultsController < ApplicationController
            def send_mail
                @result = Result.new(result_params)
                if @result.email
                    ResultMailer.result_email(@result).deliver
                    @result.scrape_data(Jobnumber.number_list(@result.result_title, @result.area_category))
                    render json: { status: 'SUCCESS', data: @result.recommend }
                else
                    render json: { status: "ERROR" }
                end
            end

            def result_params
                params[:result].permit(:email, :age, :job, :wage, :sex, :prefecture_id, :dormitory, :answers, :result_title)
            end

        end
    end
end