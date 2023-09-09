# frozen_string_literal: true

5.times do |_n|
  Comment.create do |comment|
    comment.user_id = User.all.sample.id
    comment.content = 'Reply comment.'
    comment.parent_id = Comment.all.sample.id
    comment.event_id = Event.all.sample.id
  end
end
