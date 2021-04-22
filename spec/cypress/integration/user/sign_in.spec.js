describe('Sign in', () => {
    beforeEach(() => {
        cy.scenario('sign_in');
        cy.visit('/');
    });

    it('signs in user with valid credentials', () => {
        cy.get('[data-id="link-to-login"]').click();
    
        cy.url().should('include', '/sign_in');
    
        cy.get('[name="user[email]"]').type('user@example.com');
        cy.get('[name="user[password]"]').type('password');
    
        cy.get('input.btn')
          .contains('Log in')
          .click();
    
        cy.get('.notice')
          .contains('Signed in successfully.')
          .should('be.visible');
    });

    it('does not sign in user with invalid credentials', () => {
        cy.get('[data-id="link-to-login"]').click();
    
        cy.url().should('include', '/sign_in');
    
        cy.get('[name="user[email]"]').type('wrong_email@example.com');
        cy.get('[name="user[password]"]').type('test123');
    
        cy.get('input.btn')
          .contains('Log in')
          .click();
    
        cy.get('.alert.alert-warning')
          .contains('Invalid Email or password.')
          .should('be.visible');
      });
});