class ShoppingList
    include ActiveModel::Model
    attr_reader :event_id
    
    def initialize(event)
        @event_id = event.is_a?(Event) ? event.id : event.to_i
    end

    def quantities
        Ingredient.joins(recipes: {course: :meal})
                  .where(meal: {event_id: event.id})
                  .select('ingredients.*, SUM(recipes.quantity) as total_quantity')
                  .group('ingredients.id')
    end

    def event
        @event||= Event.find(@event_id)
    end
end