class HomepagesController < ApplicationController

  def index
    @lectures = Lecture.all.sample(10)
    @discussions = Discussion.all.sample(10)
    @subjects = Subject.all.sample(10)
  end

end
