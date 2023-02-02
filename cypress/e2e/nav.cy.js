context('Logged out Nav Bar', () => {

  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('Links to Root Route', () => {

    cy.url().should('eq', 'http://localhost:3000/users/sign_in')

    cy.contains('Navbar')

    cy.url().should('eq', 'http://localhost:3000/users/sign_in')
  })

  it('Links to Chapters', () => {

    cy.contains('Chapters').click()

    //cy.url().should('eq', 'http://localhost:3000/chapters')

  })

  it('Links to Events', () => {

    cy.contains('Events').click()

    //cy.url().should('eq', 'http://localhost:3000/events')

  })

  it('Links to Campaigns', () => {

    cy.contains('Campaigns').click()

    //cy.url().should('eq', 'http://localhost:3000/campaigns')

  })

  it('Links to Sign In', () => {

    cy.contains('Sign In').click()

    cy.url().should('eq', 'http://localhost:3000/users/sign_in')

  })

  it('Links to Sign Up', () => {

    cy.contains('Sign Up').click()

    cy.url().should('eq', 'http://localhost:3000/users/sign_up')
    
    cy.contains('Sign up')

    cy.contains('Password confirmation')

  })

})