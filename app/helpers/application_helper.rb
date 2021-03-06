module ApplicationHelper

    def materialize_class_for flash_type
        { success: "notification is-success", error: "notification is-danger", alert: "notification is-info", notice: "notification is-warning" }[flash_type.to_sym] || flash_type.to_s
    end

    def flash_messages(opts = {})
        flash.each do |msg_type, message|
            concat(content_tag(:div, message, class: "#{materialize_class_for(msg_type)}") do
            concat content_tag(:button, '', class: "delete", data: { dismiss: 'alert' })
            concat "     #{message}"
            end)
        end
        nil
    end

    
end
