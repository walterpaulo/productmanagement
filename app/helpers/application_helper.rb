module ApplicationHelper
    def id_user
        if cookies[:product_admin].blank?
            redirect_to "/login"
        return
        end
        id = JSON.parse(cookies[:product_admin]).values.first.to_i
        id
    end
end
