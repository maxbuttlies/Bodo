class Topic
  include MongoMapper::Document

  key :name, String
  key :done, String, false
  key :date, String
  key :time, String

end
