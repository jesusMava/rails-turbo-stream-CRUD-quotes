class Quote < ApplicationRecord
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "quotes",
    partial: "quotes/quote",
    locals: { quote: self }
    #  the target option will be equal to model_name.plural
    # by convention, we can remove the target option
    # target: "quotes"
  }

   # you could also write this code and it's the same:
   # after_create_commit -> { broadcast_prepend_to "quotes" }

   # now we uptade option
   after_update_commit -> { broadcast_replace_to "quotes" }
   #and with delet
   after_destroy_commit -> { broadcast_remove_to "quotes" }
end
