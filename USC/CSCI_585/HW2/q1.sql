CREATE TABLE IF NOT EXISTS sponsors (
  sponsor_id INTEGER PRIMARY KEY,
  name TEXT,
  phone_number TEXT
);

INSERT INTO sponsors (name, phone_number) VALUES
  ('Sponsor A', '123-456-7890'),
  ('Sponsor B', '456-789-0123'),
  ('Sponsor C', '789-012-3456');

CREATE TABLE IF NOT EXISTS sponsorships (
  sponsorship_id INTEGER PRIMARY KEY,
  sponsor_id INTEGER,
  platform TEXT,
  amount INTEGER,
  FOREIGN KEY (sponsor_id) REFERENCES sponsors (sponsor_id)
);

INSERT INTO sponsorships (sponsor_id, platform, amount) VALUES
  (1, 'YouTube', 1000),
  (2, 'Facebook', 500),
  (3, 'Twitter', 750),
  (1, 'TikTok', 1250),
  (3, 'Instagram', 1000),
  (2, 'YouTube', 1500);

SELECT s.name, s.phone_number, SUM(sp.amount) AS total_sponsored
FROM sponsors s
INNER JOIN sponsorships sp ON s.sponsor_id = sp.sponsorship_id
WHERE sp.platform = 'YouTube'
GROUP BY s.sponsor_id
ORDER BY total_sponsored DESC
LIMIT 1;
