module Api
    module V1
        class JobnumbersController < ApplicationController
            include Secured
            def index
                jobnumbers = Jobnumber.all
                render json: { status: "SUCCESS", message: "Loaded jobnumbers", data: jobnumbers }
            end

            def update
                jobnumber = Jobnumber.find(params[:id])
                if jobnumber.update(jobnumber_params)
                    render json: { status: 'SUCCESS', message: 'Updated the jobnumber', data: jobnumber }
                else
                    render json: { status: 'ERROR', message: 'Not updated', data: jobnumber.errors }
                end
            end

            private

            def jobnumber_params
                params.require(:jobnumber).permit(:number)
            end
        end
    end
end

