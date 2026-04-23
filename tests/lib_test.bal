import ballerina/io;
import ballerina/test;

// Before Suite Function

@test:BeforeSuite
function beforeSuiteFunc() {
    io:println("I'm the before suite function!");
}

// Test function for enrolled students count

@test:Config {}
function testGetEnrolledStudentsCount() returns error? {
    Client azlmsClient = new();
    int studentCount = check azlmsClient.getEnrolledStudentsCount();
    
    // Verify that the count is within the expected range (1 to 10000)
    test:assertTrue(studentCount >= 1 && studentCount <= 10000, 
        string `Student count ${studentCount} is not in expected range`);
    
    io:println(string `Number of enrolled students: ${studentCount}`);
}

// Test function for courses count

@test:Config {}
function testGetCoursesCount() returns error? {
    Client azlmsClient = new();
    int courseCount = check azlmsClient.getCoursesCount();
    
    // Verify that the count is within the expected range (1 to 500)
    test:assertTrue(courseCount >= 1 && courseCount <= 500, 
        string `Course count ${courseCount} is not in expected range`);
    
    io:println(string `Number of courses: ${courseCount}`);
}

// Test function with custom configuration

@test:Config {}
function testWithCustomConfig() returns error? {
    Client azlmsClient = new({apiUrl: "https://custom.azlms.com"});
    int studentCount = check azlmsClient.getEnrolledStudentsCount();
    int courseCount = check azlmsClient.getCoursesCount();
    
    test:assertTrue(studentCount > 0, "Student count should be greater than 0");
    test:assertTrue(courseCount > 0, "Course count should be greater than 0");
    
    io:println(string `Students: ${studentCount}, Courses: ${courseCount}`);
}

// After Suite Function

@test:AfterSuite
function afterSuiteFunc() {
    io:println("I'm the after suite function!");
}
