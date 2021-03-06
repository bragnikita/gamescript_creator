module GamescriptCreator
  module HtmlHelpers
    module Utils
      def render_attrs(attributes = {})
        return if attributes.empty?

        output = +''
        sep = ' '
        attributes.each_pair do |key, value|
          unless value.nil?
            output << sep
            output << render_attr(key, value)
          end
        end
        output unless output.empty?
      end

      def render_attr(key, value)
        value = escape_attr_value value
        %(#{key}="#{value.gsub('"', '&quot;')}")
      end

      def filter_attrs(hash, *keys)
        flatten_keys = keys.flatten
        hash.reject do |k|
          flatten_keys.include? k
        end
      end

      def escape_attr_value(value)
        ERB::Util.html_escape(value)
      end
    end
  end
end