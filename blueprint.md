# Project Blueprint

## Overview

This document outlines the structure, features, and development plan for our Flutter application. It will be updated as we build the project.

## Implemented Features

*   Initial project setup.
*   **Theming:**
    *   Added `google_fonts` and `provider` packages.
    *   Created a `lib/theme.dart` file to house our theme data.
    *   Implemented a `ThemeProvider` to manage light and dark modes.
    *   Defined `lightTheme` and `darkTheme` with placeholder styles.
    *   Integrated the theme provider into `lib/main.dart`.
    *   Added a UI to demonstrate the theme and a toggle button.
*   **Typography:**
    *   Set the primary font to **Manrope**.
    *   Implemented a detailed `TextTheme` based on the provided style guide, covering headings, body text, and buttons.
*   **Color Scheme:**
    *   Defined a custom color palette with blues, yellows, and a range of black/grey shades.
    *   Set the primary seed color to a vibrant blue (`#2A4BA0`).
    *   Customized the light and dark themes to use the new color palette for backgrounds, app bars, and buttons.
*   **Home Screen:**
    *   Created a new `lib/home_screen.dart` file.
    *   Built a custom, conditional app bar that only shows on the home page.
    *   Added a horizontally scrolling carousel for special offers.
    *   Implemented a "Recommended" section with a horizontally scrolling list of product cards.
*   **Navigation:**
    *   Converted `HomeScreen` to a `StatefulWidget` to manage tab selection.
    *   Implemented a standard four-tab `BottomNavigationBar`.
    *   Removed the `FloatingActionButton` and `BottomAppBar`.

*   **Category Screen:**
    *   Created a new `lib/category_screen.dart` file.
    *   Built the UI for the category screen, matching the provided design.
    *   Integrated the new screen into the `HomeScreen`'s bottom navigation bar.
    *   Fixed bugs related to the `google_fonts` import, item background color, and chip selection.
*   **Bug Fixes:**
    *   Resolved all issues reported by `flutter analyze`.
    *   Corrected import paths in `lib/home_screen.dart` and `test/widget_test.dart` to use appropriate relative and package imports.

## Current Plan

*   Build out the application's core features, starting with the different pages accessible from the navigation bar.
