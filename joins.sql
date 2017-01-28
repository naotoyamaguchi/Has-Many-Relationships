-- Create a query to get all fields from the users table
SELECT * FROM users;
-- Create a query to get all fields from the posts table where the user_id is 100
SELECT * FROM posts WHERE users_id = 100;
-- Create a query to get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200
SELECT first_name, last_name, posts.* FROM users JOIN posts ON posts.users_id = users.id WHERE users.id = 200;
 -- Create a query to get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
SELECT username, posts.* FROM users JOIN posts ON posts.users_id = users.id WHERE first_name = 'Norene' AND last_name = 'Schmitt';
-- Create a query to get usernames from the users table where the user has created a post after January 1, 2015
SELECT username FROM users JOIN posts ON posts.users_id = users.id WHERE posts.created_at > '2015-01-01 00:00:00-10';
-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015
SELECT title, content, username FROM posts JOIN users ON posts.users_id = users.id WHERE users.created_at < '2015-01-01 00:00:00-10';
-- Create a query to get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields
SELECT posts.title AS "Post Title", comments.* FROM comments JOIN posts ON comments.posts_id = posts.id;
-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015
SELECT c.*, p.title AS "post_title", p.url AS "post_url", c.body AS "comment_body" FROM users u JOIN posts p ON p.users_id = u.id JOIN comments c ON c.posts_id = p.id WHERE p.created_at < '2015-01-01 00:00:00-10';
-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015
SELECT comments.*, posts.title as post_title, posts.url as post_url, comments.body as comment_body FROM posts JOIN comments ON comments.posts_id = posts.id WHERE posts.created_at > '2015-01-01 00:00:00-10';

-- Create a query to get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'
SELECT comments.*, posts.title as post_title, posts.url as post_url, comments.body as comment_body FROM posts JOIN comments ON comments.posts_id = posts.id WHERE comments.body LIKE '%USB%';
-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
SELECT posts.title as post_title, comments.body as comment_body, users.first_name, users.last_name FROM users INNER JOIN posts ON posts.users_id = users.id INNER JOIN comments ON comments.posts_id = posts.id WHERE comments.body LIKE '%matrix%';
-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )
SELECT posts.title as post_title, comments.body as comment_body, users.first_name, users.last_name FROM users INNER JOIN comments ON comments.users_id = users.id INNER JOIN posts ON posts.id = comments.posts_id WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';
-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )
SELECT posts.title as post_title, comments.body as comment_body, users.first_name as "posts_author_first_name", users.last_name as "posts_author_last_name", users.username as "comment_author_username" FROM users INNER JOIN posts ON users.id = posts.users_id INNER JOIN comments ON posts.id = comments.posts_id WHERE (comments.body LIKE '%SSL%' or comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';