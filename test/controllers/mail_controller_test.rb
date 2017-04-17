require 'test_helper'

class MailControllerTest < ActionController::TestCase
  test "should get mail_form" do
    get :mail_form
    assert_response :success
  end

end
