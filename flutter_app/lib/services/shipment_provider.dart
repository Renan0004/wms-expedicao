import 'package:flutter/foundation.dart';
import 'package:wms_expedicao/models/shipment_order.dart';
import 'package:wms_expedicao/models/order_status.dart';
import 'package:wms_expedicao/models/priority.dart';
import 'package:wms_expedicao/services/shipment_service.dart';

class ShipmentProvider extends ChangeNotifier {
  List<ShipmentOrder> _allOrders = [];
  List<ShipmentOrder> _filteredOrders = [];

  String _searchQuery = '';
  List<OrderStatus> _statusFilters = [];
  List<Priority> _priorityFilters = [];
  List<String> _carrierFilters = [];

  ShipmentProvider() {
    _loadOrders();
  }

  List<ShipmentOrder> get orders => _filteredOrders;
  String get searchQuery => _searchQuery;
  List<OrderStatus> get statusFilters => _statusFilters;
  List<Priority> get priorityFilters => _priorityFilters;
  List<String> get carrierFilters => _carrierFilters;

  bool get hasActiveFilters =>
      _statusFilters.isNotEmpty ||
      _priorityFilters.isNotEmpty ||
      _carrierFilters.isNotEmpty;

  void _loadOrders() {
    _allOrders = ShipmentService.getMockOrders();
    _applyFilters();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void toggleStatusFilter(OrderStatus status) {
    if (_statusFilters.contains(status)) {
      _statusFilters.remove(status);
    } else {
      _statusFilters.add(status);
    }
    _applyFilters();
  }

  void togglePriorityFilter(Priority priority) {
    if (_priorityFilters.contains(priority)) {
      _priorityFilters.remove(priority);
    } else {
      _priorityFilters.add(priority);
    }
    _applyFilters();
  }

  void toggleCarrierFilter(String carrier) {
    if (_carrierFilters.contains(carrier)) {
      _carrierFilters.remove(carrier);
    } else {
      _carrierFilters.add(carrier);
    }
    _applyFilters();
  }

  void clearFilters() {
    _searchQuery = '';
    _statusFilters.clear();
    _priorityFilters.clear();
    _carrierFilters.clear();
    _applyFilters();
  }

  void _applyFilters() {
    _filteredOrders = _allOrders.where((order) {
      // Filtro de busca
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        final matchesSearch = order.orderNumber.toLowerCase().contains(query) ||
            order.destination.toLowerCase().contains(query) ||
            order.carrier.toLowerCase().contains(query) ||
            order.city.toLowerCase().contains(query) ||
            order.state.toLowerCase().contains(query);

        if (!matchesSearch) return false;
      }

      // Filtro de status (múltiplos)
      if (_statusFilters.isNotEmpty && !_statusFilters.contains(order.status)) {
        return false;
      }

      // Filtro de prioridade (múltiplos)
      if (_priorityFilters.isNotEmpty && !_priorityFilters.contains(order.priority)) {
        return false;
      }

      // Filtro de transportadora (múltiplos)
      if (_carrierFilters.isNotEmpty && !_carrierFilters.contains(order.carrier)) {
        return false;
      }

      return true;
    }).toList();

    // Ordenar por prioridade (crítico primeiro) e depois por data
    _filteredOrders.sort((a, b) {
      final priorityComparison = b.priority.index.compareTo(a.priority.index);
      if (priorityComparison != 0) return priorityComparison;
      return b.createdAt.compareTo(a.createdAt);
    });

    notifyListeners();
  }

  void markAsShipped(String orderId) {
    final index = _allOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _allOrders[index] = _allOrders[index].copyWith(
        status: OrderStatus.shipped,
      );
      _applyFilters();
    }
  }

  void holdOrder(String orderId, String reason) {
    final index = _allOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _allOrders[index] = _allOrders[index].copyWith(
        status: OrderStatus.held,
        heldReason: reason,
      );
      _applyFilters();
    }
  }

  void releaseOrder(String orderId) {
    final index = _allOrders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _allOrders[index] = _allOrders[index].copyWith(
        status: OrderStatus.ready,
        heldReason: null,
      );
      _applyFilters();
    }
  }
}
