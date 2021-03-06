Webhooks::Slack::Base = Struct.new(:event) do
  include Routing

  def username
    "Loomio Bot"
  end

  def icon_url
    # we'll host our own image soon I reckon
    "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/11537803_694991540606106_5116967442850884451_n.jpg?oh=eeba96f797e9cb12340bfd94df2650f0&oe=56802643&__gda__=1447229045_95708238caee2d950ea43c93b38b071c"
  end

  def text
    I18n.t :"webhooks.slack.#{event.kind}", author: author.name, name: proposal_link(eventable)
  end

  def attachments
    [{
      title:       attachment_title,
      text:        attachment_text,
      fields:      attachment_fields,
      fallback:    attachment_fallback
    }]
  end

  alias :read_attribute_for_serialization :send

  private

  def motion_vote_field
    {
      title: "Vote on this proposal",
      value: "#{proposal_link(eventable, "yes")} · " +
             "#{proposal_link(eventable, "abstain")} · " +
             "#{proposal_link(eventable, "no")} · " +
             "#{proposal_link(eventable, "block")}"
    }
  end

  def view_motion_on_loomio
    view_discussion_on_loomio({ proposal: eventable.key })
  end

  def view_discussion_on_loomio(params = {})
    { value: discussion_link(I18n.t(:"webhooks.slack.view_it_on_loomio"), params) }
  end

  def proposal_link(proposal, position = nil)
    discussion_link position || proposal.name, { proposal: proposal.key, position: position }
  end

  def discussion_link(text = nil, params = {})
    "<#{discussion_url(eventable.discussion, params)}|#{text || eventable.discussion.title}>"
  end

  def eventable
    @eventable ||= event.eventable
  end

  def author
    @author ||= eventable.author
  end

end
