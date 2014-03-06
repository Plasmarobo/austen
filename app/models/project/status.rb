module Project::Status


  DEFAULT = 0
  COMPLETED = 1
  IN_PROGRESS = 2
  FUTURE = 3

  def isFinished
    return self.status == self.COMPLETED
  end

  def decorate(str)
    div = "<div class="
    case self.status
      when DEFAULT
        div += "status_default"
      when COMPLETED
        div += "status_completed"
      when IN_PROGRESS
        div += "status_in_progress"
      when FUTURE
        div += "status_future"
      else
        div += "status_default"
    end
    return (div + ">#{str}</div>").html_safe
  end


end
