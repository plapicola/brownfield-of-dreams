# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 6)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class AddMissingIndexesOnTaggings < ActiveRecord::Migration[4.2]; end
else
  class AddMissingIndexesOnTaggings < ActiveRecord::Migration; end
end
AddMissingIndexesOnTaggings.class_eval do
  def change
    tags = %i[tag_id taggable_id taggable_type tagger_id context tagger_type]
    tags.each do |tag|
      add_index :taggings, tag unless index_exists? :taggings, tag
    end
  end
end
