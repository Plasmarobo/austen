module Project::Status


  DEFAULT = 0
  COMPLETED = 1
  IN_PROGRESS = 2
  FUTURE = 3

  def isFinished
    return self.status == self.COMPLETED
  end


end
