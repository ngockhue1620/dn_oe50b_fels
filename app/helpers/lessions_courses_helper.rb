module LessionsCoursesHelper
  def login_in user
    session[:user_id] = user.id
  end

  def loadOldLession lessions
    l =""
    lessions.each do |l|
      a = `{ "image": "#{l.image}", "name": "#{l.name}", "duration": "#{l.duration}"}|`.to_s
      l =a
    end
    return  l.to_s
  end
end
