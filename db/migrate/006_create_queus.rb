class CreateQueus < Sequel::Migration
  def up
    create_table :queus do 
	  primary_key :id
      varchar :queue_name
      varchar :exten
      varchar :description
	  timestamp :created_at, :default => "now()"
	  timestamp :updated_at, :default => "now()"

    end unless DB.table_exists?(:queus)
  end

  def down
    drop_table :queus if DB.table_exists?(:queus)
  end
end
