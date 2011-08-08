require 'test_helper'

class PeopleTest < ActiveSupport::TestCase

  set_fixture_class :people => "Person"

  # test finding hotmail users
  test "find hotmail people" do
    results = Person.search("include", ["hotmail"], nil, nil)
    assert_equal(2, results.length)


    assert_equal(people(:person_1), results[0]) #cody
    assert_equal(people(:person_7), results[1]) #ted
  end

  # test finding people from postcode = 2000
  test "find people not from 2000" do
    results = Person.search(nil, nil, "exclude", [2000])
    assert_equal(8, results.length)

    assert_equal(people(:person_2), results[0]) #christian
    assert_equal(people(:person_10), results[1]) #clare
    assert_equal(people(:person_8), results[2]) #clinton
    assert_equal(people(:person_5), results[3]) #darren
    assert_equal(people(:person_3), results[4]) #max
    assert_equal(people(:person_9), results[5]) #neil
    assert_equal(people(:person_4), results[6]) #noreen
    assert_equal(people(:person_7), results[7]) #ted
  end

  # test finding people from postcodes 2000 or 2010
  test "find people from 2000 or 2010" do
    results = Person.search(nil, nil, "include", [2000, 2010])
    assert_equal(4, results.length)

    assert_equal(people(:person_2), results[0]) #christian
    assert_equal(people(:person_1), results[1]) #cody
    assert_equal(people(:person_6), results[2]) #eric
    assert_equal(people(:person_7), results[3]) #ted
  end

  # test finding people from postcode 2010 who use gmail
  test "find people from 2010 and gmail" do
    results = Person.search("include", ["gmail"], "include", [2010])
    assert_equal(1, results.length)

    assert_equal(people(:person_2), results[0]) #christian
  end

  # test finding people from postcodes 2060, 2061, 2065 and do not use gmail
  test "find people from 2060 2061 2065 and not gmail" do
    results = Person.search("exclude", ["gmail"], "include", [2060, 2061, 2065])
    assert_equal(4, results.length)

    assert_equal(people(:person_10), results[0]) #clare
    assert_equal(people(:person_8), results[1]) #clinton
    assert_equal(people(:person_5), results[2]) #darren
    assert_equal(people(:person_4), results[3]) #noreen
  end

end
