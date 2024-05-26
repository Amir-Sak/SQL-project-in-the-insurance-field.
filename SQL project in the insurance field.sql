--  Insurance Management System project
CREATE TABLE customers (
    customer_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT,
    phone_number TEXT,
    email TEXT
);
CREATE TABLE agents (
    agent_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name TEXT NOT NULL,
    phone_number TEXT,
    email TEXT
);
CREATE TABLE policies (
    policy_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    customer_id INTEGER,
    agent_id INTEGER,
    policy_type TEXT,
    policy_start_date DATE,
    policy_end_date DATE,
    premium REAL,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);
CREATE TABLE claims (
    claim_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    policy_id INTEGER,
    claim_date DATE,
    claim_amount REAL,
    status TEXT,
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);
CREATE TABLE payments (
    payment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    policy_id INTEGER,
    payment_date DATE,
    amount REAL,
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);
-- Inserting Sample Data
INSERT INTO customers (name, address, phone_number, email) VALUES
('Alice Johnson', '123 Main St', '555-1234', 'alice.johnson@example.com'),
('Bob Smith', '456 Elm St', '555-5678', 'bob.smith@example.com');

INSERT INTO agents (name, phone_number, email) VALUES
('Emma Brown', '555-9876', 'emma.brown@example.com'),
('Liam Davis', '555-4321', 'liam.davis@example.com');

INSERT INTO policies (customer_id, agent_id, policy_type, policy_start_date, policy_end_date, premium, status) VALUES
(1, 1, 'Health', '2023-01-01', '2023-12-31', 500.00, 'Active'),
(2, 2, 'Auto', '2023-02-01', '2023-08-31', 300.00, 'Active');

INSERT INTO claims (policy_id, claim_date, claim_amount, status) VALUES
(1, '2023-05-10', 200.00, 'Processed'),
(2, '2023-06-15', 1000.00, 'Pending');

INSERT INTO payments (policy_id, payment_date, amount) VALUES
(1, '2023-01-15', 250.00),
(1, '2023-07-15', 250.00),
(2, '2023-02-10', 150.00),
(2, '2023-05-10', 150.00);

-- some Advanced Queries
-- Retrieve Customer and their Policies along with Agent Details:
SELECT 
    customers.name AS customer_name,
    policies.policy_id,
    policies.policy_type,
    policies.policy_start_date,
    policies.policy_end_date,
    policies.premium,
    agents.name AS agent_name
FROM 
    policies
JOIN 
    customers ON policies.customer_id = customers.customer_id
JOIN 
    agents ON policies.agent_id = agents.agent_id;
--  Retrieve Policies with their Total Claims Amount:
SELECT 
    policies.policy_id,
    policies.policy_type,
    SUM(claims.claim_amount) AS total_claim_amount
FROM 
    policies
JOIN 
    claims ON policies.policy_id = claims.policy_id
GROUP BY 
    policies.policy_id, policies.policy_type;
--  Retrieve Customers with Active Policies and their Total Premium Paid:
SELECT 
    customers.name AS customer_name,
    policies.policy_id,
    policies.policy_type,
    SUM(payments.amount) AS total_premium_paid
FROM 
    customers
JOIN 
    policies ON customers.customer_id = policies.customer_id
JOIN 
    payments ON policies.policy_id = payments.policy_id
WHERE 
    policies.status = 'Active'
GROUP BY 
    customers.name, policies.policy_id, policies.policy_type;
--  Retrieve Agents and the Number of Policies They Manage:
SELECT 
    agents.name AS agent_name,
    COUNT(policies.policy_id) AS number_of_policies
FROM 
    agents
LEFT JOIN 
    policies ON agents.agent_id = policies.agent_id
GROUP BY 
    agents.name;
