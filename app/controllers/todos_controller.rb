class TodosController < ApplicationController
  
  def index
    run Todo::Operation::Index do |result|
      return render cell(Todo::Cell::Index, @model)
    end
  end
end
