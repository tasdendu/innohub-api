# frozen_string_literal: true

class SuggestionForm < BaseForm
  def show
    suggestion
  end

  def create
    suggestion.save
  end

  def update
    suggestion.update(params)
  end

  delegate :destroy, to: :suggestion

  private

  def suggestion
    @suggestion ||= id ? Suggestion.find(id) : parent.suggestions.build(params.merge!(user: current_user))
  end
end
