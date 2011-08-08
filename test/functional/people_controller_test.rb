require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil :postcodes
    assert_not_nil :email_domains

    assert_search_form
  end

  test "should perform gmail search" do
    get :index, {:email_option => "include", :email => ["gmail"]}

    assert_response :success
    assert_not_nil :postcodes
    assert_not_nil :email_domains
    #should find 4 users
    assert_equal(4, assigns(:people).length)
    assert_search_form
  end

  test "should perform exclude postcode 2000 and 2060 search and yahoo search" do
    get :index, {:postcode_option => "exclude", :postcode => [2000, 2060], :email_option => "include", :email => ["yahoo"]}

    assert_response :success
    assert_not_nil :postcodes
    assert_not_nil :email_domains
    #should find 3 users
    assert_equal(3, assigns(:people).length)
    assert_search_form
  end

end
