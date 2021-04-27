Cypress.Commands.add('userLogin', (user = {}) => {
    const { email = 'user@example.com', password = 'password' } = user; // This will allow us to override the user's details in the future

    cy.visit('/');
    cy.get('[data-id="link-to-login"]').click();

    cy.url().should('include', '/sign_in');

    cy.get('[name="user[email]"]').type(email);
    cy.get('[name="user[password]"]').type(password);

    cy.get('input.btn')
      .contains('Log in')
      .click();
});