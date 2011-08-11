class MeetingsController < ApplicationController
  # Form used to generate new meetings
  def new
    @meeting = Meeting.new
	@availabilities = @meeting.availabilities.build
  end

  # Accepts inputs and creates the meeting
  def create
    #@availabilities = Availability.create(params[:availability])
	#@availabilities = [@availabilities] unless @availabilities.is_a? Array
	@meeting = Meeting.create(params[:meeting])
  
    redirect_to @meeting
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

end
