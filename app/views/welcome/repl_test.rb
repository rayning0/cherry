require 'minitest/autorun'
require_relative 'repl'

class TestREPL < MiniTest::Unit::TestCase
  def setup
    @repl = Repl.new
  end

  def test_evaluates_arithmethic
    results = @repl.execute "2 + 2"
    assert_equal "4", results

    results =  @repl.execute "5 - 3"
    assert_equal "2", results
  end

  def test_can_list_history
    @repl.execute "1 + 1"
    @repl.execute "2 + 2"
    @repl.execute "3 + 3"

    result = @repl.execute "history"
    assert_equal "[1] 1 + 1\n[2] 2 + 2\n[3] 3 + 3", result
  end

  def test_can_execute_from_history
    @repl.execute "1 + 1"
    @repl.execute "2 + 2"
    @repl.execute "3 + 3"

    result = @repl.execute "!3"
    assert_equal "6", result

    result = @repl.execute "!1"
    assert_equal "2", result
  end
end

class TestHistory < MiniTest::Unit::TestCase
  def setup
    @history = Repl::History.new
  end

  def test_can_access_entries_by_one_based_index
    @history << "foo"
    @history << "bar"
    @history << "baz"

    assert_equal "foo", @history[1]
    assert_equal "bar", @history[2]
    assert_equal "baz", @history[3]
  end

  def test_filtered_out_history_command
    @history << "foo"
    @history << "history"
    @history << "!1"

    assert_equal "foo", @history[1]
    assert_nil @history[2]
    assert_nil @history[3]
  end
end