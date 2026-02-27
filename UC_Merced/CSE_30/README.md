# CSE 30 - Data Structures (Web Applications)

This repository contains web application labs for UC Merced's CSE 30 course, building full-stack client-server applications with C++ backends and HTML/JavaScript frontends.

## Course Content

The course covers:
- Client-server architecture and HTTP communication
- C++ web server development (Crow framework)
- HTML, CSS, and JavaScript frontends
- RESTful routing, JSON responses, and async requests
- Data structures applied to web applications

## Lab Structure

### Lab_01: Basic Web Application with Arithmetic Server
- HTML form frontend with input fields
- C++ web server with `/add` and `/times` routes
- XMLHttpRequest for async client-server communication

### Lab_02: String Manipulation Server
- Routes: `/hello`, `/echo` (string reversal), `/superbowl` (JSON), `/uppercase`
- JSON response handling
- String algorithms using C++ standard library (`std::transform`, `std::reverse`)

### Lab_03: Word Game Application
- Bootstrap/jQuery frontend with interactive letter buttons
- `/list` route returns 9 random letters, `/checkWord` validates against dictionary
- Powerset generation (recursive), string permutation (backtracking)
- Unordered hash map for O(1) dictionary lookups

### Lab_04: Skeleton/Template
- Project template for student implementation

## Technologies Used
- C++ (Crow web framework)
- HTML, CSS, JavaScript (Bootstrap, jQuery)
- JSON, HTTP/REST
