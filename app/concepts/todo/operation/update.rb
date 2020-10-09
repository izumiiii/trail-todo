module Todo::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Todo, :find_by)
      step Contract::Build( constant: Todo::Contract::Form )
    end

    step Subprocess(Present)
    step Contract::Validate( key: :todo )
    step Contract::Persist()
  end
end
