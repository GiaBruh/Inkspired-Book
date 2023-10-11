Group 3 Final Project

Syntax rules:
Backend --
Model properties: the same as properties in PostgreSQL table
method name: camelCase -> getAll();
request attribute name: all uppercase -> USERNAME
dao object: first letter of model + "Dao" -> UserDAO uDao = new UserDao();

Front-end --
tag name properties: no uppercase -> username
tag value properties: the same as how value display in PostgreSQL -> PostgreSQL has gender properties with value 'female', then html tag value prop must be 'female'
tag id name: camelCase -> userName
tag class name: snake_case but with '-' symbol -> user-name
