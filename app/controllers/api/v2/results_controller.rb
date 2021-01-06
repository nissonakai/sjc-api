module Api
    module V2
        class ResultsController < ApplicationController
            def send_mail
                result = Result.new(result_params)
                if result.save
                    render json: { status: 'SUCCESS', data: result }
                else
                    render json: { status: "ERROR", data: result.errors }
                end
            end

            def index
                results = Result.all
                render json: { status: 'SUCCESS', data: results }
            end

            def result_params
                params[:result].permit(:age, :sex, :area, :status, :distance, :importance, :values_result, :personality_result)
            end

        end
    end
end