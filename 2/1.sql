SELECT u.name as username, c.name as community_name, cm.joined_at as user_joined_at FROM galaxy_testing.users as u
INNER JOIN galaxy_testing.community_members as cm ON u.id = cm.user_id
INNER JOIN galaxy_testing.communities as c ON cm.community_id = c.id
WHERE c.created_at > "2013-01-01 00:00:00"
ORDER BY cm.joined_at DESC