/*
Необходимо написать запрос, по которому будут выданы все строки с именем
пользователя, названием сообщества и и названием разрешения, которое у
него в этом сообществе. Имя пользователя должно содержать букву T в любом
регистре или название разрешения должно содержать подстроку articles .
Название сообщества должно содержать не менее 15 символов.
*/

SELECT u.name as username, c.name as community_name, p.name as permission FROM testing.users as u
INNER JOIN testing.community_members as cm ON u.id = cm.user_id
INNER JOIN testing.communities as c ON cm.community_id = c.id
INNER JOIN testing.community_member_permissions AS cmp ON cm.user_id = cmp.member_id
INNER JOIN testing.permissions AS p ON cmp.permission_id = p.id
WHERE (p.name LIKE "%articles%" OR LOWER(u.name) LIKE "%t%") AND LENGTH(c.name) >= 15
ORDER BY u.id ASC, c.name