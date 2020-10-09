module Todo::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Todo, :new)
      step Contract::Build( constant: Todo::Contract::Form )
    end

    step Subprocess(Present) # present classのstep呼び出し
    step Contract::Validate(key: :todo) # contractを使ってバリデーション
    step Contract::Persist() # モデルに保存する
  end
end