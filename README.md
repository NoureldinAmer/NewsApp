# iOS News App

This app allows you to browse the latest news from various sources and save your favorite articles for later. It features a clean and intuitive interface built using Swift and SwiftUI, and supports both light and dark mode.

## Features

- View the latest news from various sources using the [News API](https://newsapi.org/).
- Bookmark and persist articles to read later.
- View articles from within the app.
- Search for news by keyword and view your search history.

## Demonstrations

Here are some demonstrations of the app's main features:

### A timeline of trending articles
<img src="https://user-images.githubusercontent.com/84950398/210105247-c7a24576-1c4c-4fe8-ae9a-d3b6463d514f.gif" alt="drawing" width="200"/>


### Searching and Saving articles
<img src="https://user-images.githubusercontent.com/84950398/210105898-b3c3a973-5928-4f63-a89b-0de83b0f8ab1.gif" alt="drawing" width="200"/>

To save an article for later, simply tap the bookmark icon in the top right corner of the article detail view. The article will be added to your saved articles list, which you can access by tapping the bookmark icon in the top right corner of the main news feed view.

## Requirements

- iOS 14 or later
- Xcode 12 or later

## Installation

1. Clone or download the repository.
2. Open the `iOS News App.xcodeproj` file in Xcode.
3. Sign up for a [News API](https://newsapi.org/) key and replace `YOUR_API_KEY` in `AppDelegate.swift` with your API key.
4. Build and run the app on a simulator or a device.

## Credits

- [News API](https://newsapi.org/) for providing the news data.
- [Alamofire](https://github.com/Alamofire/Alamofire) for making network requests.
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) for parsing JSON data.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
