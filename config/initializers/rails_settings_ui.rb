require 'rails-settings-ui'

#= Application-specific
#
# # You can specify a controller for RailsSettingsUi::ApplicationController to inherit from:
# RailsSettingsUi.parent_controller = 'Admin::ApplicationController' # default: '::ApplicationController'
#
# # Render RailsSettingsUi inside a custom layout (set to 'application' to use app layout, default is RailsSettingsUi's own layout)
# RailsSettingsUi::ApplicationController.layout 'admin'

Rails.application.config.to_prepare do
  # If you use a *custom layout*, make route helpers available to RailsSettingsUi:
  RailsSettingsUi.inline_engine_routes!
  # RailsSettingsUi::ApplicationController.module_eval do
  #   layout 'admin'
  # end
end

RailsSettingsUi.setup do |config|
  config.settings_class = "Setting" # Customize settings class name
end

# load a customized view
Rails.application.config.after_initialize do
  RailsSettingsUi::SettingsController.class_eval do
    def index
     render "settings/index"
    end
  end
end

Rails.application.config.to_prepare do
  RailsSettingsUi::ApplicationController.module_eval do
    before_action :check_settings_permissions # starting from Rails 4

    private
    def check_settings_permissions
      redirect_to '/login' unless current_user
    end
  end
end
