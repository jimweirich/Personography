RSpec::Matchers.define :be_valid_model do ||
  match do |model|
    if model.valid?
      true
    else
      @message = "Expected to be valid, but got errors: #{model.errors.full_messages.to_sentence}"
      false
    end
  end

  failure_message_for_should do |actual|
    @message
  end

  failure_message_for_should_not do |actual|
    fail "do not use 'should_not' with be_valid_model (use be_invalid_on instead)"
  end
end
