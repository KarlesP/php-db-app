CREATE TABLE test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value VARCHAR(255)
);

INSERT INTO test (value) VALUES ('Hello from local DB'), ('It works!');
