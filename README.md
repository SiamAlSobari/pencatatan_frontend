# Finance Tracker Mobile App

Aplikasi mobile untuk mengelola keuangan pribadi yang dibangun menggunakan Flutter. Aplikasi ini memungkinkan pengguna untuk mencatat pemasukan dan pengeluaran, serta memantau kondisi keuangan mereka.

## 📱 Fitur

- **Authentication**
  - Login & Register
  - Secure storage untuk token autentikasi
- **Dashboard**
  - Ringkasan keuangan
  - Visualisasi pemasukan dan pengeluaran
- **Manajemen Pemasukan**
  - Tambah pemasukan
  - Lihat history pemasukan
  - Edit & hapus pemasukan
- **Manajemen Pengeluaran**
  - Tambah pengeluaran
  - Lihat history pengeluaran
  - Edit & hapus pengeluaran
- **Profile**
  - Lihat informasi profil
  - Update profil pengguna

## 🛠️ Teknologi yang Digunakan

- **Flutter** - Framework UI
- **GetX** - State management, routing, dan dependency injection
- **Flutter Secure Storage** - Penyimpanan data sensitif
- **Google Fonts** - Custom fonts
- **Intl** - Internationalization dan formatting

## 📁 Struktur Project

```
lib/
├── app/
│   ├── core/              # Core utilities dan services
│   │   ├── bindings/      # Dependency injection
│   │   ├── colors/        # Color constants
│   │   ├── services/      # API services
│   │   ├── storages/      # Local storage
│   │   └── utils/         # Helper functions
│   ├── data/              # Data layer
│   │   ├── models/        # Data models
│   │   ├── providers/     # API providers
│   │   └── repositories/  # Data repositories
│   ├── modules/           # Feature modules
│   │   ├── splash/        # Splash screen
│   │   ├── login/         # Login page
│   │   ├── register/      # Register page
│   │   ├── main/          # Main navigation
│   │   ├── home/          # Home/Dashboard
│   │   ├── income/        # Income management
│   │   ├── expense/       # Expense management
│   │   └── profile/       # User profile
│   └── routes/            # App routing
└── main.dart              # Entry point
```

## 🚀 Cara Menjalankan

### Prerequisites

- Flutter SDK (>=3.0.0 <4.0.0)
- Dart SDK
- Android Studio / VS Code
- Android Emulator / iOS Simulator / Physical Device

### Instalasi

1. Clone repository

```bash
git clone <repository-url>
cd finance_tracker/mobile
```

2. Install dependencies

```bash
flutter pub get
```

3. Jalankan aplikasi

```bash
flutter run
```

### Build APK (Android)

```bash
flutter build apk --release
```

### Build App Bundle (Android)

```bash
flutter build appbundle --release
```

### Build iOS

```bash
flutter build ios --release
```

## 🔧 Konfigurasi

### API Configuration

Pastikan untuk mengkonfigurasi base URL API di file `lib/app/core/services/` sesuai dengan backend server Anda.

### Secure Storage

Aplikasi menggunakan `flutter_secure_storage` untuk menyimpan data sensitif seperti token autentikasi. Pastikan platform target Anda mendukung fitur ini:

- **Android**: Minimum SDK 18
- **iOS**: Minimum iOS 9.0

## 📦 Dependencies

```yaml
dependencies:
  flutter: sdk
  get: ^4.7.3 # State management
  google_fonts: ^8.0.1 # Custom fonts
  flutter_secure_storage: ^10.0.0 # Secure storage
  intl: ^0.20.2 # Internationalization
  cupertino_icons: ^1.0.8 # iOS icons

dev_dependencies:
  flutter_test: sdk
  flutter_lints: ^6.0.0 # Linting rules
```

## 🏗️ Arsitektur

Aplikasi ini menggunakan **Clean Architecture** dengan pattern:

- **GetX Pattern**: Untuk state management dan routing
- **Repository Pattern**: Untuk abstraksi data layer
- **Provider Pattern**: Untuk API calls
- **Model Pattern**: Untuk representasi data

### State Management

Menggunakan GetX untuk:

- Reactive state management
- Dependency injection
- Route management
- Snackbar & Dialog management

## 🎨 UI/UX

- Material Design guidelines
- Responsive layout untuk berbagai ukuran layar
- Custom Google Fonts untuk typography
- Consistent color scheme

## 🧪 Testing

Jalankan unit tests:

```bash
flutter test
```

Jalankan integration tests:

```bash
flutter test integration_test
```

## 📝 Development Notes

### Adding New Module

Untuk menambah module baru menggunakan GetX CLI:

```bash
flutter pub run get_cli create page:nama_module
```

### Code Style

Project ini menggunakan `flutter_lints` untuk menjaga konsistensi kode. Jalankan:

```bash
flutter analyze
```

## 🤝 Contributing

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is private and not published to pub.dev.

## 👥 Team

Developed with ❤️ by Finance Tracker Team

## 📞 Support

Untuk pertanyaan atau issues, silakan buka issue di repository ini.

---

**Version**: 1.0.0+1  
**Last Updated**: 2024
