# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

class AgentsController < Controller
  layout '/layouts/agents'
  # the index action is called automatically when no other action is specified
  #
  def index
    @title = "Queue Ninja: Agents"
    @agents = Agent.all
  end

  def show(id)
    @agent = Agent.find(:id => id)
  end

  def edit(id) 
    @agent = Agent.find(:id => id)
    @groups = Group.all
  end

  def delete(id) 
    @agent = Agent.find(:id => id)
    @agent.destroy
    flash[:notice] = "Agent succesfully deleted!"
    redirect Rs(:index)
  end

  def update(id)
    @agent = Agent.find(:id => id)
    @agent.update(request[:agent])
    flash[:notice] = "Agent successfully updated!"
    redirect Rs(:show, @agent.id)
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end
end
