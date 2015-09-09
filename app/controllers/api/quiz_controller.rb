module API
  class QuizController < ::ApplicationController
    def show_question
      @history = History.where(id: params[:id]).first

      if @history.nil?
        render json: { finished: true }
      end
    end

    def validate_answer
      history = History.where(id: params[:id]).first

      render json: { result: (history.correcta == params[:answer].to_i) }
    end
  end
end
