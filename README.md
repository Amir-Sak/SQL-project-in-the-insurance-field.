### Project Summary: Insurance Management System

**Objective:**
Develop a simple database system to manage insurance customers, policies, and claims.

**Database Structure:**

1. **Tables:**
    - **Customers:** Stores customer information such as name, address, phone number, and email.
    - **Policies:** Stores insurance policy details linked to customers, including policy type, start and end dates, and premium amounts.
    - **Claims:** Stores claim information linked to policies, including claim date, amount, and status.

2. **Relationships:**
    - Policies are linked to customers via a foreign key (customer_id).
    - Claims are linked to policies via a foreign key (policy_id).

**Operations:**

1. **Data Insertion:**
    - Insert records for customers, policies, and claims into their respective tables.

2. **Data Update:**
    - Update policy details, such as changing the premium amount for a specific policy.

3. **Data Deletion:**
    - Delete claim records as needed.

4. **Data Retrieval:**
    - Retrieve all policies associated with a specific customer.
    - Retrieve all claims associated with a specific policy.

**Summary:**
This project provides a foundational structure for an insurance management database. It demonstrates the creation and management of interconnected tables for customers, policies, and claims. The project includes basic operations such as inserting, updating, deleting, and retrieving records, forming a versatile base for more complex insurance management applications.
