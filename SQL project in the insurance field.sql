-- Create tables
CREATE TABLE customers (
    customer_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT,
    phone_number TEXT,
    email TEXT
);

CREATE TABLE policies (
    policy_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    customer_id INTEGER,
    policy_type TEXT,
    policy_start_date DATE,
    policy_end_date DATE,
    premium REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE claims (
    claim_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    policy_id INTEGER,
    claim_date DATE,
    claim_amount REAL,
    status TEXT,
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

-- Insert data into customers
INSERT INTO customers (name, address, phone_number, email) VALUES
('John Doe', '123 Main St', '555-1234', 'john.doe@example.com'),
('Jane Smith', '456 Elm St', '555-5678', 'jane.smith@example.com');

-- Insert data into policies
INSERT INTO policies (customer_id, policy_type, policy_start_date, policy_end_date, premium) VALUES
(1, 'Health', '2023-01-01', '2023-12-31', 500.00),
(2, 'Auto', '2023-02-01', '2023-08-31', 300.00);

-- Insert data into claims
INSERT INTO claims (policy_id, claim_date, claim_amount, status) VALUES
(1, '2023-05-10', 200.00, 'Processed'),
(2, '2023-06-15', 1000.00, 'Pending');

-- Update a policy
UPDATE policies
SET premium = 550.00
WHERE policy_id = 1;

-- Delete a claim
DELETE FROM claims
WHERE claim_id = 2;

-- Select policies for a customer
SELECT * FROM policies
WHERE customer_id = 1;

-- Select claims for a policy
SELECT * FROM claims
WHERE policy_id = 1;
