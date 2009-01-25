# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

class MonitorController < Controller
  layout '/layouts/monitor'
  # the index action is called automatically when no other action is specified
  #
  def index
	@ami_conn = AMI.new
    @ami_conn.login
    @queues = @ami_conn.queue_status
    @ami_conn.logoff
    @title = "Queue Ninja: Realtime Queue Monitor"
  end

  def live_view
	@ami_conn = AMI.new
    @ami_conn.login
    @queues = @ami_conn.queue_status
    @ami_conn.logoff
    @title = "Queue Ninja: Realtime Queue Monitor"
  end

  def logoff
	queue = request[:queue]
	agent = request[:agent]
	@ami_conn = AMI.new
	@ami_conn.login
	@ami_conn.queueremove(:queue => queue.to_s, :interface => agent)
	@ami_conn.logoff
	redirect Rs(:index)
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end
end
