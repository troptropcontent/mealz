class ShoppingListsController < ApplicationController
    
    def show
        load_and_authorize_shopping_list
        
    end

    private

    def load_and_authorize_shopping_list
        @event = Event.find(params[:event_id])
        @shopping_list = ShoppingList.new(@event)
        authorize! :show, @shopping_list
    end
end
