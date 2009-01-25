# Default url mappings are:
#  a controller called Main is mapped on the root of the site: /
#  a controller called Something is mapped on: /something
# If you want to override this, add a line like this inside the class
#  map '/otherurl'
# this will force the controller to be mounted on: /otherurl

class GroupsController < Controller
  layout '/layouts/groups'
  # the index action is called automatically when no other action is specified
  #
  #
  def index
    @title = "Queue Ninja: Agent Groups"
    @groups = Group.all
  end

  def show(id)
    @group = Group.find(:id => id)
  end

  def edit(id) 
    @group = Group.find(:id => id)
  end

  def update(id)
    @group = Group.find(:id => id)
    @group.update(request[:group])
    flash[:notice] = "Group successfully updated!"
    redirect Rs(:show, @group.id)
  end

  def delete(id) 
    @group = Group.find(:id => id)
    @group.destroy
    flash[:notice] = "Group succesfully deleted!"
    redirect Rs(:index)
  end

  def new
  end

  def create 
    @group = Group.create(request[:group])
    if @group
      flash[:notice] = "Group successfully created!"
      redirect Rs(:show, @group.id)
    else
      flash[:notice] = "Group not created.  Please try again."
      redirect Rs(:index)
    end
  end

  # the string returned at the end of the function is used as the html body
  # if there is no template for the action. if there is a template, the string
  # is silently ignored
  def notemplate
    "there is no 'notemplate.xhtml' associated with this action"
  end
end
