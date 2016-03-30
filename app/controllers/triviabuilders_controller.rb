class TriviabuildersController < ApplicationController
def create
    @question = Question.new(params[:question])
    if @question.save
        redirect_to triviabuilders_path,  :notice => "Your post was saved"
     else
       render "new"
     end
   end

   private
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
      params.require(:question).permit(:question_text)
    end
end