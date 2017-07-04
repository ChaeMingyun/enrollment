module Enrollment
  module Ability

    def is_enrolled?(lecture_id)
      lecture = Lecture.find(lecture_id)
      if lecture.enrolls.where(user_id:current_user.id).limit(1)
        true
      else
        false
      end
    end
    # user_id 가 nil 이면 current_user.id 아니면 user_id
    # 시간제한 인원제한 포함
    def can_enroll?(lecture_id, user_id)
      if user_id.nil?
        u_id = current_user.id
      else
        u_id = user_id
      end
      lecture = Lecture.where(lecture_id)
      if !u_id.nil? and !lecture.nil?
        if LectureAdmin.exists?(user_id: u_id, enrollment_lecture_id: lecture_id) or Enroll.exists?(user_id: u_id, enrollment_lecture_id: lecture_id)
          false
        end
        is_lecture_limited? lecture_id
      end
      true
    end

    # 시간제한이랑 인원제한 포함
    def is_lecture_limited?(lecture_id)
      lecture = Lecture.find(lecture_id)
      unless lecture.nil?
        is_lecture_time_limited? lecture_id
        count = Enroll.count(enrollment_lecture_id: lecture_id)
        if lecture.personnel_limit <= count
          false
        end
      end
      true
    end

    def is_lecture_time_limited?(lecture_id)
      begin
        lecture = Lecture.find(lecture_id)
        if Time.now.to_i < lecture.time_limit_start.to_i or Time.now.to_i > lecture.time_limit_end.to_i
          return false
        else
          return true
        end
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end

    def is_lecture_personnel_limited?(lecture_id)
      begin
        lecture = Lecture.where(id: lecture_id).first
        return lecture.enrollment_enrolls.count >= lecture.personnel_limit
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end

    def is_lecture_admin?(lecture_id)
      LectureAdmin.exists?(lecture_id: lecture_id, user_id: current_user.id)
    end

    def is_admin?(user_id)
      if user_id.nil?
        true
      else
        LectureAdmin.exists?(user_id: user_id)
      end
    end
  end
end
