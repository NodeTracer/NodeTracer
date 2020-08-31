class ConvertMetricToHypertable < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    execute "CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;"
    execute "ALTER SYSTEM SET timescaledb.telemetry_level=off;"
    execute "SELECT pg_reload_conf();"
    execute <<-EOF
      SELECT
        create_hypertable(
          'metrics',
          'timestamp',
          chunk_time_interval => INTERVAL '60 minutes'
        );
    EOF
  end
end
