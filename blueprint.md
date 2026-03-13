
# Project Blueprint

## Overview

This document outlines the plan for creating a Flutter application with Firebase authentication, using flutter_bloc for state management.

## Current Task: Implement Authentication

### Plan

1.  **Add Dependencies:**
    *   `firebase_core`: To initialize Firebase.
    *   `firebase_auth`: For authentication services.
    *   `flutter_bloc`: For state management.
    *   `equatable`: To compare objects.
    *   `go_router`: For navigation.

2.  **Initialize Firebase:**
    *   Ensure Firebase is initialized in `lib/main.dart`.

3.  **Create Authentication Flow:**
    *   Implement an `AuthRepository` to handle `FirebaseAuth` interactions.
    *   Create an `AuthCubit` to manage the authentication state.
    *   Create a `LoginCubit` to manage the login form state.
    *   Create a `RegistrationCubit` to manage the registration form state.

4.  **Create UI Screens:**
    *   `SplashPage`: To show while checking the authentication state.
    *   `LoginPage`: For users to sign in.
    *   `RegistrationPage`: For users to create a new account.
    *   `HomePage`: The main screen after a user is authenticated.

5.  **Set up Navigation:**
    *   Use `go_router` to manage navigation between screens based on the authentication state.

6.  **Update `main.dart`:**
    *   Wrap the app in `RepositoryProvider` and `BlocProvider` to provide the `AuthRepository` and `AuthCubit` to the widget tree.
