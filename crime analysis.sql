CREATE TABLE CrimeData (
   ID INT PRIMARY KEY,
   CaseNumber VARCHAR(50),
   Date DATETIME,
   Block VARCHAR(255),
   IUCR VARCHAR(10),
   PrimaryType VARCHAR(255),
   Description VARCHAR(255),
   LocationDescription VARCHAR(255),
   Arrest VARCHAR(5),
   Domestic VARCHAR(5),
   Beat VARCHAR(10),
   District VARCHAR(10),
   Ward VARCHAR(10),
   CommunityArea VARCHAR(10),
   FBICode VARCHAR(10),
   XCoordinate FLOAT,
   YCoordinate FLOAT,
   Year INT,
   UpdatedOn DATETIME,
   Latitude FLOAT,
   Longitude FLOAT,
   Location VARCHAR(255),
   CrimeLocation VARCHAR(500)
);


-- 2) theft costs more than $500.
SELECT * FROM crime_us
WHERE `Primary Type` = 'THEFT' AND Description LIKE 'OVER $500%';


-- 3) overall number of cases for each major category of crime
SELECT `Primary Type`, COUNT(*) as TotalCases
FROM crime_us
GROUP BY `Primary Type`
ORDER BY TotalCases DESC;


-- 4) Apply 1NF normalization to the dataset provided
INSERT INTO CrimeLocation (ID, LocationDescription, Location)
SELECT DISTINCT ID, LocationDescription, Location
FROM crime_us;
