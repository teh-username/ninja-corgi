require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "check header" do
    # get index page
    get root_path
    assert_template 'main/index'

    # check two hyperlinks back to root
    assert_select "a[href=?]", root_path, count: 2

    # check hyperlink to about
    assert_select "a[href=?]", about_path

    # check hyperlink to portfolio
    assert_select "a[href=?]", portfolio_path

    # check hyperlink to contact me
    assert_select "a[href=?]", contact_path

  end
end
