# FleetTrack

FleetTrack is a Spring Boot application.

## 1. Prerequisites

Install the following tools before setting up the project:

- JDK 21
- MySQL 8.x
- Git
- IntelliJ IDEA
- DBeaver
- Postman

Verify Java:

```powershell
java -version
```

The output should show Java 21.

## 2. Clone the Repository

Clone the FleetTrack repository and open the project directory:

```powershell
git clone https://github.com/sma7-code/FleetTrack.git
cd FleetTrack
```

## 3. Configure MySQL

Start the MySQL service and log in as the MySQL root user:

```bash
mysql -u root -p
```

Create the development and test databases:

```sql
CREATE DATABASE fleettrack_dev
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

CREATE DATABASE fleettrack_test
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;
```

Create the application database user. Replace the example password with a strong password of your choice:

```sql
CREATE USER 'fleet_dev'@'localhost'
    IDENTIFIED BY 'REPLACE_WITH_YOUR_PASSWORD';

GRANT ALL PRIVILEGES ON fleettrack_dev.*
    TO 'fleet_dev'@'localhost';

GRANT ALL PRIVILEGES ON fleettrack_test.*
    TO 'fleet_dev'@'localhost';
```

Verify the databases and permissions:

```sql
SHOW DATABASES;
SHOW GRANTS FOR 'fleet_dev'@'localhost';
```

The application must use `fleet_dev`, not the MySQL root account.

## 4. Configure Local Database Credentials

The application uses the Spring Boot `local` profile.

Copy the example configuration file:

```powershell
Copy-Item application-local.properties.example application-local.properties
```

Open `application-local.properties` and set the database connection details:

```properties
DB_URL=jdbc:mysql://localhost:3306/fleettrack_dev?useSSL=false&allowPublicKeyRetrieval=true
DB_USERNAME=fleet_dev
DB_PASSWORD=REPLACE_WITH_YOUR_PASSWORD
```

Use the password you chose when creating the MySQL user.

**Security:** Never commit `application-local.properties` or real database passwords to Git. The local configuration file is excluded by `.gitignore`.

## 5. Connect Using DBeaver

Create a new MySQL connection in DBeaver with these settings:

| Setting | Value |
|---|---|
| Host | `localhost` |
| Port | `3306` |
| Username | `fleet_dev` |
| Password | Your chosen database password |

Test the connection and confirm that both `fleettrack_dev` and `fleettrack_test` are visible.

## 6. Run the Application

From the project root directory, run the application on Windows:

```powershell
.\mvnw.cmd spring-boot:run
```

On macOS or Linux:

```bash
./mvnw spring-boot:run
```

The application runs on port `8081`.

## 7. Open in IntelliJ IDEA

1. Open IntelliJ IDEA.
2. Open the project using `pom.xml`.
3. Wait for Maven to finish importing dependencies.
4. Set the Project SDK to JDK 21.
5. Run `FleettrackApplication` if you prefer to start it from the IDE.

## 8. Verify the Setup

- `java -version` reports Java 21.
- MySQL is running on `localhost:3306`.
- `fleettrack_dev` and `fleettrack_test` exist.
- DBeaver connects using `fleet_dev` and can see both databases.
- The application starts successfully using the local configuration.
- No local password or secret file is tracked by Git.

## 9. Git and Secrets

Check the working tree:

```powershell
git status --short
```

Check whether local configuration files are tracked:

```powershell
git ls-files
```

The files `application-local.properties` and `local.properties` must not be committed. Keep credentials in local configuration or environment variables, never in tracked source files.
