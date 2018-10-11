# frozen_string_literal: true

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  FIELD_METHODS = %w[text_field number_field]

  FIELD_METHODS.each do |field_method|
    define_method(field_method) do |method, *args|
      if object.errors.present?
        options = args.extract_options!
        @template.content_tag :div do
          validity = object.errors[method].present? ? 'invalid' : 'valid'
          options[:class] ||= ''
          options[:class] << " is-#{validity}"
          @template.concat super(method, *args.concat([options]))
          feedback = object.errors[method].first || 'Looks good!'
          @template.concat @template.content_tag(:div, feedback, class: "#{validity}-feedback")
        end
      else
        super method, *args
      end
    end
  end
end
