module Api
  module V1
    class SurveysController < ApiController
      include Secured
      before_action :set_survey, only: [:show, :update_selected, :destroy]

      def index
        surveys = Survey.all
        render json: { status: "SUCCESS", message: "Loaded questions", data: surveys }
      end
    
      def show
        render json: { status: "SUCCESS", message: "Loaded questions", data: @survey.questions }
      end
    
      def create
        survey = Survey.new(survey_params)
        if survey.save
            render json: { status: 'SUCCESS', data: survey }
        else
            render json: { status: "ERROR", data: survey.errors }
        end
      end
    
      def destroy
        @survey.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the post', data: @survey }
      end

    def update_selected
      if Survey.update_all(selected: false) && @survey.update(selected_params)
        render json: { status: 'SUCCESS', message: 'Updated the post', data: @survey }
      else
        render json: { status: 'ERROR', message: 'Not updated', data: @survey.errors }
      end
    end

    private

    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:name)
    end

    def selected_params
      params.require(:survey).permit(:selected)
    end

    end    
  end
end
