-- Create the database
CREATE DATABASE DentalClinic;
USE DentalClinic;

-- Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    DateOfBirth DATE,
    ContactInfo VARCHAR(100),
    EmergencyContact VARCHAR(100)
);

-- Dentist table
CREATE TABLE Dentist (
    DentistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    Schedule VARCHAR(100)
);

-- Treatment table
CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Cost DECIMAL(10,2),
    Duration INT
);

-- Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    PatientID INT,
    DentistID INT,
    TreatmentID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DentistID) REFERENCES Dentist(DentistID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);

-- Invoice table
CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10,2),
    Status VARCHAR(50),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- MedicalRecord table
CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    TreatmentID INT,
    TreatmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);

-- Sample data

-- Patients
INSERT INTO Patient (Name, DateOfBirth, ContactInfo, EmergencyContact)
VALUES 
('John Doe', '1990-06-15', '555-1234', 'Jane Doe'),
('Alice Smith', '1985-11-30', '555-5678', 'Bob Smith');

-- Dentists
INSERT INTO Dentist (Name, Specialty, Schedule)
VALUES 
('Dr. Brown', 'Orthodontist', 'Mon-Fri'),
('Dr. Green', 'General Dentist', 'Tue-Sat');

-- Treatments
INSERT INTO Treatment (Name, Cost, Duration)
VALUES 
('Teeth Cleaning', 75.00, 30),
('Braces Adjustment', 200.00, 45);

-- Appointments
INSERT INTO Appointment (AppointmentDate, AppointmentTime, PatientID, DentistID, TreatmentID)
VALUES 
('2025-05-05', '10:00:00', 1, 1, 1),
('2025-05-06', '14:00:00', 2, 2, 2);

-- Invoices
INSERT INTO Invoice (Amount, Status, PatientID)
VALUES 
(75.00, 'Paid', 1),
(200.00, 'Unpaid', 2);

-- Medical Records
INSERT INTO MedicalRecord (PatientID, TreatmentID, TreatmentDate)
VALUES 
(1, 1, '2025-04-01'),
(2, 2, '2025-04-15');
