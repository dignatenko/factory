require "./factory/version"
require "./factory/factory"

module Factory
  MyFactory = Factory.new(:name, :address, :zip)
  obj = MyFactory.new("Joe Smith", "123 Maple, Anytown NC", 12345)
  puts obj["name"]
  puts obj[:name]
  puts obj[0]

  MyFactory2 = Factory.new(:name, :address) do
    def greeting
       "Hello #{name}!"
    end
  end
  puts MyFactory2.new("Dave", "123 Main").greeting

end
