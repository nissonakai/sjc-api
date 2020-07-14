module Api
    module V1
        class ResultsController < ApiController
            def send_mail
                @result = Result.new(result_params)
                if @result.age && @result.sex && @result.prefecture_id
                    ResultMailer.result_email(@result).deliver
                    @result.scrape_data(Jobnumber.number_list(@result.result_id, @result.area_id))
                    if @result.email != ""
                        ResultMailer.recommend_email(@result).deliver
                    end
                    render json: { status: 'SUCCESS', data: @result.recommend }
                else
                    render json: { status: "ERROR" }
                end
            end

            def result_params
                params[:result].permit(:email, :age, :job, :wage, :sex, :prefecture_id, :dormitory, :answers, :result_title, :result_id)
            end

        end
    end
end