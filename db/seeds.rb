# START Create article, author, categories, comments

article = BlogBoi::Article.create({
	title: 'Make More Sales: 3 Ways to Reduce No-Shows', 
	slug: 'reduce-no-shows',
	text: 'It is so lit.',
	author_name: 'Charlie Reese',
	description: 'This is the description. It is very exciting.',
	category_names: "no-shows, sales growth",
})

article.comments.create({
	text: "Comment text stuff",
})

article.comments.create({
	text: "Other comment text stuff",
})

# END Create article, author, categories, comments


puts "Seeded DB"