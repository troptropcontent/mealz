class ShoppingListsController < ApplicationController
    
    def show
        @event = Event.find(params[:event_id])
        @shopping_list = ShoppingList.new(@event)
    end

end
