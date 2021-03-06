class Discussion < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, through: :comments
  belongs_to :user

  validates_presence_of :title, :content
end
