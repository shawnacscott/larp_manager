context('Logging in', () => {

  before(() => {
    cy.visit('http://localhost:3000')
  })

  it('Allows Login', () => {

    cy.url().should('eq', 'http://localhost:3000/users/sign_in')

    cy.get('#user_email')
      .type('player@example.com').should('have.value', 'player@example.com')

    cy.get('#user_password')
      .type('password').should('have.value', 'password')

    cy.get('#new_user').submit()

  })
})