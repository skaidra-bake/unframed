describe('Create post', () => {
    beforeEach(() => {
      cy.scenario('sign_in');
      cy.userLogin();
    });
  
    it('user is able to create post', () => {
      cy.createPost();

      cy.url().should('include', '/posts/1');
      cy.get('dd')
        .contains('This is a description!')
    });
});