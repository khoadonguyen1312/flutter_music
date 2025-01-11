@echo off

REM Clean previous builds
flutter clean
pause
REM Get dependencies
flutter pub get
pause
REM Build APK
flutter build apk --release
pause

