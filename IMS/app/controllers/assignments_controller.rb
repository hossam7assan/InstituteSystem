class AssignmentsController < InheritedResources::Base
  # before_action :authenticate_admin_user!
  skip_before_action :verify_authenticity_token

  def beforenewpost
    session[:track]= params[:track_id]
    redirect_to :action => :new
  end
  def new
    @assignment = Assignment.new
    @arrayofcourseids=[]
    @arrayofcoursenames=[]
    @courses = CoursesTrack.where(track_id: session[:track])
    for @course in @courses
      @arrayofcourseids.push(@course.id)
      @name = Course.find(@course.id)
      @arrayofcoursenames.push(@name.name)
    end
  end

  private

    def assignment_params 
      params.require(:assignment).permit(:name, :deadline, :course_id, :assignmentfile, :staff_id)
    end
end

