# Cyber Incident Management - Complete Development Model

This project is structured as a production-style Flask application with modular architecture.

## Architecture
- `cim/config.py`: constants and runtime config paths
- `cim/db.py`: SQLite connection, schema init, migration-safe column upgrades
- `cim/security.py`: CSRF/session/RBAC decorators and security middleware
- `cim/services.py`: risk/SLA/playbook/assignment/audit/email engines
- `cim/blueprints/auth.py`: registration/login/logout
- `cim/blueprints/incidents.py`: dashboard, reporting, incident lifecycle, timeline
- `cim/blueprints/analytics.py`: charts and trend analytics
- `cim/blueprints/admin.py`: user management + tamper-evident audit view
- `app.py`: thin entrypoint using application factory pattern

## Advanced Features
- Role-based access control (Admin, Security Analyst, Employee)
- Incident UUIDs and secure evidence uploads
- Risk scoring engine + risk-band analytics
- SLA timer with automatic escalation levels
- Auto-assignment for High/Critical incidents
- IOC enrichment fields (IP/domain/hash)
- Suggested response playbooks + analyst acknowledgement
- Incident timeline event stream
- Tamper-evident hash chain for audit logs

## Run Local
1. `python -m venv .venv`
2. `.\\.venv\\Scripts\\Activate.ps1`
3. `pip install -r requirements.txt`
4. `python app.py`

## One-Click Run (Windows)
Double-click `START_APP.bat`

## Tests
- `pytest -q`

## Deploy To Render (Public URL for Mobile Data)
1. Push this folder to a GitHub repository.
2. Go to Render Dashboard -> `New` -> `Blueprint`.
3. Connect your GitHub repo and select this project.
4. Render auto-detects `render.yaml`.
5. Click `Apply`.
6. Wait for deploy to finish.
7. Open the generated `https://...onrender.com` URL and share it to any phone.

### Important Note (SQLite)
- SQLite on Render free web services is ephemeral.
- Data may reset on redeploy/restart.
- For persistent production data, migrate to PostgreSQL.

## Default Admin
- Username: `admin`
- Password: `Admin@1234`
