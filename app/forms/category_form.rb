# frozen_string_literal: true

class CategoryForm < BaseForm
  def show
    category
  end

  def create
    category.save
  end

  def update
    category.update(params)
  end

  delegate :destroy, to: :category

  private

  def category
    @category ||= id ? Category.find(id) : Category.new(params)
  end
end
