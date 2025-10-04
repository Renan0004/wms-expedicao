import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  ready,
  shipped,
  held;

  String get label {
    switch (this) {
      case OrderStatus.pending:
        return 'Pendente';
      case OrderStatus.ready:
        return 'Pronto';
      case OrderStatus.shipped:
        return 'Enviado';
      case OrderStatus.held:
        return 'Retido';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.grey;
      case OrderStatus.ready:
        return Colors.blue;
      case OrderStatus.shipped:
        return Colors.green;
      case OrderStatus.held:
        return Colors.red;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case OrderStatus.pending:
        return Colors.grey.shade100;
      case OrderStatus.ready:
        return Colors.blue.shade50;
      case OrderStatus.shipped:
        return Colors.green.shade50;
      case OrderStatus.held:
        return Colors.red.shade50;
    }
  }
}
