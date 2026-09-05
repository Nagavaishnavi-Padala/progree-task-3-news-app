\# Progree Task 3 - News Feed App



A Flutter-based mobile news feed application that fetches remote JSON content asynchronously and displays it in a responsive, scrollable interface.



\## Task Objective



Build a data-bound mobile application frontend that asynchronously fetches remote JSON data, displays the content in a scrollable layout, handles offline states, and uses clean state management.



\## Features



\- Fetches articles from a remote REST API

\- Displays articles in a scrollable feed

\- Pull-to-refresh support

\- Refresh button in the app bar

\- Loading state while fetching data

\- Offline/network error handling

\- Retry functionality after a failed request

\- Responsive Material 3 user interface

\- Provider-based state management

\- Separate model, service, provider, screen, and widget layers



\## Tech Stack



\- Flutter

\- Dart

\- HTTP

\- Provider

\- REST API

\- JSON

\- Material 3



\## API



The application uses the JSONPlaceholder REST API:



`https://jsonplaceholder.typicode.com/posts`



The API returns JSON objects containing:



\- `id`

\- `title`

\- `body`



\## Project Architecture



```text

lib/

├── main.dart

├── models/

│   └── article.dart

├── services/

│   └── api\_service.dart

├── providers/

│   └── article\_provider.dart

├── screens/

│   └── home\_screen.dart

└── widgets/

&#x20;   └── article\_card.dart

