class ResetDiscussionItemsCounts < ActiveRecord::Migration
  def up
    DiscussionService.recount_everything!
  end
end
