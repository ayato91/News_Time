# News Time

## Overview

This Flutter app is a news aggregator that provides users with access to the latest news articles from various sources. It leverages the News API to fetch real-time news data and offers a user-friendly interface for reading and staying updated on current events.

## Screenshots

![App Screenshots 1](https://github.com/ayato91/News_Time/blob/e3fe7fc0a04b087f6fce98ed152d3221096dc380/assets/image.png)
![App Screenshots 2](https://github.com/ayato91/News_Time/blob/e3fe7fc0a04b087f6fce98ed152d3221096dc380/assets/image2.png)

## Features

- **Real-Time News Updates**: The app fetches the latest news articles from the News API and updates the content in real-time.

- **News Categories**: Users can choose from various news categories such as Trending, Mobile and more to customize their news feed.

- **User-Friendly UI**: The app is designed with a clean and intuitive user interface for a seamless news-reading experience.

- **Status Related User Messages**: This app has various messages for users like *Loading message* and *Something Went Wrong message*.

## Getting Started

To use this Flutter News App, follow these steps:

1. **Clone the Repository**: Clone this repository to your local machine using Git.
```
    $ git clone https://github.com/ayato91/News_Time.git
```

2. **Set Up Your Flutter Environment**: Ensure you have Flutter and Dart installed on your development machine. Follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for detailed instructions.

3. **Install Dependencies**: Navigate to the project directory and run the following command to install the app's dependencies:
```
    $ flutter pub get 
```

4. **Configure API Key**: Sign up for a free API key at [News API](https://newsapi.org/) and replace `"YOUR_API_KEY"` in the `lib/services/service_api.dart` file with your actual API key.

5. **Run the App**: Launch the app on an emulator or physical device by running the following command:
```
    $ flutter run
```


6. **Start Exploring**: Customize your news feed, search for articles, save favorites, and stay informed!

## Dependencies

The app relies on several Flutter packages and libraries, including:

- [http](https://pub.dev/packages/http) for making HTTP requests to the News API.

```
    $ flutter pub add http 
```

You can find the complete list of dependencies in the `pubspec.yaml` file. Follow the [pub.dev](https://pub.dev) for more dependencies.

Thank You!
