# Clean Architecture Flutter App

This is a Flutter application that demonstrates the use of Clean Architecture with BDD (Behavior-Driven Development).

## Overview

This app is a Flutter application built with the intention of following clean architecture principles and BDD. It uses the JSONPlaceholder API as a backend to fetch data and display it in the app.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE (like Android Studio or VS Code)

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/madahetooo/ShroukAcademyTask
    ```
2. Navigate into the cloned repository:
    ```bash
    cd clean_architecture_flutter_app
    ```
3. Get the packages:
    ```bash
    flutter pub get
    ```
4. Run the app:
    ```bash
    flutter run
    ```

## Architecture

The project follows Clean Architecture principles and BDD, and is divided into three layers:

- **Domain**: This is the inner layer which should not be susceptible to the whims of changing data sources or porting our app to Angular Dart. It will contain only the core business logic (use cases) and business objects (entities).
- **Data**: This layer depends on the domain layer and is responsible for fetching data from various sources (API, cache, etc.). It's divided into repositories and data sources.
- **Presentation**: This is the layer responsible for showing data on the screen (widgets) and user interactions. It depends on both the domain and data layers.