# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a front-end developer test project for a **WMS/TMS Shipment Management System**. The project consists of:
1. UI/UX Design Prototype (Figma/Adobe XD)
2. Flutter implementation of the designed screen

## Project Requirements

### Screen: Gestão de Expedição (Shipment Management)

**Features:**
- List of orders ready for shipment (with status, destination, carrier)
- Filters and search to quickly find orders
- Quick actions to mark order as shipped or hold for a reason
- Priority indicators (normal, urgent, critical)
- Responsive design for mobile and desktop

### Deliverables
1. Navigable prototype (Figma/Adobe XD)
2. Design justification document
3. Flutter implementation (if applicable)

## Development Commands

### Flutter (if implemented)
```bash
# Install dependencies
flutter pub get

# Run on mobile/desktop
flutter run

# Run tests
flutter test

# Build for web
flutter build web

# Build for Android
flutter build apk

# Build for iOS
flutter build ios
```

## Project Structure

```
/
├── design/                 # Design files and assets
│   ├── prototype/         # Figma/XD prototype files or links
│   └── justification.md   # Design justification document
├── flutter_app/           # Flutter implementation (if created)
│   ├── lib/
│   │   ├── main.dart
│   │   ├── models/        # Data models (Order, Carrier, etc.)
│   │   ├── screens/       # Shipment management screen
│   │   ├── widgets/       # Reusable components
│   │   └── services/      # Business logic
│   └── pubspec.yaml
└── CLAUDE.md
```

## Design Guidelines

### Color Scheme
- Use professional WMS/TMS color palette
- Clear status indicators (green for shipped, yellow for pending, red for critical)
- High contrast for accessibility

### Key UI Components
- **Order List**: DataTable or Card-based list with key information
- **Filters**: Dropdowns for status, carrier, priority
- **Search**: Text field with real-time filtering
- **Quick Actions**: Icon buttons or swipe actions
- **Priority Badge**: Visual indicator with colors/icons

### Responsive Breakpoints
- Mobile: < 600px
- Tablet: 600px - 1024px
- Desktop: > 1024px

## Architecture Notes

### Data Model
- **Order**: id, destination, carrier, status, priority, date, items
- **Status**: pending, ready, shipped, held
- **Priority**: normal, urgent, critical

### State Management (Flutter)
- Consider using Provider, Riverpod, or Bloc for state management
- Separate business logic from UI components
