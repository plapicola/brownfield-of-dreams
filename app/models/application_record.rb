# frozen_string_literal: true

# Covers uniform queries to database for multiple models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
