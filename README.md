
# Savemom

## Step 1: Clone the project
1. Open the command prompt (CMD) or terminal and run:

   ```bash
   git clone https://github.com/VenkateshSaitech20/savemom.git
   ```

## Step 2: Setup the project in VSCode and open the terminal

2. Install the necessary dependencies:
   ```bash
   npm install
   ```

4. Ensure the XAMPP server is started, and the MySQL database is running. (Xampp Download link)
   ```bash
   https://www.apachefriends.org/download.html
   ```

6. Run the initial Prisma migration:
   ```bash
   npx prisma migrate dev --name init
   ```

7. Generate the Prisma client:
   ```bash
   npx prisma generate
   ```

9. Deploy any remaining migrations:
   ```bash
   npx prisma migrate deploy
   ```

11. Import the `menu.sql` file into the `menu` table in the `savemom` database. You can find the `menu.sql` file in the project folder:
   - Open phpMyAdmin (or your preferred MySQL client).
   - Select the `savemom` database.
   - Import the `menu.sql` file into the `menu` table.

12. Finally, run the development server:
   ```bash
   npm run dev
   ```

## Step 3: Access the application
10. After running the above commands, open your browser and go to:

   ```bash
   http://localhost:3000/
   ```

If everything is set up correctly, the application should load at this URL.

## Notes:
- Make sure that the Prisma configuration in the project is set up to correctly point to your MySQL instance.
- If you encounter errors during the `npx prisma migrate` steps, you might need to verify your Prisma schema or database connection.
