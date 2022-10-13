# frozen_string_literal: true

class Comment < ApplicationRecord
  include Scopes::Comment
  include Helpers::Comment
  include Relations::Comment
  include Validations::Comment
end
