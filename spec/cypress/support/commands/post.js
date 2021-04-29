Cypress.Commands.add('createPost', (post = {}) => {
    const { description = 'This is a description!' } = post; // This will allow us to override the post's details in the future

    cy.get('[data-id="link-to-new-post"]').click();

    cy.url().should('include', '/posts/new');

    cy.get('[name="post[description]"]').type(description);
    cy.get('input.btn')
      .contains('Create post')
      .click();
});