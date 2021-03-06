class TodosController < ApplicationController
  
  def index
    run Todo::Operation::Index do |result|
      return render cell(Todo::Cell::Index, @model)
    end
  end

  def new
    run Todo::Operation::Create::Present do |result|
      render cell(Todo::Cell::New, @form)
    end
  end

  def create
    run Todo::Operation::Create do |result|
      return redirect_to todos_path
    end
    return render cell(Todo::Cell::New, @form)
  end

  def show
    run Todo::Operation::Show do |result|
      return render cell(Todo::Cell::Show, result["model"])
    end
    return redirect_to todos_path, alert: result["errors"] # Todo Not Found
  end

  def edit
    run Todo::Operation::Update::Present do |result|
      render cell(Todo::Cell::Edit, @form)
    end
  end

  def update
    run Todo::Operation::Update do |result|
      return redirect_to todos_path
    end
    return render cell(Todo::Cell::Edit, @form)
  end

  def destroy
    run Todo::Operation::Delete
    redirect_to todos_path
  end
end
