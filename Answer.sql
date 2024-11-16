-- Answer 1:
-- ----------------------------------------
SELECT 
    p.location,
    p.post_id,
    p.caption,
    u.username,
    u.user_id
FROM 
    post p
JOIN 
    users u ON p.user_id = u.user_id
WHERE 
    p.location IS NOT NULL
ORDER BY 
    p.location, p.created_at;


-- Answer 2:
-- --------------------------------------
SELECT 
    h.hashtag_name,
    COUNT(hf.user_id) AS total_followers
FROM 
    hashtags h
JOIN 
    hashtag_follow hf ON h.hashtag_id = hf.hashtag_id
GROUP BY 
    h.hashtag_id, h.hashtag_name
ORDER BY 
    total_followers DESC
LIMIT 5;


-- Answer 3:
-- --------------------------------------
SELECT 
    h.hashtag_name,
    COUNT(pt.post_id) AS usage_count
FROM 
    hashtags h
JOIN 
    post_tags pt ON h.hashtag_id = pt.hashtag_id
GROUP BY 
    h.hashtag_id, h.hashtag_name
ORDER BY 
    usage_count DESC
LIMIT 10;


-- Answer 4:
-- --------------------------------------

SELECT 
    u.user_id,
    u.username
FROM 
    users u
WHERE 
    u.user_id NOT IN (SELECT p.user_id FROM post p);


-- Answer 5:
-- ---------------------------------------
SELECT 
    p.post_id,
    p.caption,
    u.username,
    COUNT(pl.user_id) AS like_count
FROM 
    post p
JOIN 
    post_likes pl ON p.post_id = pl.post_id
JOIN 
    users u ON p.user_id = u.user_id
GROUP BY 
    p.post_id, p.caption, u.username
ORDER BY 
    like_count DESC
LIMIT 1;


-- Answer 6:
-- ----------------------------------

SELECT 
    COUNT(*) * 1.0 / COUNT(DISTINCT u.user_id) AS average_posts_per_user
FROM 
    users u
LEFT JOIN 
    post p ON u.user_id = p.user_id;


-- Answer 7:
-- ---------------------------------------

SELECT 
    u.user_id,
    u.username,
    COUNT(l.login_id) AS total_logins
FROM 
    users u
LEFT JOIN 
    login l ON u.user_id = l.user_id
GROUP BY 
    u.user_id, u.username
ORDER BY 
    total_logins DESC;


-- Answer 8:
-- -------------------------------------------

SELECT 
    u.user_id,
    u.username
FROM 
    users u
JOIN 
    post_likes pl ON u.user_id = pl.user_id
GROUP BY 
    u.user_id, u.username
HAVING 
    COUNT(DISTINCT pl.post_id) = (SELECT COUNT(*) FROM post);


-- Answer 9:
-- --------------------------------------------

SELECT 
    u.user_id,
    u.username
FROM 
    users u
WHERE 
    u.user_id NOT IN (SELECT c.user_id FROM comments c);


 -- Answer 10:
 -- ---------------------------------------------

 SELECT 
    u.user_id,
    u.username
FROM 
    users u
JOIN 
    comments c ON u.user_id = c.user_id
GROUP BY 
    u.user_id, u.username
HAVING 
    COUNT(DISTINCT c.post_id) = (SELECT COUNT(*) FROM post);


-- Answer 11:
-- ---------------------------------------------------

SELECT 
    u.user_id,
    u.username
FROM 
    users u
LEFT JOIN 
    follows f ON u.user_id = f.followee_id
WHERE 
    f.followee_id IS NULL;


-- Answer 12:
-- --------------------------------------------------

SELECT 
    u.user_id,
    u.username
FROM 
    users u
LEFT JOIN 
    follows f ON u.user_id = f.follower_id
WHERE 
    f.follower_id IS NULL;


-- Answer 13:
-- -------------------------------------------------

SELECT 
    u.user_id,
    u.username,
    COUNT(p.post_id) AS total_posts
FROM 
    users u
JOIN 
    post p ON u.user_id = p.user_id
GROUP BY 
    u.user_id, u.username
HAVING 
    COUNT(p.post_id) > 5;


-- Answer 14:
-- ------------------------------------------------

SELECT 
    u.user_id,
    u.username,
    COUNT(f.follower_id) AS total_followers
FROM 
    users u
JOIN 
    follows f ON u.user_id = f.followee_id
GROUP BY 
    u.user_id, u.username
HAVING 
    COUNT(f.follower_id) > 40;


-- Answer 15:
-- ---------------------------------------------------

SELECT 
    c.comment_id,
    c.comment_text,
    u.username
FROM 
    comments c
JOIN 
    users u ON c.user_id = u.user_id
WHERE 
    c.comment_text REGEXP '\\b(good|beautiful)\\b';


 -- Answer 16:
 -- --------------------------------------------------

 SELECT 
    p.post_id,
    p.caption,
    LENGTH(p.caption) AS caption_length
FROM 
    post p
ORDER BY 
    caption_length DESC
LIMIT 5;

