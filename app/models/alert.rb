class Alert < ApplicationRecord
  scope :latest, -> { order(created_at: :desc) }

  scope :with_errors, -> (show_error) {
    show_error ? where("message LIKE '%ERROR%'") : where("message NOT LIKE '%ERROR%'") 
  }

  scope :containing_symbols, -> (symbols) { 
    where("message LIKE ANY (array[?])", symbols.map{ |symbol| "%#{symbol}%" })
  }
end
