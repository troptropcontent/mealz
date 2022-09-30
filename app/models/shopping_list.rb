class ShoppingList
  include ActiveModel::Model
  attr_reader :event_id

  def initialize(event)
    @event_id = event.is_a?(Event) ? event.id : event.to_i
  end

  def categories
    Ingredient.joins(recipes: { course: :meal })
              .where(meal: { event_id: event.id })
              .select('ingredients.*, SUM(recipes.quantity) as total_quantity')
              .group('ingredients.id')
              .group_by(&:category)
  end

  private

  def event
    @event ||= Event.find(@event_id)
  end
end
