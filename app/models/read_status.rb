class ReadStatus < ApplicationRecord

  belongs_to :user
  belongs_to :book

  # def read_by_user(self)
  #   self where(user_id: @user.id, value: true)
  # end
  #
  # scope :unread_by_user, -> { where(user_id: @user.id, value: false) }


end
