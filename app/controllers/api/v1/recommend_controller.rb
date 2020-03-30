module Api
    module V1
        class RecommendController < ApplicationController
            def recommend
                number_list = ["121356", "121355", "324338"]
                @recommends = Recommend.new
                @recommends.scrape_data(number_list)
                render json: { status: 'SUCCESS', message: 'recommended', data: @recommends.data }
            end
        end
    end
end