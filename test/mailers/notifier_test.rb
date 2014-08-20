require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "new_released" do
    mail = Notifier.new_released
    assert_equal "New released", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
