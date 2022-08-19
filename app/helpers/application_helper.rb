module ApplicationHelper
    def destroy_path(model)
        send(model.class.to_s.downcase + "_path", model.id)
    end
end
