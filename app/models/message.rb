require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
DataMapper::Model.raise_on_save_failure = true

class Message
    include DataMapper::Resource
    property :id,           Serial
    property :content,      String, :required => true, length: 120
    property :user_id,      Integer, :required => true
    
    @users_count = 0
    
    def self.users_count
        @users_count += 1
    end
end

DataMapper.finalize
Message.auto_migrate!