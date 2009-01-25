class CreateAactions < Sequel::Migration
  def up
    create_table :aactions do
	  primary_key :id
      integer :agent_id
      integer :queu_id
      varchar :channel
      varchar :queue_name
      varchar :uniqueid
      varchar :action
      varchar :field1
      varchar :field2
      varchar :field3
      float :timestamp
	  timestamp :created_at, :default => "now()"
	  timestamp :updated_at, :default => "now()"

    end unless DB.table_exists?(:aactions)
  end

  def down
    drop_table :aactions if DB.table_exists?(:aactions)
  end
end
