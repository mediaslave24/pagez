pagez
=====

Pagination for ruby

## Install
```
gem install pagez
```

## Usage

```ruby
require 'pagez'

# For objects with .slice method
array = (1..100).to_a

pagination = Pagez.new(array, per_page: 3)

pagination.to_page(20)

pagination.total #= 34
pagination.to_a #=> [58, 59, 60]
pagination.to_h #=> {:page=>20, :per_page=>3, :items=>[58, 59, 60], :total=>34}

# With ActiveRecord

scope = Users.all
pagination = Pagez.new(scope, per_page: 10)

# works same as for array
pagination.total
pagination.to_a
pagination.to_h
```
