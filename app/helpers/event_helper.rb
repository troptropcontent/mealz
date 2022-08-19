module EventHelper
    def period(event)
        start_on = event.start_on.strftime("%d/%m")
        end_on = event.end_on.strftime("%d/%m")
        "du #{start_on} au #{end_on}"
    end
end
