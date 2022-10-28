# name: clerk login
# version: 0.1.0

enabled_site_setting :clerk_enabled

after_initialize do
  load File.expand_path('../app/controllers/clerk_controller.rb', __FILE__)

  Discourse::Application.routes.append do
    # Map the path `/notebook` to `NotebookController`’s `index` method
    post '/clerk' => 'clerk#index'
  end
end
