# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

class AdminController < Controller
  layout '/layouts/admin'
  # the index action is called automatically when no other action is specified
  #
  def index
    @title = "Queue Ninja: Admin"
	load_config
  end

  def edit_settings
    @title = "Queue Ninja: Admin"
	load_config
  end

  def update_settings
    settings = {}
    settings['queueninja'] = request["queueninja"]
    File.open(Queueninja.config_file, 'w') { |f| f.puts settings.to_yaml }
    flash[:notice] = "Settings updated successfully!"
    redirect Rs(:index)
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end

  private

  def load_config
	@config ||= Queueninja.config
  end

end
