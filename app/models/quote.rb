class Quote < ApplicationRecord
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }

  # Users who share broadcastings should have the lambda return an array with the same values.
  # Users who shouldn't share broadcastings should have the lambda return an array with different values.
  broadcasts_to ->(quote) { [ quote.company, "quotes" ] }, inserts_by: :prepend

  belongs_to :company
end
