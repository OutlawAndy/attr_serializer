require "attr_serializer/version"

ActiveRecord::Base.class_eval do
  include ActiveModel::Serializers::JSON

  class_attribute :attr_serializers
  class_attribute :serializer_aliases
  self.attr_serializers = []
  self.serializer_aliases = {}

  def self.attr_serializer *args
    self.serializer_aliases = self.serializer_aliases.merge(args.extract_options!)
    self.attr_serializers += args + self.serializer_aliases.keys

    define_method :serializable_attributes do
      attr_serializers.each_with_object({}){ |attr,memo| memo[attr] = send(serializer_aliases[attr] || attr) }
    end
    define_method(:serializable_hash){ |opt = nil| send(:serializable_attributes) }
  end

end
