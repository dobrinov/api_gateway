require 'httparty'

module Services
  class Base
    include HTTParty

    def initialize(attributes)
      @attributes = attributes

      attributes.each do |attribute, value|
        self.class.send(:define_method, attribute, Proc.new { @attributes[attribute] })
      end
    end

    def to_json
      @attributes.to_json
    end
  end
end
