require 'test_helper'

class PeopleTest < ActiveSupport::TestCase

  # test finding hotmail users
  test "find hotmail people" do
    load_postcodes
    people = load_people

    results = Person.search("include", ["hotmail"], nil, nil)
    assert_equal(2, results.length)
    first = results[0]
    second = results[1]
    cody = people["1"]
    ted = people["7"]

    assert_equal(cody, first)
    assert_equal(ted, second)
  end

  # test finding people from postcode = 2000
  test "find people not from 2000" do
    load_postcodes
    people = load_people

    results = Person.search(nil, nil, "exclude", [2000])
    assert_equal(8, results.length)

    assert_equal(people["2"], results[0]) #christian
    assert_equal(people["10"], results[1]) #clare
    assert_equal(people["8"], results[2]) #clinton
    assert_equal(people["5"], results[3]) #darren
    assert_equal(people["3"], results[4]) #max
    assert_equal(people["9"], results[5]) #neil
    assert_equal(people["4"], results[6]) #noreen
    assert_equal(people["7"], results[7]) #ted
  end

  # test finding people from postcodes 2000 or 2010
  test "find people from 2000 or 2010" do
    load_postcodes
    people = load_people
    results = Person.search(nil, nil, "include", [2000, 2010])
    assert_equal(4, results.length)

    assert_equal(people["2"], results[0]) #christian
    assert_equal(people["1"], results[1]) #cody
    assert_equal(people["6"], results[2]) #eric
    assert_equal(people["7"], results[3]) #ted
  end

  # test finding people from postcode 2010 who use gmail
  test "find people from 2010 and gmail" do
    load_postcodes
    people = load_people
    results = Person.search("include", ["gmail"], "include", [2010])
    assert_equal(1, results.length)

    assert_equal(people["2"], results[0]) #christian
  end

  # test finding people from postcodes 2060, 2061, 2065 and do not use gmail
  test "find people from 2060 2061 2065 and not gmail" do
    load_postcodes
    people = load_people
    results = Person.search("exclude", ["gmail"], "include", [2060, 2061, 2065])
    assert_equal(4, results.length)

    assert_equal(people["10"], results[0]) #clare
    assert_equal(people["8"], results[1]) #clinton
    assert_equal(people["5"], results[2]) #darren
    assert_equal(people["4"], results[3]) #noreen
  end

end
