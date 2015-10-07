
class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates_uniqueness_of :answer_id, scope: :user_id

end