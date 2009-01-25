class CreateCalls < Sequel::Migration
  def up
    create_table :calls do
	  primary_key :id
      integer :queu_id
      integer :agent_id
      float :timestamp
      varchar :cid
      varchar :queue_name
      varchar :uniqueid
	  timestamp :created_at, :default => "now()"
	  timestamp :updated_at, :default => "now()"
    end unless DB.table_exists?(:calls)
  end

  def down
    drop_table :calls if DB.table_exists?(:calls)
  end
end
