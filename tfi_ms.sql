-- TFI Heroes Database Script
-- Created for Telugu Film Industry Heroes with Experience and Salaries

-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'TFI_Heroes')
BEGIN
    CREATE DATABASE TFI_Heroes;
END
GO

USE TFI_Heroes;
GO

-- Drop table if exists
IF OBJECT_ID('dbo.Heroes', 'U') IS NOT NULL
    DROP TABLE dbo.Heroes;
GO

-- Create Heroes Table
CREATE TABLE dbo.Heroes
(
    HeroID INT IDENTITY(1,1) PRIMARY KEY,
    HeroName NVARCHAR(100) NOT NULL,
    RealName NVARCHAR(100),
    DateOfBirth DATE,
    DebutMovie NVARCHAR(150),
    DebutYear INT,
    YearsOfExperience INT,
    NumberOfMovies INT,
    SalaryPerMovie DECIMAL(18,2), -- In Indian Rupees (INR)
    SalaryCurrency NVARCHAR(10) DEFAULT 'INR',
    RemunerationCategory NVARCHAR(50), -- Tier 1, Tier 2, etc.
    ActiveStatus BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),
    ModifiedDate DATETIME DEFAULT GETDATE()
);
GO

-- Insert TFI Heroes Data
INSERT INTO dbo.Heroes 
    (HeroName, RealName, DateOfBirth, DebutMovie, DebutYear, YearsOfExperience, NumberOfMovies, SalaryPerMovie, RemunerationCategory)
VALUES
    -- Tier 1 Heroes (Super Stars)
    ('Prabhas', 'Uppalapati Venkata Suryanarayana Prabhas Raju', '1979-10-23', 'Eeswar', 2002, 22, 25, 150000000.00, 'Tier 1'),
    ('Mahesh Babu', 'Ghattamaneni Mahesh Babu', '1975-08-09', 'Rajakumarudu', 1999, 25, 28, 120000000.00, 'Tier 1'),
    ('Allu Arjun', 'Allu Arjun', '1982-04-08', 'Gangotri', 2003, 21, 22, 100000000.00, 'Tier 1'),
    ('Ram Charan', 'Konidela Ram Charan Teja', '1985-03-27', 'Chirutha', 2007, 17, 15, 100000000.00, 'Tier 1'),
    ('NTR Jr', 'Nandamuri Taraka Rama Rao Jr', '1983-05-20', 'Ninnu Choodalani', 2001, 23, 30, 90000000.00, 'Tier 1'),
    ('Pawan Kalyan', 'Konidela Kalyan Babu', '1971-09-02', 'Akkada Ammayi Ikkada Abbayi', 1996, 28, 25, 85000000.00, 'Tier 1'),
    ('Vijay Deverakonda', 'Vijay Deverakonda', '1989-05-09', 'Nuvvila', 2011, 13, 25, 50000000.00, 'Tier 1'),
    
    -- Tier 2 Heroes (Senior Stars)
    ('Ravi Teja', 'Bhupatiraju Ravi Shankar Raju', '1968-01-26', 'Karthavyyam', 1990, 34, 70, 40000000.00, 'Tier 2'),
    ('Naga Chaitanya', 'Naga Chaitanya Akkineni', '1986-11-23', 'Josh', 2009, 15, 25, 35000000.00, 'Tier 2'),
    ('Nani', 'Ghanta Naveen Babu', '1984-02-24', 'Ashta Chamma', 2008, 16, 30, 30000000.00, 'Tier 2'),
    ('Ram Pothineni', 'Ram Pothineni', '1988-05-15', 'Devadasu', 2006, 18, 25, 25000000.00, 'Tier 2'),
    ('Sai Dharam Tej', 'Sai Dharam Tej', '1986-10-15', 'Pilla Nuvvu Leni Jeevitham', 2014, 10, 20, 20000000.00, 'Tier 2'),
    ('Nithiin', 'Nithin Kumar Reddy', '1983-03-30', 'Jayam', 2002, 22, 30, 18000000.00, 'Tier 2'),
    ('Sharwanand', 'Sharwanand Myneni', '1984-03-06', 'Aidanam', 2004, 20, 30, 15000000.00, 'Tier 2'),
    
    -- Tier 3 Heroes (Rising Stars)
    ('Adivi Sesh', 'Adivi Sesh', '1985-12-17', 'Karma', 2010, 14, 15, 12000000.00, 'Tier 3'),
    ('Sundeep Kishan', 'Sundeep Kishan', '1987-05-07', 'Sneha Geetham', 2010, 14, 25, 10000000.00, 'Tier 3'),
    ('Naveen Polishetty', 'Naveen Polishetty', '1989-02-26', 'Agent Sai Srinivasa Athreya', 2019, 5, 5, 8000000.00, 'Tier 3'),
    ('Vishwak Sen', 'Vishwak Sen', '1994-11-09', 'Vellipomakey', 2017, 7, 10, 7000000.00, 'Tier 3'),
    ('Kiran Abbavaram', 'Kiran Abbavaram', '1992-07-15', 'Raja Vaaru Rani Gaaru', 2019, 5, 8, 5000000.00, 'Tier 3'),
    
    -- Tier 4 Heroes (Emerging)
    ('Sree Vishnu', 'Sree Vishnu', '1985-04-19', 'Prema Ishq Kaadhal', 2013, 11, 15, 4000000.00, 'Tier 4'),
    ('Anand Deverakonda', 'Anand Deverakonda', '1990-11-15', 'Dorasani', 2019, 5, 5, 3000000.00, 'Tier 4'),
    ('Priyadarshi', 'Priyadarshi Pulikonda', '1988-08-05', 'Pelli Choopulu', 2016, 8, 10, 2500000.00, 'Tier 4'),
    ('Suhas', 'Suhas', '1992-09-10', 'Colour Photo', 2020, 4, 6, 2000000.00, 'Tier 4');
GO

-- Create Indexes for Performance
CREATE NONCLUSTERED INDEX IX_Heroes_HeroName ON dbo.Heroes(HeroName);
CREATE NONCLUSTERED INDEX IX_Heroes_RemunerationCategory ON dbo.Heroes(RemunerationCategory);
CREATE NONCLUSTERED INDEX IX_Heroes_YearsOfExperience ON dbo.Heroes(YearsOfExperience);
CREATE NONCLUSTERED INDEX IX_Heroes_SalaryPerMovie ON dbo.Heroes(SalaryPerMovie);
GO

-- Create View for Hero Summary
CREATE OR ALTER VIEW dbo.vw_HeroSummary
AS
SELECT 
    HeroID,
    HeroName,
    YearsOfExperience,
    NumberOfMovies,
    SalaryPerMovie,
    RemunerationCategory,
    CASE 
        WHEN SalaryPerMovie >= 100000000 THEN '100+ Crores'
        WHEN SalaryPerMovie >= 50000000 THEN '50-100 Crores'
        WHEN SalaryPerMovie >= 10000000 THEN '10-50 Crores'
        WHEN SalaryPerMovie >= 5000000 THEN '5-10 Crores'
        ELSE 'Below 5 Crores'
    END AS SalaryRange,
    CAST(SalaryPerMovie / NumberOfMovies AS DECIMAL(18,2)) AS AvgEarningsPerMovie
FROM dbo.Heroes
WHERE ActiveStatus = 1;
GO

-- Create Stored Procedure to Get Heroes by Category
CREATE OR ALTER PROCEDURE dbo.sp_GetHeroesByCategory
    @Category NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @Category IS NULL
    BEGIN
        SELECT * FROM dbo.Heroes WHERE ActiveStatus = 1 ORDER BY SalaryPerMovie DESC;
    END
    ELSE
    BEGIN
        SELECT * FROM dbo.Heroes 
        WHERE RemunerationCategory = @Category AND ActiveStatus = 1 
        ORDER BY SalaryPerMovie DESC;
    END
END;
GO

-- Create Stored Procedure to Get Top Paid Heroes
CREATE OR ALTER PROCEDURE dbo.sp_GetTopPaidHeroes
    @TopCount INT = 10
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT TOP (@TopCount)
        HeroName,
        YearsOfExperience,
        NumberOfMovies,
        SalaryPerMovie,
        RemunerationCategory
    FROM dbo.Heroes
    WHERE ActiveStatus = 1
    ORDER BY SalaryPerMovie DESC;
END;
GO

-- Create Stored Procedure to Calculate Salary Statistics
CREATE OR ALTER PROCEDURE dbo.sp_GetSalaryStatistics
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        RemunerationCategory,
        COUNT(*) AS HeroCount,
        MIN(SalaryPerMovie) AS MinSalary,
        MAX(SalaryPerMovie) AS MaxSalary,
        AVG(SalaryPerMovie) AS AvgSalary,
        SUM(SalaryPerMovie) AS TotalSalary
    FROM dbo.Heroes
    WHERE ActiveStatus = 1
    GROUP BY RemunerationCategory
    ORDER BY AvgSalary DESC;
END;
GO

-- Sample Queries

-- Query 1: Get all heroes ordered by salary
-- SELECT * FROM dbo.Heroes ORDER BY SalaryPerMovie DESC;

-- Query 2: Get heroes with more than 15 years experience
-- SELECT HeroName, YearsOfExperience, NumberOfMovies, SalaryPerMovie 
-- FROM dbo.Heroes WHERE YearsOfExperience > 15 ORDER BY YearsOfExperience DESC;

-- Query 3: Get average salary by category
-- SELECT RemunerationCategory, AVG(SalaryPerMovie) AS AvgSalary 
-- FROM dbo.Heroes GROUP BY RemunerationCategory ORDER BY AvgSalary DESC;

-- Query 4: Get top 5 highest paid heroes
-- EXEC dbo.sp_GetTopPaidHeroes @TopCount = 5;

-- Query 5: Get heroes by category
-- EXEC dbo.sp_GetHeroesByCategory @Category = 'Tier 1';

-- Query 6: Get salary statistics
-- EXEC dbo.sp_GetSalaryStatistics;

-- Query 7: Get hero summary
-- SELECT * FROM dbo.vw_HeroSummary ORDER BY SalaryPerMovie DESC;

GO

PRINT 'TFI Heroes database script executed successfully!';
GO

