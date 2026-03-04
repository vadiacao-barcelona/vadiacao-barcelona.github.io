# Asociación Cultural de Capoeira Angola Vadiação

[![Gem Version](https://badge.fury.io/rb/beautiful-jekyll-theme.svg)](https://badge.fury.io/rb/beautiful-jekyll-theme)

Source code for the website of the **Asociación Cultural de Capoeira Angola Vadiação** de Mestre Gil Maciel.

> [!NOTE] 
> This website is a fork of [Beautiful Jekyll](https://github.com/daattali/beautiful-jekyll?tab=readme-ov-file#beautiful-jekyll), a ready-to-use template to help you create a beautiful website quickly.

## Development Setup
### Requirements
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

### Getting started
1. Start services:
    ```bash
    docker-compose up
    ```
1. Install TrailBase components (_run once_, as these components persist in the **./traildepot** directory):
    ```bash
    docker-compose exec trailbase /app/trail components add trailbase/auth_ui
    ```
1. Setup your TrailBase Admin login credentials (_run once_):
    ```bash
    docker-compose exec trailbase /app/trail user change-password admin@localhost <YOURPASSWORD> && docker-compose exec trailbase /app/trail user change-email admin@localhost <YOUREMAIL>
    ```
1. Acess services:
    * Website: [http://localhost:4000](http://localhost:4000)
    * (TrailBase) Admin panel: [http://localhost:8080/_/auth/login](http://localhost:8080/_/auth/login)
1. Stop services:
    ```bash
    docker-compose down
    ```

---
&copy; 2026 Asociación Cultural de Capoeira Angola Vadiação 