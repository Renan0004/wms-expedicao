import 'package:wms_expedicao/models/shipment_order.dart';
import 'package:wms_expedicao/models/order_status.dart';
import 'package:wms_expedicao/models/priority.dart';

class ShipmentService {
  // Dados mock para demonstração
  static List<ShipmentOrder> getMockOrders() {
    return [
      ShipmentOrder(
        id: '1',
        orderNumber: '#12345',
        destination: 'São Paulo',
        city: 'São Paulo',
        state: 'SP',
        carrier: 'Logística XYZ',
        status: OrderStatus.ready,
        priority: Priority.critical,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        itemCount: 15,
        weight: 45.5,
      ),
      ShipmentOrder(
        id: '2',
        orderNumber: '#12346',
        destination: 'Rio de Janeiro',
        city: 'Rio de Janeiro',
        state: 'RJ',
        carrier: 'Expresso Transportes',
        status: OrderStatus.ready,
        priority: Priority.urgent,
        createdAt: DateTime.now().subtract(const Duration(hours: 4)),
        itemCount: 8,
        weight: 22.3,
      ),
      ShipmentOrder(
        id: '3',
        orderNumber: '#12347',
        destination: 'Curitiba',
        city: 'Curitiba',
        state: 'PR',
        carrier: 'Rápida Logística',
        status: OrderStatus.pending,
        priority: Priority.normal,
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
        itemCount: 12,
        weight: 35.7,
      ),
      ShipmentOrder(
        id: '4',
        orderNumber: '#12348',
        destination: 'Belo Horizonte',
        city: 'Belo Horizonte',
        state: 'MG',
        carrier: 'Logística XYZ',
        status: OrderStatus.held,
        priority: Priority.urgent,
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
        itemCount: 20,
        weight: 67.2,
        heldReason: 'Documentação pendente',
      ),
      ShipmentOrder(
        id: '5',
        orderNumber: '#12349',
        destination: 'Porto Alegre',
        city: 'Porto Alegre',
        state: 'RS',
        carrier: 'Expresso Transportes',
        status: OrderStatus.shipped,
        priority: Priority.normal,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        itemCount: 10,
        weight: 28.9,
      ),
      ShipmentOrder(
        id: '6',
        orderNumber: '#12350',
        destination: 'Brasília',
        city: 'Brasília',
        state: 'DF',
        carrier: 'Rápida Logística',
        status: OrderStatus.ready,
        priority: Priority.critical,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        itemCount: 5,
        weight: 15.4,
      ),
      ShipmentOrder(
        id: '7',
        orderNumber: '#12351',
        destination: 'Salvador',
        city: 'Salvador',
        state: 'BA',
        carrier: 'Logística XYZ',
        status: OrderStatus.pending,
        priority: Priority.normal,
        createdAt: DateTime.now().subtract(const Duration(hours: 10)),
        itemCount: 18,
        weight: 52.1,
      ),
      ShipmentOrder(
        id: '8',
        orderNumber: '#12352',
        destination: 'Fortaleza',
        city: 'Fortaleza',
        state: 'CE',
        carrier: 'Expresso Transportes',
        status: OrderStatus.ready,
        priority: Priority.urgent,
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        itemCount: 7,
        weight: 19.8,
      ),
    ];
  }

  static List<String> getCarriers() {
    return [
      'Logística XYZ',
      'Expresso Transportes',
      'Rápida Logística',
    ];
  }
}
