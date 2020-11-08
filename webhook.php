<?php

$username = $_GET['Username'];
$Message = $_GET['Message'];
$AvatarURL = $_GET['Avatar'];
$UserID = $_GET['ID'];

// Replace the URL with your own webhook url
$url = "WEBHOOK_URL";

$Message = str_replace("@here", "@.here", "$Message");
$Message = str_replace("@everyone", "@.everyone", "$Message");


$hookObject = json_encode([

    "content" => "$Message",
    "username" => "$username ($UserID)",
    "avatar_url" => "$AvatarURL",
    "tts" => false,

], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE );

$ch = curl_init();

curl_setopt_array( $ch, [
    CURLOPT_URL => $url,
    CURLOPT_POST => true,
    CURLOPT_POSTFIELDS => $hookObject,
    CURLOPT_HTTPHEADER => [
        "Content-Type: application/json"
    ]
]);

$response = curl_exec( $ch );
curl_close( $ch );

?>