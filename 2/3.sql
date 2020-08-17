SELECT u.name as username, c.name as community_name, p.name as permission FROM galaxy_testing.users as u
INNER JOIN galaxy_testing.community_members as cm ON u.id = cm.user_id
INNER JOIN galaxy_testing.communities as c ON cm.community_id = c.id
INNER JOIN galaxy_testing.community_member_permissions AS cmp ON cm.user_id = cmp.member_id
INNER JOIN galaxy_testing.permissions AS p ON cmp.permission_id = p.id
WHERE (p.name LIKE "%articles%" OR LOWER(u.name) LIKE "%t%") AND LENGTH(c.name) >= 15
ORDER BY u.id ASC, c.name