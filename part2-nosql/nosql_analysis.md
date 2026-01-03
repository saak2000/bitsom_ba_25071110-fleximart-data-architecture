NoSQL Database Analysis – FlexiMart
Section A: Limitations of RDBMS

Relational databases work well when data follows a fixed structure, but they become difficult to manage when data varies a lot. In FlexiMart’s product catalog, different categories require different attributes. For example, electronic products need specifications such as RAM, processor, and storage, while fashion products need size, color, and material. Representing all these variations in a relational table would require many optional columns or frequent schema changes, which makes the database harder to maintain.

Schema changes in relational databases are expensive and risky, especially as the system grows. Adding new product attributes often requires altering tables, which can affect performance and existing data. Additionally, storing customer reviews in an RDBMS usually involves multiple tables and complex joins, making queries slower and more difficult to write. As the product catalog expands and becomes more diverse, managing this variability using a rigid relational structure becomes inefficient.

Section B: Benefits of MongoDB

MongoDB solves these issues by using a flexible, document-based structure. Each product is stored as a document, allowing different products to have different attributes without changing the database schema. This makes it easy to store electronics, clothing, and other product types in the same collection while keeping only the relevant fields for each product.

MongoDB also supports embedded documents, which allows customer reviews to be stored directly inside the product document. This reduces the need for joins and improves read performance. In addition, MongoDB is designed for horizontal scalability, meaning it can handle large volumes of data by distributing it across multiple servers. These features make MongoDB well suited for managing a growing and diverse product catalog like FlexiMart’s.

Section C: Trade-offs

Although MongoDB offers flexibility, it also has some limitations. Unlike relational databases, MongoDB does not enforce strong relationships such as foreign keys, so data consistency must be managed at the application level. Additionally, MongoDB is less suitable for complex transactional operations that require strong transactional consistency and reliability across multiple records.Because of these trade-offs, MongoDB is best used alongside a relational database rather than as a complete replacement.