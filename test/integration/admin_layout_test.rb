require 'test_helper'

class AdminLayoutTest < ActionDispatch::IntegrationTest

  test "redirect non-logged in user to homepage" do
    get admin_path
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'main/index'
  end

  # Have to mock captcha first, maybe someday
  # test "should display admin dashboard on legit user" do
  #   log_in_as(users(:finn))
  #   get admin_path

  #   assert_template 'admin/index'

  #   # check home link
  #   assert_select "a[href=?]", root_path, count: 1

  #   # check logout link
  #   assert_select "a[href=?]", logout_path, count: 1

  #   # check admin index links
  #   assert_select "a[href=?]", admin_path, count: 2

  #   # check messages link
  #   assert_select "a[href=?]", admin_messages_path, count: 1
  # end
end
