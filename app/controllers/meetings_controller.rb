class MeetingsController < ApplicationController
  before_filter :authenticate_user!, :except => ['show']
 
  # TODO(sasank): Figure out better place to set this based on a user timezone attrib
  Time.zone = -8

  # Form used to generate new meetings
  def new
    @meeting = Meeting.new
	@availabilities = @meeting.availabilities.build
  end

  # Accepts inputs and creates the meeting
  def create
	@meeting = Meeting.create(params[:meeting])
  
    print "URL", url_for(@meeting) + "?key=" + @meeting.uuid
	redirect_to url_for(@meeting) + "?key=" + @meeting.uuid
  end

  def show
    @meeting = Meeting.find(params[:id])
	if not params[:key] and not @meeting.uuid == params[:key]
	  render :nothing => true, :status => 404 and return
	end
  end

end
