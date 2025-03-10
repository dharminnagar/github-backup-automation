# GitHub Backup For Mac
This is a simple script to backup your git repositories on your Mac. It will backup all your repositories in your `dev` folder on your Mac. You can also update the script to backup other folders as well.

## Features
1. Backup all your git repositories in your `dev` folder.
2. Automate your backup process via cron job.
3. Notifications for successful and failed backups.
4. Log file for tracking the backup process.

## How to use
1. Clone this repository to your Mac.
   ```bash
    git clone https://github.com/dharminnagar/github-backup-mac.git
    ```
2. Open the terminal and navigate to the folder where you cloned this repository.
3. Update the `dev_folder` variable in the `git_backup.sh` script to point to your `dev` folder.
4. Run the following command to make the script executable
   ```bash
    chmod +x backup.sh
    ```
5. Run the script using the following command:
   ```bash
   git backup.sh
   ```
   OR
6. Automate the backup process using cron job. Run the following command to open the cron job editor:
   ```bash
   crontab -e
   ```
7. Copy the cron.txt content and paste it at the end of the file. It will run the backup script every Sunday at 12:00 PM. You can update the cron job as per your requirement.
8. Voila! You have successfully automated your github backup process.

## Author
Dharmin Nagar

## Support
If you like this project, please give it a star. Thanks!

## License
This project is licensed under the MIT License