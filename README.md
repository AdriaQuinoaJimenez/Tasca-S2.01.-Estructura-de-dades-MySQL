# Task S2.01 - MySQL Data Structure

**Description**: This repository contains the design and implementation of relational database models (ERD) for three distinct business use cases: an optics store, a food delivery franchise, and a video streaming platform. The objective is to demonstrate the ability to translate complex business requirements into efficient, normalized SQL schemas using MySQL.

### Level 1 - Exercise 1: Optics Store
Design a database to manage customers and eyewear sales.
* **Suppliers:** Must track name, full address (street, number, floor, door, city, zip, country), phone, fax, and NIF.
* **Purchasing Policy:** Glasses of a specific brand are bought from a single supplier (1:N relationship).
* **Glasses:** Track brand, prescription (left/right), frame type (floating, plastic, metallic), frame color, lens color, and price.
* **Customers:** Name, address, phone, email, registration date.
    * **Referral System:** System must record which existing customer recommended a new customer (Recursive relationship).
* **Sales:** System must record which employee sold each pair of glasses.

### Level 1 - Exercise 2: Pizzeria
Design a database for a web-based food ordering system.
* **Customers:** Personal data and location. **Constraint:** Localities and Provinces must be in separate tables (Normalization).
* **Orders:** Date/time, type (delivery vs. pickup), total price.
* **Products:** Pizzas, Burgers, and Drinks.
    * **Pizza Categories:** Pizzas have specific categories that can change; other products do not.
* **Stores:** Manage orders. Stores have employees.
* **Employees:** Roles include "Cook" or "Delivery Person".
    * **Delivery Logic:** For home delivery orders, the specific delivery person and delivery timestamp must be recorded.

### Level 2 - Exercise 1: YouTube
A reduced database model for a video sharing platform.
* **Users:** Profile data including zip code.
* **Videos:** Metadata, status (public, hidden, private), tags, and the user who published it.
* **Channels:** Created by users (1:1), allowing subscriptions from other users.
* **Interactions (Likes/Dislikes):**
    * Users can like/dislike videos and comments.
    * **Critical Requirement:** A user can only vote *once* per item (Mutually exclusive Like/Dislike).
* **Playlists:** Can be public or private; contain multiple videos.
* **Comments:** Text, timestamp, associated user, and video.

## ✨ Features

The database design supports the following logical operations:

* **Optics:** Inventory management by brand, sales traceability by employee, and a self-referencing customer referral tree.
* **Pizzeria:** Geographic normalization, logistics management (assigning delivery drivers to specific orders), and product categorization.
* **YouTube:** Full social graph features (subscriptions), content management (playlists, video privacy), and strict constraint enforcement for user interactions to prevent duplicate voting.

## 🛠 Technologies
-   **Database Engine:** MySQL 8.0
-   **Modeling Tool:** MySQL Workbench
-   **Language:** SQL (DDL for schema generation)

## 🚀 Installation and Execution
1.  **Clone the repository:**
    ```bash
    git clone [YOUR_REPOSITORY_URL]
    ```
2.  **Import into MySQL Workbench:**
    * Open MySQL Workbench.
    * Go to `File` > `Open Model` and select the `.mwb` files (`Optica.mwb`, `Pizzeria.mwb`, `Youtube.mwb`).
    * Alternatively, open the `.sql` scripts to view the raw code.
3.  **Deploy the Database (Forward Engineer):**
    * If using the `.mwb` model: Go to `Database` > `Forward Engineer`.
    * Follow the wizard steps to generate the tables in your local MySQL server.
    * If using the `.sql` script: Simply run the script in a query tab to create the schemas.
4.  **Testing:**
    * Verify the tables are created in your MySQL instance.
    * Check constraints (Foreign Keys and Primary Keys) using the "Inspector" tab.

## 🧩 Diagrams and Technical Decisions

### Optics Store Decisions
* **Recursive Relationship:** The `Customer` table has a `recommended_by` column that is a Foreign Key referencing `id_customer` within the same table. This efficiently handles the referral requirement without creating extra tables.
* **Address Atomicity:** Addresses are split into detailed fields (street, floor, door, etc.) to strictly meet the supplier requirements.

### Pizzeria Decisions
* **Geographic Normalization:** Instead of storing "City" and "Province" as text strings in every address, created separate `City` and `Province` tables to reduce redundancy and ensure data integrity.
* **Order Logistics:** Logic separates delivery orders from pickup orders to ensure delivery drivers are only assigned when necessary.

### YouTube Decisions
* **Composite Primary Keys for Votes:** To ensure a user can only vote once per video, the `Video_Like` table uses a Composite Primary Key `(User_id, Video_id)`. This physically prevents duplicate rows at the database level, ensuring data integrity better than a software check.
* **Playlist Separation:** Split into `Playlist` (for the folder metadata like name/status) and `Playlist_Video` (the intermediate table holding the actual content) to correctly model the Many-to-Many relationship.
* **Channel Ownership:** Implemented a 1:1 relationship between `User` and `Channel`, ensuring one user owns one channel, while allowing a 1:N relationship for `Subscriptions`.
