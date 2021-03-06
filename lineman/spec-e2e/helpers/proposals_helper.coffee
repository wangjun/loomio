module.exports = new class ProposalsHelper
  
  startProposalBtn: ->
    element(By.css('.start-proposal-card .start-proposal-button__button'))

  fillInProposalForm: (params) ->
    element(By.css('.proposal-form__title-field')).clear().sendKeys(params.title)
    element(By.css('.proposal-form__details-field')).sendKeys(params.details)

  submitProposalForm: ->
    element(By.css('.proposal-form__start-btn')).click()

  clickAgreeBtn: ->
    element(By.css('.position-button--yes')).click()

  clickChangeBtn: ->
    element.all(By.css('.proposal-positions-panel__change-your-vote')).first().click()

  selectVotePosition: (position) ->
    element(By.css(".vote-form__select-position option[value=#{position}]")).click()

  setVoteStatement: (statement) ->
    element(By.css('.vote-form__statement-field')).clear().sendKeys(statement)

  submitVoteForm: ->
    element(By.css('.vote-form__submit-btn')).click()

  positionsList: ->
    element(By.css('.proposal-positions-panel__list')).getText()

  clickProposalActionsDropdown: ->
    element(By.css('.proposal-actions-dropdown__btn')).click()

  clickProposalActionsDropdownEdit: ->
    element(By.css('.proposal-actions-dropdown__edit-link')).click()

  clickProposalActionsDropdownClose: ->
    element(By.css('.proposal-actions-dropdown__close-link')).click()

  clickCloseProposalButton: ->
    element(By.css('.close-proposal-form__submit-btn')).click()

  previousProposalsList: ->
    element(By.css('.previous-proposals-card')).getText()

  clickSaveProposalChangesButton: ->
    element(By.css('.proposal-form__save-changes-btn')).click()

  currentProposalHeading: ->
    element(By.css('.proposal-expanded__proposal-name')).getText()

  clickProposalExpandLink: ->
    element(By.css('a.proposal-collapsed')).click()

  currentExpandedProposal: ->
    element(By.css('.proposal-expanded')).getText()

  setProposalOutcomeBtn: ->
    element(By.css('.proposal-outcome-panel__set-outcome-btn'))

  fillInProposalOutcome: (body) ->
    element(By.css('.proposal-form__outcome-field')).clear().sendKeys(body)

  submitProposalOutcomeForm: ->
    element(By.css('.proposal-outcome-form__publish-outcome-btn')).click()

  currentExpandedProposalOutcome: ->
    element(By.css('.proposal-outcome-panel__outcome')).getText()

  editOutcomeLink: ->
    element(By.css('.proposal-outcome-panel__edit-outcome-link'))

  voteFormPositionSelect: ->
    element(By.css('.vote-form__select-position'))

  clickShowUndecidedLink: ->
    element(By.css('a.undecided-panel__show-undecided-link')).click()

  undecidedPanel: ->
    element(By.css('.undecided-panel')).getText()

  clickHideUndecidedLink: ->
    element(By.css('a.undecided-panel__hide-undecided-link')).click()

  positionButtons: ->
    element(By.css('.position-buttons-panel'))

  proposalNameInput: ->
    element(By.css('.proposal-form__title-field'))

  editProposalName: ->
    @clickProposalActionsDropdown()
    @clickProposalActionsDropdownEdit()
    element(By.css('.proposal-form__title-field')).clear().sendKeys('Edited proposal title')
    @clickSaveProposalChangesButton()

  editProposalDescription: ->
    @clickProposalActionsDropdown()
    @clickProposalActionsDropdownEdit()
    element(By.css('.proposal-form__details-field')).clear().sendKeys('Edited proposal description')
    @clickSaveProposalChangesButton()

  editProposalNameAndDescription: ->
    @clickProposalActionsDropdown()
    @clickProposalActionsDropdownEdit()
    element(By.css('.proposal-form__title-field')).clear().sendKeys('New edited proposal title')
    element(By.css('.proposal-form__details-field')).clear().sendKeys('New edited proposal description')
    @clickSaveProposalChangesButton()

