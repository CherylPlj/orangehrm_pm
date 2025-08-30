# Blue HR Docker Setup

This setup runs Blue HR (OrangeHRM) with MySQL database and phpMyAdmin in Docker containers.

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. **Build and start all containers:**
   ```bash
   docker-compose up -d
   ```

2. **View running containers:**
   ```bash
   docker-compose ps
   ```

3. **Access the applications:**
   - **Blue HR**: http://localhost:8081
   - **phpMyAdmin**: http://localhost:8080
     - Username: `orangehrm`
     - Password: `orangehrm123`

## Container Details

### Services
- **blue-hr**: Blue HR application (port 8081)
- **mysql**: MySQL 8.0 database (port 3306)
- **phpmyadmin**: phpMyAdmin interface (port 8080)

### Network
All containers run on the `blue_hr_network` bridge network for secure communication.

### Volumes
- **mysql_data**: Persistent MySQL data storage
- **Application files**: Mounted from host for development

## Database Configuration

- **Database Name**: `orangehrm4`
- **Username**: `orangehrm`
- **Password**: `orangehrm123`
- **Root Password**: `orangehrm123`

## Useful Commands

### View logs
```bash
# All services
docker-compose logs

# Specific service
docker-compose logs blue-hr
docker-compose logs mysql
docker-compose logs phpmyadmin
```

### Stop containers
```bash
docker-compose down
```

### Stop and remove volumes (⚠️ This will delete all data)
```bash
docker-compose down -v
```

### Rebuild containers
```bash
docker-compose up -d --build
```

### Access container shell
```bash
# Blue HR container
docker-compose exec blue-hr bash

# MySQL container
docker-compose exec mysql mysql -u root -p
```

## First Time Setup

1. Start the containers: `docker-compose up -d`
2. Wait for all services to be ready (check with `docker-compose ps`)
3. Access Blue HR at http://localhost:8081
4. Follow the installation wizard
5. Use the database credentials:
   - Host: `mysql`
   - Database: `orangehrm4`
   - Username: `orangehrm`
   - Password: `orangehrm123`

## Troubleshooting

### Port conflicts
If ports 80 or 8080 are already in use, modify the `docker-compose.yml` file to use different ports.

### Database connection issues
Ensure the MySQL container is fully started before accessing OrangeHRM. You can check with:
```bash
docker-compose logs mysql
```

### Permission issues
If you encounter permission issues, you may need to adjust file permissions:
```bash
chmod -R 755 src/
chmod -R 755 web/
```
