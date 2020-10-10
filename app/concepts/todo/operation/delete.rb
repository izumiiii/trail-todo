module Todo::Operation
  class Delete < Trailblazer::Operation
    step Model(Todo, :find_by)
    step :destroy

    def destroy(ctx, model:, **)
      model.destroy
    end
  end
end