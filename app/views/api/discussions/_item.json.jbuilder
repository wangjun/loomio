json.(item, :id, :sequence_id, :kind)

json.eventable do
  case item.eventable.class.to_s
  when 'Comment'
    json.partial! 'api/comments/comment', comment: item.eventable
  when 'Discussion'
  when 'Motion'
  when 'Vote'
  end
end
