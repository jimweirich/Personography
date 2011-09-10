RSpec::Matchers.define :be_invalid_on do |field, expected_message=nil|
  match do |model|
    if model.valid?
      @message = "Expected #{model} to be invalid"
      false
    elsif model.errors[field].empty?
      @message = "Expected #{model} to have errors on #{field}"
      false
    else
      error_messages = model.errors[field].join(', ')
      if expected_message && expected_message !~ error_messages
        @message = "Expected error messages (#{error_messages}) to match #{expected_message}"
        false
      else
        true
      end
    end
  end

  failure_message_for_should do |actual|
    @message
  end

  failure_message_for_should_not do |actual|
    fail "do not use 'should_not' with be_invalid_on"
  end
end
