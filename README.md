<img width="40%" alt='OrangeHRM' src='https://raw.githubusercontent.com/wiki/orangehrm/orangehrm/logos/logo.svg#gh-light-mode-only'/><img width="40%" alt='OrangeHRM' src='https://raw.githubusercontent.com/wiki/orangehrm/orangehrm/logos/logo_dark_mode.svg#gh-dark-mode-only'/>

[![Docker Pulls](https://img.shields.io/docker/pulls/orangehrm/orangehrm.svg)](https://hub.docker.com/r/orangehrm/orangehrm) [![SourceForge Downloads](https://img.shields.io/sourceforge/dm/orangehrm.svg)](https://sourceforge.net/projects/orangehrm/) [![SourceForge Downloads](https://img.shields.io/sourceforge/dt/orangehrm.svg)](https://sourceforge.net/projects/orangehrm/)

# OrangeHRM Starter Application

OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures all the essential functionalities required for any enterprise. Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com/

OrangeHRM is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

## 🚀 Features

- **Modern Vue.js Frontend**: Built with Vue 3, TypeScript, and modern web technologies
- **Comprehensive HR Management**: Employee management, recruitment, performance, and more
- **Mobile Responsive**: Works seamlessly across desktop and mobile devices
- **Multi-language Support**: Internationalization (i18n) support
- **Access Control**: Role-based permissions and security
- **Docker Support**: Easy deployment with Docker containers
- **Theme Customization**: Flexible theming and branding options

## 📋 Prerequisites

### For Production Installation
- [Install on Linux](https://starterhelp.orangehrm.com/hc/en-us/articles/6187572000540-Prerequisites-for-installing-OrangeHRM-Starter-in-Linux)
- [Install on Windows](https://starterhelp.orangehrm.com/hc/en-us/articles/6187576427804-Prerequisites-for-installing-OrangeHRM-Starter-in-Windows)

### For Development
- **Node.js** (v16 or higher)
- **Yarn** package manager
- **PHP** (v7.4 or higher)
- **Composer** for PHP dependencies
- **MySQL** or **MariaDB** database
- **Git** for version control

## 🛠️ Development Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd orangehrm_pm
```

### 2. Install Dependencies

#### Frontend (Vue.js)
```bash
cd src/client
yarn install
```

#### Backend (PHP)
```bash
cd src
composer install
```

### 3. Development Commands

#### Frontend Development
```bash
cd src/client

# Start development server with hot-reload
yarn serve

# Build for development with watch mode
yarn dev

# Build for production
yarn build

# Run unit tests
yarn test:unit

# Run linting
yarn lint
```

### 4. Project Structure

```
orangehrm_pm/
├── src/
│   ├── client/                 # Vue.js frontend application
│   │   ├── src/
│   │   │   ├── components/     # Vue components
│   │   │   ├── pages/         # Page components
│   │   │   ├── core/          # Core functionality (i18n, acl, etc.)
│   │   │   └── main.ts        # Application entry point
│   │   ├── package.json       # Frontend dependencies
│   │   └── README.md          # Frontend development guide
│   ├── config/                # PHP configuration files
│   ├── lib/                   # PHP libraries
│   ├── plugins/               # PHP plugins
│   ├── test/                  # PHP tests
│   └── vendor/                # Composer dependencies
├── web/                       # Web root directory
├── mysql/                     # Database files
├── docker-compose.yml         # Docker configuration
├── Dockerfile                 # Docker image definition
└── README.md                  # This file
```

## 🚀 Getting Started

### Production Installation

1. **Download** the latest version of OrangeHRM Starter [here](https://sourceforge.net/projects/orangehrm/files/latest/download).

2. **Install OrangeHRM** using the web installer:
   - [OrangeHRM Starter Installation Guide](https://starterhelp.orangehrm.com/hc/en-us/articles/5295915003666-OrangeHRM-Starter-Installation-Guide)
   - [OrangeHRM Starter Upgrade Guide](https://starterhelp.orangehrm.com/hc/en-us/articles/6937346912402-OrangeHRM-Starter-Upgrade-Guide-For-5x-versions-)

### Docker Deployment

For quick setup using Docker:

```bash
# Clone the repository
git clone <repository-url>
cd orangehrm_pm

# Start with Docker Compose
docker-compose up -d

# Access the application at http://localhost:8080
```

## 📱 OrangeHRM Mobile App

<a href="https://play.google.com/store/apps/details?id=com.orangehrm.opensource" target="_blank">
<img height="54" alt='Get it on Google Play'
    src='https://raw.githubusercontent.com/wiki/orangehrm/orangehrm/mobile/play_store_cropped_en_US_2022_08_04.png'/>
</a>
<a href="https://apps.apple.com/us/app/orangehrm/id1527247547" target="_blank">
<img height="54" alt='Download on the App Store'
    src='https://raw.githubusercontent.com/wiki/orangehrm/orangehrm/mobile/app_store_en_US.svg'/>
</a>

## 🔧 Configuration

### Environment Variables
- `APP_ENV`: Application environment (development, production)
- `DB_HOST`: Database host
- `DB_NAME`: Database name
- `DB_USER`: Database username
- `DB_PASS`: Database password

### Theme Customization
See [THEME_CUSTOMIZATION.md](THEME_CUSTOMIZATION.md) for detailed information on customizing the application theme.

## 📚 Resources

### Demo
Live demo is available at: https://opensource-demo.orangehrmlive.com

### Documentation
- [User Guides](https://starterhelp.orangehrm.com)
- [API Documentation](https://starterhelp.orangehrm.com)
- [Developer Documentation](https://starterhelp.orangehrm.com)

### Releases
- SourceForge: https://sourceforge.net/p/orangehrm
- GitHub: https://github.com/orangehrm/orangehrm

### Website
https://www.orangehrm.com/

## 🤝 Contributing

We welcome contributions! Please see our contributing guidelines for more information.

## 🐛 Bug Reports

If you find a bug, please report it through:
- [GitHub Issues](https://github.com/orangehrm/orangehrm/issues)
- [OrangeHRM Help Portal](https://starterhelp.orangehrm.com/hc/en-us/requests/new)

## 💬 Help & Support

Submit your help requests through:
- [OrangeHRM Help Portal](https://starterhelp.orangehrm.com/hc/en-us/requests/new)
- Email: [ossupport@orangehrm.com](mailto:ossupport@orangehrm.com)

## 📄 License 

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Vue.js team for the amazing framework
- All contributors who have helped improve OrangeHRM
- The open-source community for continuous support
