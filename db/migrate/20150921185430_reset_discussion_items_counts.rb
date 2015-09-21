class ResetDiscussionItemsCounts < ActiveRecord::Migration
  def change
    DiscussionService.recount_everything
  end
end
