import os
import re
import sys
import click

# Define some ANSI escape sequences for colored output
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
BLUE = "\033[34m"
MAGENTA = "\033[35m"
CYAN = "\033[36m"
RESET = "\033[0m"

@click.command()
@click.option("--dir", "-d", default=".", help="Directory to scan for sensitive data.")
def main(dir):
    click.echo(f"{YELLOW}Scanning directory {dir} for sensitive data...{RESET}\n")
    
    # Walk through all files in the specified directory and its subdirectories
    for root, dirs, files in os.walk(dir):
        for file in files:
            if file.endswith(('.php', '.js', '.py')):
                file_path = os.path.join(root, file)
                
                # Display progress information
                click.echo(f"{BLUE}Editing file:{RESET} {file_path}")
                
                # Read the file contents
                with open(file_path, 'r+') as file:
                    content = file.read()

                    # Replace Discord tokens
                    content = re.sub(r'"[A-Za-z\d]{24}\.[\w-]{6}\.[\w-]{27}"', '"discord_token_here"', content)
                    content = re.sub(r'"mfa\.[A-Za-z\d_\-]{84}"', '"discord_token_here"', content)

                    # Replace Discord webhooks
                    content = re.sub(r'https://discord(app)?\.com/api/webhooks/[A-Za-z\d_\-]+/[A-Za-z\d_\-]+', 'discord_webhook_here', content)

                    # Replace client secrets
                    content = re.sub(r'client_secret\s*=\s*\'[\w\d_\-\.@#%^&*(){}[\];:<>?~|=+\\\/!]+\';?', 'client_secret = \'SECRET_HERE\';', content)

                    # Replace client IDs
                    content = re.sub(r'client_id\s*=\s*\'[\w\d_\-\.@#%^&*(){}[\];:<>?~|=+\\\/!]+\';?', 'client_id = \'ID_HERE\';', content)

                    # Replace other sensitive data as needed
                    content = re.sub(r'\$token\s*=\s*\'[\w\d_\-\.@#%^&*(){}[\];:<>?~|=+\\\/!]+\';?', '$token = \'TOKEN_HERE\';', content)

                    # Write the modified file contents
                    file.seek(0)
                    file.write(content)
                    file.truncate()

                    # Display completion message
                    click.echo(f"{GREEN}File edited successfully.{RESET}\n")
    
    click.echo(f"{YELLOW}Scan completed.{RESET}")

if __name__ == "__main__":
    main()
