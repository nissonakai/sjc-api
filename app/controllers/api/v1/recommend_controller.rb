module Api
    module V1
        class RecommendController < ApplicationController
            def recommend
                @recommends = Recommend.new
                @recommends.get_data("?category=寮あり%2C30万円～%2C35万円～%2C日勤のみ")
                render json: { status: 'SUCCESS', message: 'recommended', data: @recommends.datas }
            end
        end
    end
end