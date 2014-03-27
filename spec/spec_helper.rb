require 'pagez'
require 'active_record'

if !defined?(ARC)
  ActiveRecord::Base.establish_connection("sqlite3:///:memory:")
  ActiveRecord::Migration.create_table :posts do |t|
    t.string :title
    t.timestamps
  end
  class Post < ActiveRecord::Base
  end
  ARC = 1
end

