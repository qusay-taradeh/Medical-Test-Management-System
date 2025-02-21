# Medical Test Management System
A MIPS assembly-based system for managing medical test records.

## Objective
Develop a system in MIPS assembly to efficiently store, manage, and retrieve medical test data for individual patients. This system acts as a basic patient record management system, focusing on test results.

## File Format
The medical tests will be stored in a text file. Each line in the text file represents a single medical test with the following fields:
- **Patient ID** (integer: 7 digits)
- **Test Name** (string - fixed length)
- **Test Date** (string - YYYY-MM format)
- **Result** (floating-point value)

### Example Input File:
```
1300500: RBC, 2024-03, 13.5
1300511: LDL, 2024-03, 110
```

## Medical Tests and Normal Ranges
1. **Hemoglobin (Hgb):** 13.8 to 17.2 g/dL
2. **Blood Glucose Test (BGT):** 70 to 99 mg/dL
3. **LDL Cholesterol (LDL):** Less than 100 mg/dL
4. **Blood Pressure Test (BPT):**
   - Systolic: Less than 120 mm Hg
   - Diastolic: Less than 80 mm Hg

## System Functionality
The system provides a text-based menu with the following options:
1. **Add a new medical test** – Store a new test while validating input data.
2. **Search for a test by patient ID** – Options include:
   - Retrieve all patient tests
   - Retrieve all abnormal patient tests
   - Retrieve all patient tests in a given period
3. **Search for abnormal tests** – Retrieve all abnormal tests based on medical criteria.
4. **Calculate average test value** – Compute the average value of each test type.
5. **Update an existing test result** – Modify test values for a patient.
6. **Delete a test** – Remove a test record from the system.

## Additional Features
- **Error Handling:** Manage invalid file names, missing tests, or non-existent patient records.
- **Data Validation:** Ensure proper input formats (e.g., numeric IDs, valid dates) and handle potential errors gracefully.

## Authors
Qusay Taradeh, Rana Mosalam
