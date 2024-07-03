# CRUD Application

Welcome to the CRUD application repository! This project is built with Python using FastAPI, and it leverages PostgreSQL for data storage. The application demonstrates fundamental Create, Read, Update, and Delete (CRUD) operations.

## Table of Contents

- [About](#about)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Database Setup](#database-setup)
    - [Option 1: Using Docker](#option-1-using-docker)
    - [Option 2: Manual Setup](#option-2-manual-setup)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [Contact](#contact)

## About

The CRUD application provides a simple yet powerful interface for managing items in a PostgreSQL database. This project is ideal for developers looking to understand the basics of RESTful API development using FastAPI and relational database operations with SQLAlchemy.

## Technologies Used

- **Python**: Programming language.
- **FastAPI**: Web framework for building APIs with Python.
- **PostgreSQL**: Relational database for data storage.
- **SQLAlchemy**: ORM for handling database operations.
- **Docker**: Containerization platform for easy setup and deployment.

## Project Structure

```plaintext
cogoport/
│
├── app/
│   ├── __init__.py         # Initializes the app module
│   ├── main.py             # Main entry point for the FastAPI application
│   ├── config.py           # Configuration settings (e.g., database URL)
│   ├── models.py           # SQLAlchemy models
│   ├── schemas.py          # Pydantic models (data validation)
│   ├── crud.py             # CRUD operation functions
│   ├── database.py         # Database connection and session handling
│   ├── routers/
│   │   └── items.py        # Router for items-related endpoints
│
├── docker-compose.yml      # Docker Compose file for container setup
├── requirements.txt        # List of dependencies
└── README.md               # Project README file
```

## Setup

### Prerequisites

Ensure you have the following installed on your machine:

- [Python 3.8+](https://www.python.org/downloads/)
- [PostgreSQL](https://www.postgresql.org/download/)
- [Docker](https://www.docker.com/products/docker-desktop) (optional, for containerized setup)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/kanak27/cogoport.git
   cd cogoport
   ```


2. **Create and activate a virtual environment:**

- On macOS and Linux:

  ```
  python -m venv venv
  source venv/bin/activate
  ```

- On Windows:

  ```
  python -m venv venv
  venv\Scripts\activate
  ```

3. **Install dependencies:**
```
pip install -r requirements.txt
```


4. **Set up environment variables:**

Create a `.env` file in the root directory and add the following environment variables:

```
DATABASE_URL=postgresql://<db_user>:<db_password>@<db_host>/<db_name>
```


Replace `<db_user>`, `<db_password>`, `<db_host>`, and `<db_name>` with your PostgreSQL database credentials.

5. **Initialize the database schema:**

If you have SQL scripts for schema and data setup (`sql/schema.sql` and `sql/data.sql`), execute them to initialize the database:

```
psql -U <db_user> -d <db_name> -f sql/schema.sql
psql -U <db_user> -d <db_name> -f sql/data.sql
```


Replace `<db_user>` and `<db_name>` with your PostgreSQL user and database name.

6. **Run the FastAPI application:**

```
uvicorn app.main
--reload
```


The application will be available at [http://localhost:8000](http://localhost:8000).

7. **Access the interactive API documentation:**

Visit [http://localhost:8000/docs](http://localhost:8000/docs) for Swagger UI or [http://localhost:8000/redoc](http://localhost:8000/redoc) for ReDoc.

## Usage

1. **Endpoints Overview:**

- **POST** `/api/posts/create_configuration`: Create a new item.
- **GET** `/api/posts/get_configuration/{country_code}`: Retrieve a single item by ID.
- **PUT** `/api/posts/update_configuration/{country_code}`: Update an item by ID.
- **DELETE** `/api/posts/delete_configuration/{country_code}`: Delete an item by ID.

2. **Example Usage:**

You can use tools like `curl` or Postman to interact with the API endpoints.

### Example 1: POST `/api/posts/create_configuration`

**Request:**
```http
POST /api/posts/create_configuration
Content-Type: application/json

{
    "requirements": [
        "PAN",
        "GST"
    ],
    "business_name": "Lohiya Traders",
    "country_code": "IN"
}
```

**Response (201 Created):**
```json
{
    "id": 1,
    "requirements": [
        "PAN",
        "GST"
    ],
    "business_name": "Lohiya Traders",
    "country_code": "IN"
}
```

### Example 2: GET `/api/posts/get_configuration/IN`

**Request:**
```http
GET /api/posts/get_configuration/IN
```

**Response (200 OK):**
```json
{
    "id": 1,
    "requirements": [
        "PAN",
        "GST"
    ],
    "business_name": "Lohiya Traders",
    "country_code": "IN"
}
```

### Example 3: PUT `/api/posts/update_configuration/IN`

**Request:**
```http
PUT /api/posts/update_configuration/IN
Content-Type: application/json

{
    "requirements": [
        "PAN",
        "GST",
        "AADHAAR"
    ],
    "business_name": "Lohiya Traders Private Limited",
    "country_code": "IN"
}
```

**Response (200 OK):**
```json
{
    "id": 1,
    "requirements": [
        "PAN",
        "GST",
        "AADHAAR"
    ],
    "business_name": "Lohiya Traders Private Limited",
    "country_code": "IN"
}
```

### Example 4: DELETE `/api/posts/delete_configuration/IN`

**Request:**
```http
DELETE /api/posts/delete_configuration/IN
```

**Response (204 No Content):**
```json
{}
```


## API Documentation

FastAPI provides interactive API documentation. After starting the server, you can access the Swagger UI at [http://localhost:8000/docs](http://localhost:8000/docs) or the ReDoc documentation at [http://localhost:8000/redoc](http://localhost:8000/redoc).

### API Endpoints

- **POST** `/api/posts/create_configuration`: Create a new item.
- **GET** `/api/posts/get_configuration/{country_code}`: Retrieve a single item by ID.
- **PUT** `/api/posts/update_configuration/{country_code}`: Update an item by ID.
- **DELETE** `/api/posts/delete_configuration/{country_code}`: Delete an item by ID.

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

For major changes, please open an issue first to discuss what you would like to change.

## Contact

Kanak - [kanak27](https://github.com/kanak27) - [email](mailto:kanaklohiya.lohiya@gmail.com.com)

Project Link: [https://github.com/kanak27/cogoport](https://github.com/kanak27/cogoport)
