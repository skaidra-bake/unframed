describe('Comment on post', () => {
    beforeEach(() => {
      cy.scenario('sign_in');
      cy.userLogin();
      cy.createPost();
    });
  
    it('user is able to comment on post', () => {
      cy.get('[name="comment[body]"]').type('This is a comment!')
      cy.get('input.btn')
        .contains('Post Comment')
        .click();

      cy.get('p')
        .contains('This is a comment!')
    });
});