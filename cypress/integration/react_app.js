describe('React App Page Test', () => {
	it('finds the content "type"', () => {
		cy.visit('http://localhost:3000')
		cy.contains('Hello Word!')
		cy.contains('The world is green!')
		cy.log('Test Complete--')
		
	})
})
