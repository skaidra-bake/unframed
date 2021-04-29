describe('Like a post', () => {
    beforeEach(() => {
      cy.scenario('sign_in');
      cy.userLogin();
      cy.createPost();
    });
  
    it('user is able to like a post', () => {
      cy.get('a.like')
        .click();

      cy.get('a')
        .should('have.class', 'unlike');     
    });
});