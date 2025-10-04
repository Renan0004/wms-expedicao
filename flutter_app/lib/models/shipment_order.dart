import 'package:wms_expedicao/models/order_status.dart';
import 'package:wms_expedicao/models/priority.dart';

class ShipmentOrder {
  final String id;
  final String orderNumber;
  final String destination;
  final String city;
  final String state;
  final String carrier;
  final OrderStatus status;
  final Priority priority;
  final DateTime createdAt;
  final int itemCount;
  final double weight;
  final String? heldReason;

  ShipmentOrder({
    required this.id,
    required this.orderNumber,
    required this.destination,
    required this.city,
    required this.state,
    required this.carrier,
    required this.status,
    required this.priority,
    required this.createdAt,
    required this.itemCount,
    required this.weight,
    this.heldReason,
  });

  String get fullDestination => '$city - $state';

  ShipmentOrder copyWith({
    String? id,
    String? orderNumber,
    String? destination,
    String? city,
    String? state,
    String? carrier,
    OrderStatus? status,
    Priority? priority,
    DateTime? createdAt,
    int? itemCount,
    double? weight,
    String? heldReason,
  }) {
    return ShipmentOrder(
      id: id ?? this.id,
      orderNumber: orderNumber ?? this.orderNumber,
      destination: destination ?? this.destination,
      city: city ?? this.city,
      state: state ?? this.state,
      carrier: carrier ?? this.carrier,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      itemCount: itemCount ?? this.itemCount,
      weight: weight ?? this.weight,
      heldReason: heldReason ?? this.heldReason,
    );
  }
}
