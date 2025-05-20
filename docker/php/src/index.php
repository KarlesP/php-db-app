<?php
// Load environment variables (optional if using Docker ENV directly)
$host = getenv("DB_HOST");
$user = getenv("DB_USER");
$pass = getenv("DB_PASS");
$db   = getenv("DB_NAME");

// Attempt DB connection
$conn = @new mysqli($host, $user, $pass, $db);

// Check for connection error
if ($conn->connect_error) {
    http_response_code(500);
    echo "<h2>Database Connection Failed</h2>";
    echo "<p>Please check your database settings or try again later.</p>";
    error_log("MySQL connection error: " . $conn->connect_error); // Log to PHP error log
    exit;
}

// Run a test query
$result = $conn->query("SELECT * FROM test");

if (!$result) {
    http_response_code(500);
    echo "<h2>Query Error</h2>";
    echo "<p>Could not retrieve data.</p>";
    error_log("MySQL query error: " . $conn->error);
    exit;
}

// Output results
while ($row = $result->fetch_assoc()) {
    echo htmlspecialchars($row["value"]) . "<br>";
}

$conn->close();
?>
