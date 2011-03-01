module ApplicationHelper
  def load_table(table_id)
    "<script type='text/javascript'>load_table('#{table_id}');</script>".html_safe
  end
end
