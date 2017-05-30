# AttrSerializer
easy JSON serialization for ActiveRecord models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attr_serializer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attr_serializer

## Usage

in your ActiveRecord models
```ruby
class User < ActiveRecord::Base
  attr_serializer :id, :name
end
```

Now, whenever `to_json` is called on an instance or collection of `User` objects, only `id` & `name` will be serialized
```ruby
class UsersController < ApplicationController

  def show
    render json: User.find(123)
  end

end
```
```json
{"id": 123, "name": "Bob Jones"}
```

Any attribute or method name can be supplied to `attr_serializer`
```ruby
class User < ActiveRecord::Base
  attr_serializer :id, :name, :some_data

  def some_data
    "not in database"
  end
end
```
```json
{"id": 123, "name": "Bob Jones", "some_data": "not in database"}
```

You may also specify alternate keys for the resulting `json` by passing a hash as the last argument to `attr_serializer`
```ruby
class User < ActiveRecord::Base
  attr_serializer :id, :name, someData: :some_data

  def some_data
    "not in database"
  end
end
```
```json
{"id": 123, "name": "Bob Jones", "someData": "not in database"}
```

`attr_serializer` is also inherited accross STI models
```ruby
class Admin < User
  attr_serializer :admin_stuff

  def admin_stuff
    "super important"
  end
end
Admin.first.to_json
#=> "{\"id\": 124, \"name\": \"Admin Bob\", \"someData\": \"not in database\", \"admin_stuff\": \"super important\"}"
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/OutlawAndy/attr_serializer.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
