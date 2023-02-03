context('Home Page', () => {

  beforeEach(() => {
    //Login
    cy.visit('http://localhost:3000/')

    cy.get('#user_email')
      .type('player@example.com')

    cy.get('#user_password')
      .type('password')

    cy.get('#new_user').submit()
  })

  it('Has Character Profiles', () => {

    cy.url().should('eq', 'http://localhost:3000/')

    cy.get('#profile_1').should('have.id', 'profile_1')

  })
})