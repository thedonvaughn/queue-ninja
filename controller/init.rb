# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers

class Controller < Ramaze::Controller
  layout '/page'
  helper :xhtml
  engine :Erubis
end

# Here go your requires for subclasses of Controller:
require 'controller/main'
require 'controller/monitor'
require 'controller/reports'
require 'controller/admin'
require 'controller/agents'
require 'controller/groups'
require 'controller/live_view'

# Libs required by controller
require 'lib/queueninja'
require 'lib/ami'
require 'lib/queue_log'
