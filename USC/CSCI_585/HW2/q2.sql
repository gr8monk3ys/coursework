CREATE TABLE content_creators (
  creator_id INTEGER PRIMARY KEY,
  username TEXT,
  subscriber_count INTEGER,
  country TEXT
);

CREATE TABLE videos (
  video_id INTEGER PRIMARY KEY,
  title TEXT,
  description TEXT,
  views INTEGER,
  likes INTEGER,
  dislikes INTEGER,
  upload_date TEXT,
  creator_id INTEGER,
  FOREIGN KEY (creator_id) REFERENCES content_creators (creator_id)
);

CREATE TABLE comments (
  comment_id INTEGER PRIMARY KEY,
  text TEXT,
  likes INTEGER,
  video_id INTEGER,
  FOREIGN KEY (video_id) REFERENCES videos (video_id)
);

INSERT INTO content_creators VALUES
  (1, 'Marvel Entertainment', 5000000, 'US'),
  (2, 'DC Comics', 4000000, 'US'),
  (3, 'Disney', 6000000, 'US');

INSERT INTO videos VALUES
  (1, 'Avengers: Endgame Trailer', 'The official trailer for Avengers: Endgame', 5000000, 100000, 5000, '2019-03-14', 1),
  (2, 'Black Widow Trailer', 'The official trailer for Black Widow', 3000000, 80000, 2000, '2019-12-03', 1),
  (3, 'The Batman Trailer', 'The official trailer for The Batman', 2000000, 50000, 1000, '2021-03-04', 2),
  (4, 'Disney World Tour', 'A tour of Disney World', 1000000, 20000, 100, '2020-06-15', 3),
  (5, 'Marvel Studios Tour', 'A tour of Marvel Studios', 2000000, 40000, 2000, '2021-08-20', 1);

INSERT INTO comments VALUES
  (1, 'Awesome trailer!', 100, 1),
  (2, 'Can''t wait to see this movie!', 50, 1),
  (3, 'This movie looks terrible', 5, 3),
  (4, 'I love Disney World!', 30, 4),
  (5, 'Marvel Studios is amazing!', 80, 5);

SELECT v.title, c.username, CAST(v.likes AS FLOAT) / v.views AS ratio
FROM videos v
JOIN content_creators c ON v.creator_id = c.creator_id
WHERE c.username LIKE '%Marvel Entertainment%'
ORDER BY v.title ASC;
