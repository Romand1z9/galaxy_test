SELECT t1.* FROM (
	SELECT t2.community_id, t2.community_name, t2.permission, COUNT(t2.member_id) as number_of_users FROM
	(
		SELECT 
			c.id as community_id, 
			c.name as community_name,
			p.id as permission_id,
			p.name as permission,
			cmp.member_id
		FROM galaxy_testing.communities as c
		INNER JOIN galaxy_testing.community_members as cm ON c.id = cm.community_id
		INNER JOIN galaxy_testing.community_member_permissions as cmp ON cm.user_id = cmp.member_id
		INNER JOIN galaxy_testing.permissions as p ON cmp.permission_id = p.id
	) as t2
	GROUP BY t2.community_id, t2.permission_id
) as t1
WHERE t1.number_of_users >= 5
ORDER BY t1.community_id DESC, t1.number_of_users ASC
LIMIT 100