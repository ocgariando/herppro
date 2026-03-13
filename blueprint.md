# HerpPro Blueprint

## Overview

This document outlines the architecture and implementation plan for HerpPro, a Flutter application designed for reptile monitoring. The app will feature user authentication, reptile profile management, and real-time sensor data visualization.

## Style and Design

- **Theme:** Modern, clean, and intuitive Material 3 design.
- **Color Palette:** A mix of natural tones (greens, browns) and tech-inspired accents (blues, grays).
- **Typography:** Clear and readable fonts, with a focus on scannability.
- **Iconography:** Material Design icons for consistency.

## Features

### Implemented

- **User Authentication:** Email and password registration and login.
- **Navigation:** `go_router` for declarative routing and authentication-based redirection.
- **State Management:** `flutter_bloc` for predictable state management.

### Current Plan

- **UI Implementation:** Build the user interface for the home, login, registration, and splash screens.

### Future

- **Reptile Profiles:** Allow users to create and manage profiles for their reptiles.
- **Sensor Integration:** Connect to and display data from environmental sensors.
- **Notifications:** Alert users to important events, such as temperature fluctuations.
