--create
CREATE PROCEDURE AddMedicine
    @MedicineName VARCHAR(255),
    @MedicinePrice FLOAT,
    @MedicineProdDate DATETIME,
    @MedicineExpDate DATETIME,
    @MedicinePurpose varchar(255),
    @MedicineType varchar(255)


AS
BEGIN
    DECLARE @NewMedicineId INT;

    INSERT INTO Medicines DEFAULT VALUES;
    SET @NewMedicineId = SCOPE_IDENTITY();

    INSERT INTO MedicineDetails (MedicineId, MedicineName, MedicinePrice, MedicineProdDate, MedicineExpDate,MedicinePurpose,MedicineType)
    VALUES (@NewMedicineId, @MedicineName, @MedicinePrice, @MedicineProdDate, @MedicineExpDate,@MedicinePurpose,@MedicineType);
END
GO
EXEC AddMedicine 
    @MedicineName = 'testtttt',
    @MedicinePrice = 5.99,
    @MedicineProdDate = '2022-01-01',
    @MedicineExpDate = '2025-01-01',
	@MedicinePurpose='1',
    @MedicineType='1';



--update
	CREATE PROCEDURE UpdateMedicine
    @MedicineId INT,
    @MedicineName VARCHAR(255),
    @MedicinePrice FLOAT,
    @MedicineProdDate DATETIME,
    @MedicineExpDate DATETIME,
	@MedicinePurpose varchar(255),
    @MedicineType varchar(255)
AS
BEGIN
  
    UPDATE MedicineDetails
    SET MedicineName = @MedicineName,
        MedicinePrice = @MedicinePrice,
        MedicineProdDate = @MedicineProdDate,
        MedicineExpDate = @MedicineExpDate,
		  MedicinePurpose = @MedicinePurpose,
        MedicineType = @MedicineType

    WHERE MedicineId = @MedicineId;
END
GO


EXEC UpdateMedicine 
    @MedicineId = 1, 
    @MedicineName = 'siuuuuuu',
    @MedicinePrice = 8,
    @MedicineProdDate = '2022-05-01',
    @MedicineExpDate = '2026-05-01',
		@MedicinePurpose='2',
    @MedicineType='2';

-- find

	CREATE PROCEDURE FindMedicineByName
    @MedicineName VARCHAR(255)
AS
BEGIN
    SELECT *
    FROM MedicineDetails
    WHERE MedicineName LIKE '%' + @MedicineName + '%';
END
GO

EXEC FindMedicineByName @MedicineName = 'Paracetamol';


--show all medicines
CREATE PROCEDURE ListAllMedicines
AS
BEGIN
    SELECT m.MedicineId, md.MedicineName, md.MedicinePrice, md.MedicineProdDate, md.MedicineExpDate ,md.MedicinePurpose,md.MedicineType
    FROM Medicines m
    INNER JOIN MedicineDetails md ON m.MedicineId = md.MedicineId;
END
GO


EXEC ListAllMedicines;
