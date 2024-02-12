# frozen_string_literal: true

def json
  result = JSON.parse(response.body)
  if result.is_a?(Array)
    result
  else
    ActiveSupport::HashWithIndifferentAccess.new(result)
  end
end
