module ApplicationHelper
  def load_table(table_id)
    "<script type='text/javascript'>load_table('#{table_id}');</script>".html_safe
  end
  
  def toolbar(&block)
    options = {:class => "fg-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix"}
    content = capture(&block)
    output = tag(:div, options, true)
    output.concat(content)
    output.safe_concat("</div>")
  end
  
  def link_button(text, url)
    link_to text, url, {:class => "fg-button ui-state-default ui-corner-all"}
  end
end
