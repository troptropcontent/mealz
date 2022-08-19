class MealsGenerator
    def initialize(event)
        @event = event
    end

    def call
        return unless @event.meals.empty?
        date = @event.start_on
        while date <= @event.end_on
            Meal.kinds.each do |kind, _|
                @event.meals.create(scheduled_on: date, kind: kind)
            end
            date += 1.day            
        end
        @event.meals
    end
end