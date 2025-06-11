# WVSU Canteen App

## 🍽️ About the Project

**WVSU Canteen Web App** is a modern Flutter application designed to streamline the canteen experience at West Visayas State University. Whether you’re a student, staff, or visitor, this app lets you:

- **Browse Stalls:** Explore a variety of food stalls and their menus.
- **Order Meals:** Select your favorite dishes and place orders seamlessly.
- **Contact & Info:** Get in touch with the canteen team and learn about operating hours.
- **Meet the Team:** Discover the creative minds behind the app.

The app features a clean, responsive UI and integrates with Firebase for authentication and order management.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Firebase Project](https://firebase.google.com/)
- Android Studio, Xcode, or Visual Studio Code

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/wvsu_canteen.git
   cd wvsu_canteen
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Configure Firebase:**
   - Replace the contents of [`lib/firebase_options.dart`](lib/firebase_options.dart) with your Firebase configuration.
   - Make sure your Firebase project supports the platforms you want to run (Android, iOS, Web).

4. **Run the app:**
   ```sh
   flutter run
   ```

---

## 🛠️ Features

- **Authentication:** Sign up, log in, or use guest access.
- **Stall Browsing:** View detailed menus and descriptions for each stall.
- **Order Placement:** Add meals to your cart and submit orders.
- **Responsive Design:** Works on mobile, tablet, and web.
- **Contact & About:** Easy access to canteen contact info and team details.

---

## 📂 Project Structure

```
lib/
  authentication/    # Auth logic (login, signup)
  screens/           # Main app screens (stalls, about us, contact us)
  widgets/           # Reusable UI components
  firebase_options.dart
  homepage.dart
  main.dart
assets/
  # Images and static assets
```

---

## 📱 Usage

- **Sign Up / Log In:** Create an account or log in with your credentials.
- **Browse Stalls:** Navigate to the "Stalls" tab to view available food stalls and their menus.
- **Order Food:** Add items to your cart and place your order.
- **Contact Us:** Find canteen contact details and operating hours in the "Contact Us" section.
- **About Us:** Meet the development team in the "About Us" section.

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.


> Made with ❤️ by the WVSU Canteen App Team
```

