require File.dirname(__FILE__) + '/../../test_helper'

class CompressCssFilterTest < Test::Unit::TestCase
  def test_registered_id
    assert_equal 'CompressCss', CompressCssFilter.registered_id
  end

  def test_filter
    css = CompressCssFilter.new
    assert_equal ".a_class{color:#000}\n#an_id{color:#aaa}", css.filter("/* a comment */\n\n\n  .a_class  { color: #000 }\n\n#an_id { color: #aaa}")
  end
end

