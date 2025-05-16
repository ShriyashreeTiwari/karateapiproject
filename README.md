# KARATEAPIPROJECT
A sample Karate API testing project designed to automate API tests using the Karate framework.

## 📋 Prerequisites

Ensure the following are installed on your system:

1. **Java** - Version 11 or higher  
2. **Apache Maven** - Version 3.6 or above  
3. **IDE or Terminal** - Recommended: VS Code or IntelliJ IDEA  
4. **Docker - Installed and running**
Before starting the tests, remove any existing Docker container/image of automaticbytes/demo-app and pull a fresh copy.
This is necessary because test scenarios 3 & 4 use test data with id = 10, which may already exist in the database from a previous run, causing the tests to fail.

---
## Project Structure

karateapiproject/
├── src/
│   └── test/
│       └── java/
│           ├── inventory/
│           │   ├── CommonFeatures/         # Reusable common feature files
│           │   ├── Flows/                  # Test flows or scenarios
│           │   └── RunnerTest.java         # JUnit test runner to trigger Karate tests
│           ├── resources/                  # Additional resources or test data
│           ├── utils/                      # test data
│           ├── Karate-config.js            # Global config file for Karate
│           └── logback-test.xml            # Logging configuration for test runs
├── target/                                 # Compiled classes and Karate reports
│   └── karate-reports/
│       └── karate-summary.html             # HTML test summary report
├── pom.xml                                 # Maven build file
└── README.md                               # Project documentation


## 🚀 Getting Started


Follow these steps to run the application and execute the Karate tests:

### 🐳 Step 1: Run the Demo API using Docker

1. **Pull the Docker image**:
   ```bash
   docker pull automaticbytes/demo-app

2. Run the container:
docker run -p 3100:3100 automaticbytes/demo-app

3. Verify API availability:
Open your browser or use a tool like Postman to check:
http://localhost:3100/api

4. To execute Karate Tests
# Running Tests
### Run all tests from terminal: In the root directory of the project, execute
mvn test
This will trigger all Karate feature files through the test runner class (e.g., RunnerTest.java).

### Run a specific feature file from terminal: 
mvn test -Dkarate.options="classpath:inventory/Flows/AddNewItem.feature"

### To run the test from IDE
1. Open the project in your IDE.
2. Perform a Maven build of the project.
(In IntelliJ: Right-click on pom.xml → "Add as Maven Project", then "Reload Project")
3. Manually run RunnerTest.java from the IDE.

# Reports
After test execution, a report will be generated at:
target/karate-reports/karate-summary.html