module Enrollment
  module Ability

    # user_id 가 nil 이면 current_user.id 아니면 user_id
    # 시간제한 인원제한 포함
    def can_enroll?(lecture_id, user_id)
      true
    end

    # 시간제한이랑 인원제한 포함
    def is_lecture_limited?(lecture_id)
      true
    end

    def is_lecture_time_limited?(lecture_id)
      begin
        lecture = Lecture.where(id: lecture_id).first
        return Time.current > lecture.time_limit_end
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end

    def is_lecture_personnel_limited?(lecture_id)
      begin
        lecture = Lecture.where(id: lecture_id).first
        return lecture.enrollment_enrolls.count >= @lecture.personnel_limit
      rescue ActiveRecord::RecordNotFound
        return nil
      end
    end

    def is_lecture_admin?(lecture_id)
      LectureAdmin.where(lecture_id: lecture_id, user_id: current_user.id).any?
    end

    def is_admin?
      true
    end

  end
end
