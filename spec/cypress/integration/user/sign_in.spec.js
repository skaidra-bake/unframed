describe('Sign in', () => {
    beforeEach(() => {
        cy.scenario('sign_in');
    });

    it('signs in user with valid credentials', () => {
        cy.userLogin();
    
        cy.get('.notice')
          .contains('Signed in successfully.')
          .should('be.visible');
    });

    it('does not sign in user with invalid credentials', () => {
        cy.userLogin( { email: 'wrong@example.com', password: 'password' })
    
        cy.get('.alert.alert-warning')
          .contains('Invalid Email or password.')
          .should('be.visible');
      });
});