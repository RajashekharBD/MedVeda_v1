<?php
require 'db_connect.php'; // Connect to the database
header('Content-Type: application/json');

// For a real application, the distributor ID should come from a secure session or token.
// We are getting it from the URL for this example.
if (!isset($_GET['distributor_id']) || !is_numeric($_GET['distributor_id'])) {
    http_response_code(400); // Bad Request
    echo json_encode(['success' => false, 'message' => 'Distributor ID is required.']);
    exit;
}
$distributor_id = (int)$_GET['distributor_id'];

try {
    // This SQL query joins multiple tables to gather all the necessary information.
    // - pharmacist_received_history: The main log of sales.
    // - products: To get the brand name and batch number.
    // - users: To get the full name of the pharmacist who received the product.
    // FIXED: Changed h.received_at to h.received_timestamp to match the database schema.
    $stmt = $pdo->prepare("
        SELECT
            h.history_id,
            p.brand_name,
            p.batch_number,
            h.quantity_received,
            u.full_name AS pharmacist_name,
            h.received_timestamp AS received_at
        FROM pharmacist_received_history h
        JOIN products p ON h.product_id = p.product_id
        JOIN users u ON h.pharmacist_id = u.user_id
        WHERE h.received_from_distributor_id = ?
        ORDER BY h.received_timestamp DESC
    ");
    $stmt->execute([$distributor_id]);
    $history = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Return the history data as a JSON response.
    echo json_encode(['success' => true, 'history' => $history]);

} catch (Exception $e) {
    // Handle any database errors.
    http_response_code(500); // Internal Server Error
    error_log("Error in get_sales_history.php: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Failed to retrieve sales history.']);
}
?>
