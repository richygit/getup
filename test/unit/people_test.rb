require 'test_helper'

class PeopleTest < ActiveSupport::TestCase

  set_fixture_class :people => "People"

  # test finding hotmail users
  test "find_hotmail_people" do

    results = People.do_search("include", "hotmail", nil, nil)
    assert_equal(2, results.length)
    first = results[0]
    second = results[1]
    cody = people(:people_1)
    ted = people(:people_7)

    assert_equal(cody, first)
    assert_equal(ted, second)
  end

  # test finding people from postcode = 2000
  test "find_people_not_from_2000" do
    results = People.do_search(nil, nil, "exclude", [2000])
    assert_equal(8, results.length)

    assert_equal(people(:people_2), results[0]) #christian
    assert_equal(people(:people_10), results[1]) #clare
    assert_equal(people(:people_8), results[2]) #clinton
    assert_equal(people(:people_5), results[3]) #darren
    assert_equal(people(:people_3), results[4]) #max
    assert_equal(people(:people_9), results[5]) #neil
    assert_equal(people(:people_4), results[6]) #noreen
    assert_equal(people(:people_7), results[7]) #ted
  end

  # test finding people from postcodes 2000 or 2010
  test "find_people_from_2000_or_2010" do
    results = People.do_search(nil, nil, "include", [2000, 2010])
    assert_equal(4, results.length)

    assert_equal(people(:people_2), results[0]) #christian
    assert_equal(people(:people_1), results[1]) #cody
    assert_equal(people(:people_6), results[2]) #eric
    assert_equal(people(:people_7), results[3]) #ted
  end

  # test finding people from postcode 2010 who use gmail
  test "find_people_from_2010_and_gmail" do
    results = People.do_search("include", "gmail", "include", [2010])
    assert_equal(1, results.length)

    assert_equal(people(:people_2), results[0]) #christian
  end

  # test finding people from postcodes 2060, 2061, 2065 and do not use gmail
  test "find_people_from_2060_2061_2065_and_not_gmail" do
    results = People.do_search("exclude", "gmail", "include", [2060, 2061, 2065])
    assert_equal(4, results.length)

    assert_equal(people(:people_10), results[0]) #clare
    assert_equal(people(:people_8), results[1]) #clinton
    assert_equal(people(:people_5), results[2]) #darren
    assert_equal(people(:people_4), results[3]) #noreen
  end

end
