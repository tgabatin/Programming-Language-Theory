# Homework 1

The assignment is to implement a database similar to that of Chatper 3 in the Practical Common Lisp book for contact information.

Each contact has a first name, a string as a last name, or both. For example, a contact with "Hello" as first name and "World" as last name is fine. Or a contact might just have a first name such as "Hello", and no last name, or just a last name and no first name. At least one of the first and last name must be defined.

Each contact also has zero or more addresses and zero or more phone numbers. Like first names and last names, each of these is just a string. An example address is "2500 Campus Road, Honolulu, HI 96822", and an example phone number is "+1 (808) 956-8111".
Although we humans expect addresses and phone numbers to have a specific format, for this assignment your program should accept any string as an address and any string as a phone number.
Your database must provide these operations:

	•	make-contact (similar to make-cd)
	•	add-contacts (similar to add-cds)
	•	dump-db, save-db, and load-db
	•	select and where, allowing you to select on :first-name, :last-name, :address, and :phone

**NOTE**

Complexity was added to the original assignment for a personal challenge. The added complexity is as follows:

Add support for multiple databases: You could modify the code to support multiple databases, each with its own set of contacts. This involves the addition of functions to create, delete, and switch between databases, as well as modifying the existing functions to operate on currently active databases.