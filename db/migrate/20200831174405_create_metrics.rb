class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics, id: false do |t|
      t.timestamp :timestamp
      t.string :key
      t.float :value
      t.jsonb :tags, default: {}
    end
  end
end
