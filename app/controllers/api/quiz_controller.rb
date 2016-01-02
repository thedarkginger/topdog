module API
  class QuizController < ::ApplicationController
    def start

      #! sets category from column for questions to show - can one controller allow multiple categories?
      @participation = current_user.participations.create(category: 'history')
    end

    def show_question
      if current_question.nil?
        participation.update finished: true
        render json: { finished: true }
      end
    end

    def validate_answer
      result = current_question.correcta == params[:answer].to_i

      participation.increment! :current_question_index
      participation.increment! :score if result

      render json: { result: result }
    end

    def skip_question
      participation.increment! :current_question_index
      render json: {}
    end

    private

    def participation
      @participation = current_user.participations.where(
        finished: false,
        id: params[:participation_id]
      ).first
    end

    def current_question
      @current_question = History
        .where(category: participation.category)
        .order(id: :asc)[participation.current_question_index]
    end
  end
end
