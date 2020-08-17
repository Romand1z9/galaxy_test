/*
Необходимо написать запрос, по которому будут выданы строки с именем
пользователя, названием сообщества, датой присоединения к сообществу,
упорядоченные по убыванию даты присоединения к сообществу. Выбираемые
сообщества должны быть созданы не ранее, чем 2013-01-01 00:00:00.
*/

SELECT u.name as username, c.name as community_name, cm.joined_at as user_joined_at FROM testing.users as u
INNER JOIN testing.community_members as cm ON u.id = cm.user_id
INNER JOIN testing.communities as c ON cm.community_id = c.id
WHERE c.created_at > "2013-01-01 00:00:00"
ORDER BY cm.joined_at DESC