class CreateConnectorMessages < ActiveRecord::Migration
  def up
    execute <<-'SQL'
      CREATE TABLE public.connector_messages (
          id bigserial PRIMARY KEY USING INDEX TABLESPACE tablespace_000,
          connector text NOT NULL,
          entity_type text NOT NULL,
          entity_id integer NOT NULL,
          entity_tax_registration_number text,
          payload jsonb NOT NULL,
          created_at timestamp NOT NULL DEFAULT LOCALTIMESTAMP,
          updated_at timestamp NOT NULL DEFAULT LOCALTIMESTAMP
      ) TABLESPACE tablespace_000;
    SQL
  end

  def down
    execute <<-'SQL'
      DROP TABLE IF EXISTS public.connector_messages;
    SQL
  end
end
