# A to Z LMS Ballerina Connector

This package provides a Ballerina connector for interacting with the A to Z LMS (Learning Management System) API. It offers convenient functions to retrieve information about students and courses in the LMS.

## Features

- Get the number of enrolled students
- Get the number of available courses
- Configurable API endpoint

## Usage

### Importing the Package

```ballerina
import ballerina/io;
import dulaj/ballerina_azlms0;
```

### Creating a Client

Create a client with default configuration:

```ballerina
ballerina_azlms0:Client azlmsClient = check new();
```

Or with custom configuration:

```ballerina
ballerina_azlms0:Client azlmsClient = check new({
    apiUrl: "https://custom.azlms.com"
});
```

### Getting Enrolled Students Count

```ballerina
public function main() returns error? {
    ballerina_azlms0:Client azlmsClient = check new();
    int studentCount = check azlmsClient.getEnrolledStudentsCount();
    io:println(string `Total enrolled students: ${studentCount}`);
}
```

### Getting Courses Count

```ballerina
public function main() returns error? {
    ballerina_azlms0:Client azlmsClient = check new();
    int courseCount = check azlmsClient.getCoursesCount();
    io:println(string `Total courses: ${courseCount}`);
}
```

### Complete Example

```ballerina
import ballerina/io;
import dulaj/ballerina_azlms0;

public function main() returns error? {
    // Initialize the A to Z LMS client
    ballerina_azlms0:Client azlmsClient = check new();
    
    // Get enrolled students count
    int studentCount = check azlmsClient.getEnrolledStudentsCount();
    io:println(string `Number of enrolled students: ${studentCount}`);
    
    // Get courses count
    int courseCount = check azlmsClient.getCoursesCount();
    io:println(string `Number of courses: ${courseCount}`);
}
```

## Testing

Run the tests using:

```bash
bal test
```

## Note

Currently, the connector returns random values for demonstration purposes. In a production environment, these functions would make actual API calls to the A to Z LMS backend.
