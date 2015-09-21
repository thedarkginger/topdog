module API
  class QuizController < ::ApplicationController
    def show_question
      @history = History.where(category: 'history').order(id: :asc)[params[:index].to_i-1]

      if @history.nil?
        render json: { finished: true }
      end
    end

    def validate_answer
      history = History.where(category: 'history').order(id: :asc)[params[:index].to_i-1]

      render json: { result: (history.correcta == params[:answer].to_i) }
    end
  end
end
