require 'formtastic'

module Appstyler
  class UniFormBuilder < Formtastic::SemanticFormBuilder
    ::Formtastic::SemanticFormHelper.default_form_class = 'formtastic uniForm'

    def input(method, options = {})
      options[:as] ||= default_input_type(method, options)
      if(text_input?(options[:as]))
        options = add_css_class(options, :input_html, 'textInput')
      end
      options = add_css_class(options, :wrapper_html, 'ctrlHolder')
      super(method, options)
    end

    def commit_button(*args)
      options = args.extract_options!
      options = add_css_class(options, :button_html,  'primaryAction')
      options = add_css_class(options, :wrapper_html,  'buttonHolder')
      super(*(args << options))
    end 
    
    def date_input(method, options)
      read_only_text_field_input(method, options) + datepicker_script(method)
    end
    
    def time_input(method, options)
      read_only_text_field_input(method, options) + timepicker_script(method)
    end
    
    def datetime_input(method, options)
      read_only_text_field_input(method, options) + datetimepicker_script(method)
    end

    private
    def read_only_text_field_input(method, options)
      html_options = options.delete(:input_html) || {}
      html_options[:readonly] = 'readonly'
      options[:input_html] = html_options
      basic_input_helper(:text_field, :string, method, options)
    end
    
    def jquery_datetimepicker_script(method, picker_type)
      html_id = generate_html_id(method, "")
      "<script type='text/javascript'>
        jQuery('##{html_id}').#{picker_type}({
          dateFormat: 'yy-mm-dd'
      });</script>".html_safe
    end
    
    def datetimepicker_script(method)
      jquery_datetimepicker_script(method, 'datetimepicker')
    end
    
    def datepicker_script(method)
      jquery_datetimepicker_script(method, 'datepicker')
    end
    
    def timepicker_script(method)
      jquery_datetimepicker_script(method, 'timepicker')
    end

    def add_css_class(options, element_name, css_class)
      element_html_class = [css_class]
      element_html = options.delete(element_name) || {}
      element_html[:class] = (element_html_class << element_html[:class]).flatten.compact.join(' ')
      options[element_name] = element_html
      options
    end

    def text_input?(input_type)
      not [:select, :radio, :check_boxes].include?(input_type)
    end
  end
end
