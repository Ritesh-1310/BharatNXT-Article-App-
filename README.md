# Flutter Article Reader App

A Flutter application that fetches and displays articles from JSONPlaceholder API, with search functionality, favorites management, and detailed article views.

## Features

- 📰 List of articles with card-based UI
- 🔍 Real-time search by title or content
- ❤️ Favorite articles with local persistence
- 📱 Responsive and adaptive UI
- 🔄 Pull-to-refresh functionality
- 🎨 Material 3 design with dark/light theme support
- 🛠️ Proper error handling and loading states

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio/VSCode with Flutter plugin

### Installation
1. Clone the repository:
```bash
git clone https://github.com/yourusername/flutter-article-reader.git
cd flutter-article-reader
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Tech Stack
* Flutter SDK: 3.29.3
* State Management: Provider (6.1.5)
* HTTP Client: http (1.4.0)
* Local Storage: shared_preferences (2.5.3)
* Pull-to-Refresh: pull_to_refresh (2.0.0)

# State Management Explanation
The app uses Provider for state management following these principles:
1. ArticleController: Manages article data fetching, searching, and state (loading/error)
2. FavoriteController: Handles favorite articles persistence using SharedPreferences
3. Data Flow:
  * UI triggers actions in controllers
  * Controllers modify state and notify listeners
  * Provider rebuilds dependent widgets

This architecture provides clear separation of concerns while keeping the code maintainable and testable.

# Folder Structure
```bash
lib/
├── controllers/      # State management
├── models/           # Data models
├── repositories/     # Data layer
├── services/         # API services
├── utils/            # Constants & helpers
├── views/            # UI screens
│   └── widgets/      # Reusable components
└── main.dart         # App entry point
```

# Known Issues / Limitations
1. API Limitations:
  * Using mock data from JSONPlaceholder (no real content updates)
  * No pagination implemented (all articles load at once)
    
2. UI/UX:
  * No animations between screens
  * Limited offline support (only favorites persist)

3. Testing:
  * Unit tests not included in this version
  * No integration tests

# Future Improvements
  * Implement pagination for large article sets
  * Add offline support for article content
  * Introduce more sophisticated search (tags, date filters)
  * Add share functionality for articles
  * Implement proper testing suite
