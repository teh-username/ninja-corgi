require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = Message.new(
      first_name: "Kylo", 
      last_name: "Ren", 
      email: "dark_side@force.com", 
      subject: "Join Us!", 
      content: "Join the empire for eternal glory!"
    )
  end

  test "message is valid" do
    assert @message.valid?
  end

  test "first name should be valid" do
    @message.first_name = "   "
    assert_not @message.valid?

    @message.first_name = "h@xx0r"
    assert_not @message.valid?

    @message.first_name = "a" * 31
    assert_not @message.valid?
  end

  test "last name should not be valid" do
    @message.last_name = "   "
    assert_not @message.valid?

    @message.last_name = "l33t"
    assert_not @message.valid?

    @message.first_name = "a" * 31
    assert_not @message.valid?
  end

  test "email should not be valid" do
    @message.email = "h@xxor..com"
    assert_not @message.valid?

    @message.email = "kylo.com"
    assert_not @message.valid?

    @message.email = "kylo@com"
    assert_not @message.valid?

    @message.email = "   "
    assert_not @message.valid?

    @message.email = "kylo@ren.com" * 255
    assert_not @message.valid?
  end

  test "subject should not be valid" do
    @message.subject = " "
    assert_not @message.valid?

    @message.subject = "a" * 31
    assert_not @message.valid?
  end

  test "content should not be valid" do
    @message.content = " "
    assert_not @message.valid?

    @message.content = "a" * 256
    assert_not @message.valid?
  end

  test "email should be lowercase" do
    email = "KyLO@REN.com"
    @message.email = email
    @message.save
    assert_equal email.downcase, @message.reload.email
  end
end
