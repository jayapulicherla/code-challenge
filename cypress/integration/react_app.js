describe('React App Page Test', () => {
	it('finds the content "type"', () => {
		cy.visit('http://google.com')
		cy.contains('Hello World!')
		cy.contains('The world is green!')
		
	})
})
