<?php
require 'db_connect.php';

header('Content-Type: application/json');

try {
    // Fetches users who are either Admins or Distributors
    $stmt = $pdo->query(
        "SELECT user_id, full_name, role FROM users WHERE role IN ('admin', 'distributor')"
    );
    $recipients = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'recipients' => $recipients]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}
?>
