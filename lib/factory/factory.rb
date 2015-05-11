module Factory
  class Factory
    def self.new(*args, &block)
      Class.new do
        args.each do |arg|
          define_method "#{arg}".to_sym do 
            instance_variable_get("@#{arg}")
          end
          define_method "#{arg}=".to_sym do |value|
            instance_variable_set("@#{arg}", value)
          end
        end
        define_method :initialize do |*some_args|
          raise(ArgumentError) if some_args.size > args.size
          some_args.each_with_index do |some_arg, index|
            instance_variable_set("@#{args[index]}", some_arg)
          end
        end
        define_method :[] do |value|
          if value.is_a? Fixnum
            instance_variable_get("@#{args[value]}")
          else
            instance_variable_get("@#{value}")
          end
        end
        self.class_eval(&block) if block_given?
      end
    end
  end
end
