module Todo::Operation
  class Index < Trailblazer::Operation
    step :fetch_todos

    def fetch_todos(ctx, **)
      ctx[:model] = Todo.all
    end
  end
end