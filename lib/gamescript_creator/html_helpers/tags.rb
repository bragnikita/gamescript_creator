# frozen_string_literal: true


require 'active_support/core_ext/hash'
require_relative 'utils'

module GamescriptCreator
  module HtmlHelpers
    module Tags
      include HtmlHelpers::Utils

      def writer
        @writer ||= ''
      end

      def div(attrs = {}, &block)
        tag('div', {'inline' => false}.merge(attrs), &block)
      end

      def span(attrs = {}, &block)
        tag('span', {'inline' => true}.merge(attrs), &block)
      end

      def img(attrs = {}, &block)
        tag('img', {'inline' => false}.merge(attrs), &block)
      end

      def tag(tag_name = 'div', attrs_s = {})
        attrs = attrs_s.stringify_keys
        inline = attrs.fetch('inline', false)
        attrs.delete('inline')
        writer << "<#{tag_name}#{render_attrs(attrs)}"
        if block_given?
          writer << ' >'
          writer << "\n    " unless inline
          yield
          writer << "\n" unless inline
          writer << "</#{tag_name}>"
        else
          writer << ' />'
        end
        writer
      end
    end
  end
end