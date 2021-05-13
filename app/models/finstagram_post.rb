class FinstagramPost < ActiveRecord::Base


    belongs_to :user
    has_many :comments
    has_many :likes

    validates :photo_url, :user, presence: true

    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds / 60
        time_ago_in_hours = time_ago_in_minutes / 60

        if time_ago_in_hours >= 48
            "#{(time_ago_in_hours / 24).to_i} days ago"
        elsif time_ago_in_hours >= 24
            "#{(time_ago_in_hours / 24).to_i} day ago"
        elsif time_ago_in_minutes >= 120
            "#{(time_ago_in_minutes / 60).to_i} hours ago"
        elsif time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes / 60).to_i} hour ago"
        elsif time_ago_in_minutes >= 2
            "#{time_ago_in_minutes.to_i} minutes ago"
        else
            "Fresh catch!"
        end
    end

    def like_count
        self.likes.size
    end

    def comment_count
        self.comments.size
    end

end