CREATE TABLE todo(
  todo_id SERIAL PRIMARY KEY,
  description VARCHAR(255)
);

INSERT INTO todo (description) VALUES ('eat breakfast'), ('get 8 hours of REM sleep');