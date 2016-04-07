module API
  class QuizController < ::ApplicationController
    def start
      puts "params.inspect start method: #{params.inspect}"
      puts ":game_id #{session[:game_id]}"
      @participation = current_user.participations.create(game_id: session[:game_id])


    end

    def show_question
      if current_question.nil?
        participation.update finished: true
        render json: { finished: true }
      end
    end

    def validate_answer
      puts "inside validate_answer"
      puts "PARAMS: #{params.inspect}"
      puts "q. answers: #{current_question.answers.pluck(:correct_answer).inspect}"
      correct_answer_index = current_question.answers.pluck(:correct_answer).index(true) + 1
      puts "correct_answer_index: #{correct_answer_index.inspect}"

      result = correct_answer_index == params[:answer].to_i
      
      puts "result: #{result.inspect}"

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
      puts "inside_current_question: #{params.inspect}"
      puts "participation_current_index: #{participation.current_question_index}"
      puts "category_id #{session[:game_id]}"
      @current_question = Question.where(category_id: session[:game_id].to_i).order(id: :asc)[participation.current_question_index]


    end
  end
end
