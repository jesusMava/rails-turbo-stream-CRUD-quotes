class Quote < ApplicationRecord
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }

   after_create_commit -> { broadcast_prepend_later_to "quotes" }

   # you could also write this code and it's the same:
   # after_create_commit -> { broadcast_prepend_to "quotes" }

   # now we uptade option
   after_update_commit -> { broadcast_replace_later_to "quotes" }
   # and with delet
   after_destroy_commit -> { broadcast_remove_to "quotes" }
end
