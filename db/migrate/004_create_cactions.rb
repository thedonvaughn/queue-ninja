class CreateCactions < Sequel::Migration
  def up
    create_table :cactions do 
	  primary_key :id
      integer :call_id
      integer :agent_id
      integer :queu_id
      float :timestamp
      varchar :uniqueid
      varchar :queue_name
      varchar :channel
      varchar :action
      varchar :field1
      varchar :field2
      varchar :field3
	  timestamp :created_at, :default => "now()"
	  timestamp :updated_at, :default => "now()"
    end unless DB.table_exists?(:cactions)
  end

  def down
    drop_table :cactions if DB.table_exists?(:cactions)
  end
end
