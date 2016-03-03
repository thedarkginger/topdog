class ParticipationAnswer < ActiveRecord::Base
  
  belongs_to :participation
  belongs_to :answer

end