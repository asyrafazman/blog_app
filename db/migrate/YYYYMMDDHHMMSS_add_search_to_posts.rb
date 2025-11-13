class AddSearchToPosts < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      ALTER TABLE posts
      ADD COLUMN search_vector tsvector;
      
      CREATE INDEX index_posts_on_search_vector ON posts USING gin(search_vector);
      
      CREATE TRIGGER posts_search_vector_update BEFORE INSERT OR UPDATE
      ON posts FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(search_vector, 'pg_catalog.english', title);
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS posts_search_vector_update ON posts;
      DROP INDEX IF EXISTS index_posts_on_search_vector;
      ALTER TABLE posts DROP COLUMN IF EXISTS search_vector;
    SQL
  end
end