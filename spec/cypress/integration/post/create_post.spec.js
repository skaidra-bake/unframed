describe('Create post', () => {
    beforeEach(() => {
      cy.scenario('sign_in');
      cy.visit('/');
      cy.get('[data-id="link-to-login"]').click();
  
      cy.url().should('include', '/sign_in');
  
      cy.get('[name="user[email]"]').type('user@example.com');
      cy.get('[name="user[password]"]').type('password');
  
      cy.get('input.btn')
        .contains('Log in')
        .click();
    });
  
    it('user is able to create post', () => {
      cy.get('[data-id="link-to-new-post"]').click();

      cy.url().should('include', '/posts/new');

      cy.get('[name="post[description]"]').type('This is a description!');
      cy.get('input.btn')
        .contains('Create post')
        .click();

      cy.url().should('include', '/posts/1');
      cy.get('dd')
        .contains('This is a description!')
    });
  });