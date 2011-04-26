require 'helper'

class TestAppstyler < ActionView::TestCase
  should "load table" do
    assert_equal "<script type='text/javascript'>load_table('bigtable');</script>", load_table('bigtable')
  end
  
  should 'create toolbar button' do
    button = link_button('button_name', 'button_url')
    assert_equal '<a href="button_url" class="fg-button ui-state-default ui-corner-all">button_name</a>', button
  end
  
  should 'create toolbar' do
    mytoolbar= toolbar do
      "button inside"
    end
    assert mytoolbar
    assert mytoolbar.include?('fg-toolbar')
    assert_equal "<div class=\"fg-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix\">button inside</div>", mytoolbar
  end
end
