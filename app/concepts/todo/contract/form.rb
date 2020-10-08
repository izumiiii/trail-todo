module Todo::Contract
  class Form < Reform::Form
      include Reform::Form::ActiveModel
      property :title
      property :description
      property :completed
      
      validates :title, presence: true
      validates :description, length: { minimum: 2 }
  end
end