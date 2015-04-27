json.array!(@answers) do |answer|
  json.extract! answer, :id, :answer, :question_id, :child_labour_id
  json.url answer_url(answer, format: :json)
end
