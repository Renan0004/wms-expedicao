import 'package:flutter/material.dart';

enum Priority {
  normal,
  urgent,
  critical;

  String get label {
    switch (this) {
      case Priority.normal:
        return 'Normal';
      case Priority.urgent:
        return 'Urgente';
      case Priority.critical:
        return 'Crítico';
    }
  }

  Color get color {
    switch (this) {
      case Priority.normal:
        return Colors.green;
      case Priority.urgent:
        return Colors.orange;
      case Priority.critical:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case Priority.normal:
        return Icons.circle;
      case Priority.urgent:
        return Icons.warning;
      case Priority.critical:
        return Icons.error;
    }
  }
}
