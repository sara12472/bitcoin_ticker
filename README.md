# bitcoin_ticker
Bitcoin Tracker App is a Flutter-based mobile application that displays real-time cryptocurrency prices for Bitcoin in various fiat currencies (e.g., USD, EUR, GBP). It fetches live data from a public crypto API and allows users to select different currencies through a dropdown (Android) or a picker (iOS), updating the displayed rate dynamically.

Features
  📈 Real-time Bitcoin exchange rates
  💱 Choose from multiple fiat currencies (USD, EUR, GBP, etc.)
  📱 Platform-specific pickers:
     Android: `DropdownButton`
    iOS: `CupertinoPicker`
  🎨 Clean and intuitive UI
  🔁 Asynchronous API calls using `async` and `await`

API Setup

1. Get your free API key from [CoinAPI](https://www.coinapi.io/) or your chosen crypto API provider.
2. Open `coin_data.dart` and replace:
const apiKey = 'YOUR_API_KEY';

Getting Started
Clone the Repository
