module Todo::Operation
  class Show < Trailblazer::Operation
    step Model(Todo, :find_by)
    fail :not_found

    def not_found(ctx, **)
      ctx[:errors] = "Todo Not Found"
    end
  end
end