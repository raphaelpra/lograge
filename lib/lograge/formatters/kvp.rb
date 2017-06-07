module Lograge
  module Formatters
    class Kvp
      def call(data)
        fields = fields_to_display(data)

        event = fields.map { |key| format(key, data[key]) }
        event.join(' ')
      end

      def fields_to_display(data)
        data.keys
      end

      def format(key, value)
        if value.is_a? Float
          value = Kernel.format('%.2f', value)
        end

        "#{key}=\"#{value}\""
      end
    end
  end
end
