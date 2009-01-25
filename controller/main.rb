# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl


class MainController < Controller
  layout '/layouts/main'
  # the index action is called automatically when no other action is specified
  #
  def index
    @title = "Queue Ninja"
	  load_config
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  #
  def load_queuelog
    queue_log = QueueLog.new
    results = queue_log.process_log_file
    flash[:notice] = "Queue Log Processed and #{results} new record(s) loaded."
    redirect Rs(:index)
  end

  def logoff_all_agents
    ami_conn = AMI.new
    ami_conn.login
    ami_conn.logoffallagents
    ami_conn.logoff
    flash[:notice] = "Succesfully logged off all Agents from all Queues!"
    redirect Rs(:index)
  end

  def reset_queues
    ami_conn = AMI.new
    ami_conn.login
    ami_conn.reset_queue
    ami_conn.logoff
    flash[:notice] = "Succesfully logged restarted Asterisk queue stats"
    redirect Rs(:index)
  end

  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end
	
  private

  def load_config
	  @config ||= Queueninja.config
  end

end
