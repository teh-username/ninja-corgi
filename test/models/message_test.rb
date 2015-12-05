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
    invalid_first_names = [
      "",
      "    ",
      "h@xx0r",
      "a" * 31
    ]

    invalid_first_names.each do |first_name|
      @message.first_name = first_name
      assert_not @message.valid?
    end
  end

  test "last name should not be valid" do
    invalid_last_names = [
      "",
      "    ",
      "l33t",
      "a" * 31
    ]

    invalid_last_names.each do |last_name|
      @message.last_name = last_name
      assert_not @message.valid?
    end
  end

  test "email should not be valid" do
    invalid_emails = [
      "h@xxor..com", 
      "kylo.com", 
      "kylo@com", 
      "kylo_at_ren.org", 
      "" ,
      "     ", 
      ("kylo@ren.com" * 255)
    ]

    invalid_emails.each do |email|
      @message.email = email
      assert_not @message.valid?
    end
  end

  test "subject should not be valid" do
    invalid_subjects = [
      "",
      "   ",
      "a" * 31
    ]

    invalid_subjects.each do |subject|
      @message.subject = subject
      assert_not @message.valid?
    end
  end

  test "content should not be valid" do
    invalid_contents = [
      "",
      "   ",
      "a" * 256
    ]

    invalid_contents.each do |content|
      @message.content = content
      assert_not @message.valid?
    end
  end

  test "email should be lowercase" do
    email = "KyLO@REN.com"
    @message.email = email
    @message.save
    assert_equal email.downcase, @message.reload.email
  end
end
