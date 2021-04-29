describe('Like a post', () => {
    beforeEach(() => {
      cy.scenario('sign_in');
      cy.userLogin();
      cy.createPost();
      cy.get('a.like')
        .click();
    });
  
    it('user is able to like a post', () => {
      cy.get('a.unlike')
        .click();
        
      cy.get('a')
        .should('have.class', 'like');
    });
});