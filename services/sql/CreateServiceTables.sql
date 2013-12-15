/* 
 * Title: CreateServiceTables.sql
 * Project: GoSeek Hybrid App
 * Version: 0.1.1
 * Author: Connor Luke Goddard
 *
 * Copyright: (c) Connor Luke Goddard 2013
 */
 
 -- Remove any existing tables from the database.
 
 DROP TABLE IF EXISTS Locations;
 DROP TABLE IF EXISTS Creators;
 DROP TABLE IF EXISTS Routes;
 DROP TABLE IF EXISTS CreatedRoutes;
 DROP TABLE IF EXISTS RouteWaypoints;
 
 -- End removing existing tables. 
 
 -- Create model tables that will store the route, location and creator data. 
 -- (Has to be created in a specific order for FK constraints to be applied.)
 
CREATE TABLE Locations (
  location_ID INT NOT NULL AUTO_INCREMENT,
  longitude FLOAT(10,6) NOT NULL,
  latitude FLOAT(10,6) NOT NULL,
  PRIMARY KEY (location_ID)
);

CREATE TABLE Creators (
  creator_ID INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email_address VARCHAR(200) NOT NULL,
  created_date DATETIME NOT NULL,
  last_active_date DATETIME NOT NULL,
  PRIMARY KEY (creator_ID)
);

CREATE TABLE Routes (
  route_ID CHAR(13) NOT NULL,
  route_name VARCHAR(50) NOT NULL,
  total_length INT,
  creator_ID INT NOT NULL,
  created_date DATETIME NOT NULL,
  last_modified DATETIME NOT NULL,
  PRIMARY KEY (route_ID),
  FOREIGN KEY (creator_ID) REFERENCES Creators(creator_ID)
);

-- End creating model tables.

-- Create relationship tables to link routes, locations and creators together.

CREATE TABLE CreatedRoutes (
  creator_ID INT NOT NULL,
  route_ID CHAR(13) NOT NULL,
  PRIMARY KEY (creator_ID, route_ID),
  FOREIGN KEY (creator_ID) REFERENCES Creators(creator_ID),
  FOREIGN KEY (route_ID) REFERENCES Routes(route_ID)
);

CREATE TABLE RouteWaypoints (
  route_ID CHAR(13) NOT NULL,
  location_ID INT NOT NULL,
  PRIMARY KEY (route_ID, location_ID),
  FOREIGN KEY (route_ID) REFERENCES Routes(route_ID),
  FOREIGN KEY (location_ID) REFERENCES Locations(location_ID)
);

-- End creating relationship tables. 


