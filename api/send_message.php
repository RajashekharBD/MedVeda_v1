<?php
require 'db_connect.php';
session_start();

header('Content-Type: application/json');

// In a real app, you'd get the sender_id from the session
// For now, we'll trust the input, but this is not secure for production
if (!isset($_SESSION['user_id'])) {
    // As a fallback for this example, we'll allow it to be passed in POST
    // In production, you should fail here if the session is not set.
}

$input = json_decode(file_get_contents('php://input'), true);

$sender_id = $input['sender_id'] ?? ($_SESSION['user_id'] ?? null);
$recipient_id = $input['recipient_id'] ?? null;
$subject = $input['subject'] ?? 'No Subject';
$message_content = $input['message_content'] ?? null;
$priority = $input['priority'] ?? 'Normal';


if (!$sender_id || !$recipient_id || !$message_content) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Missing required fields.']);
    exit;
}

try {
    $stmt = $pdo->prepare(
        "INSERT INTO messages (sender_id, recipient_id, subject, message_content, priority) VALUES (?, ?, ?, ?, ?)"
    );
    $stmt->execute([$sender_id, $recipient_id, $subject, $message_content, $priority]);

    echo json_encode(['success' => true, 'message' => 'Message sent successfully.']);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => 'Database error: ' . $e->getMessage()]);
}
?>
