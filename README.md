# Annapurna: A Full-Stack Meal Blogging Application

Annapurna is a full-stack mobile application designed for storing and sharing meal blogs. The platform allows users to create detailed entries that include key information such as ingredients, cooking steps, preparation time, and cost. It also features a robust filtering system, enabling users to easily find recipes that align with specific dietary preferences, such as gluten-free, vegan, and vegetarian.

***

### Features
* **Comprehensive Meal Blogs:** Create detailed meal entries with information on category, cooking time, cost, ingredients, and step-by-step instructions.
* **Advanced Filtering:** Search and filter meal blogs based on dietary preferences (e.g., gluten-free, vegan, vegetarian).
* **Cross-Platform Compatibility:** The mobile application is built to be compatible with both iOS and Android devices.

***

### Technologies
This project leverages a modern full-stack architecture to ensure a seamless and performant user experience.

#### Frontend
* **Flutter:** A UI toolkit for building natively compiled applications from a single codebase.
* **Riverpod:** A reactive state-management library for Flutter.

#### Backend
* **Node.js & Express.js:** A JavaScript runtime and a web framework for building the server-side logic and RESTful API.
* **MongoDB:** A NoSQL database used to store the meal blog data.

***

### API Endpoints
The backend API is deployed at **[https://annapurna-fpy6.onrender.com/](https://annapurna-fpy6.onrender.com/)**. The primary resource is `/api/meals`, which supports the following endpoints for CRUD (Create, Read, Update, Delete) operations:

* `GET /api/meals`: Retrieves a list of all meal blogs.
* `GET /api/meals/:id`: Fetches a single meal blog by its unique ID.
* `POST /api/meals`: Adds a new meal blog to the database.
* `PUT /api/meals/:id`: Updates an existing meal blog.
* `DELETE /api/meals/:id`: Deletes a meal blog.

***

### Getting Started
While the project is still under active development, it can be tested by using the **latest GitHub Action artifact**. This artifact provides a pre-built version of the application that is ready for deployment on a compatible mobile device or emulator. The artifact can be found within the Actions tab of the GitHub repository.