# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl
require 'fastercsv'

class ReportsController < Controller
  layout '/layouts/reports'
  # the index action is called automatically when no other action is specified
  #
  def index
    @title = "Queue Ninja: Reports"
	  @agents = Agent.all
	  @groups = Group.all
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  #
  def queue_report
    get_date_range
    @queues = Queu.all
  end

  def full_report
    get_date_range
    @agents = Agent.all
    @queues = Queu.all
  end

  def agent_report
    get_date_range
	  @agent = Agent.find(:id => request[:agent_id])
  end

  def group_report
    get_date_range
	  @group = Group.find(:id => request[:group_id])
  end


  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end

  private

  def get_date_range
	  @bmonth,@bday,@byear = request[:date_start].split("/")
	  @emonth,@eday,@eyear = request[:date_end].split("/") 
  end
end
