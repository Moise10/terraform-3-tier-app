#!/bin/bash
# Install Apache and PHP
yum update -y
yum install -y httpd php mysql
systemctl start httpd
systemctl enable httpd

# Create a simple PHP page
cat <<EOF > /var/www/html/index.php
<!DOCTYPE html>
<html>
<head>
    <title>3-Tier Demo</title>
</head>
<body>
    <h1>Hello from <?php echo gethostname(); ?></h1>
    <p>DB endpoint: <?php echo '${db_endpoint}'; ?></p>
</body>
</html>
EOF

# Set permissions
chown -R apache:apache /var/www/html