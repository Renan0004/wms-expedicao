import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wms_expedicao/models/order_status.dart';
import 'package:wms_expedicao/models/priority.dart';
import 'package:wms_expedicao/services/shipment_provider.dart';
import 'package:wms_expedicao/services/shipment_service.dart';

class FilterChipWidget extends StatelessWidget {
  const FilterChipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShipmentProvider>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // Botão Filtro de Status
          PopupMenuButton<OrderStatus>(
            child: Chip(
              avatar: const Icon(Icons.filter_list, size: 18),
              label: Text(
                'Status ${provider.statusFilters.isNotEmpty ? "(${provider.statusFilters.length})" : ""}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: provider.statusFilters.isNotEmpty
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              backgroundColor: provider.statusFilters.isNotEmpty
                  ? Colors.blue.shade100
                  : Colors.grey.shade200,
            ),
            itemBuilder: (context) => OrderStatus.values
                .map((status) => CheckedPopupMenuItem<OrderStatus>(
                      value: status,
                      checked: provider.statusFilters.contains(status),
                      child: Text(status.label),
                    ))
                .toList(),
            onSelected: (status) => provider.toggleStatusFilter(status),
          ),
          const SizedBox(width: 8),

          // Badges de Status Selecionados
          ...provider.statusFilters.map((status) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(
                  avatar: Icon(
                    Icons.circle,
                    size: 12,
                    color: status.color,
                  ),
                  label: Text(
                    status.label,
                    style: const TextStyle(fontSize: 12),
                  ),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () => provider.toggleStatusFilter(status),
                  backgroundColor: status.backgroundColor,
                  side: BorderSide(color: status.color.withOpacity(0.3)),
                ),
              )),

          // Botão Filtro de Prioridade
          PopupMenuButton<Priority>(
            child: Chip(
              avatar: const Icon(Icons.priority_high, size: 18),
              label: Text(
                'Prioridade ${provider.priorityFilters.isNotEmpty ? "(${provider.priorityFilters.length})" : ""}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: provider.priorityFilters.isNotEmpty
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              backgroundColor: provider.priorityFilters.isNotEmpty
                  ? Colors.orange.shade100
                  : Colors.grey.shade200,
            ),
            itemBuilder: (context) => Priority.values
                .map((priority) => CheckedPopupMenuItem<Priority>(
                      value: priority,
                      checked: provider.priorityFilters.contains(priority),
                      child: Row(
                        children: [
                          Icon(priority.icon, color: priority.color, size: 16),
                          const SizedBox(width: 8),
                          Text(priority.label),
                        ],
                      ),
                    ))
                .toList(),
            onSelected: (priority) => provider.togglePriorityFilter(priority),
          ),
          const SizedBox(width: 8),

          // Badges de Prioridade Selecionadas
          ...provider.priorityFilters.map((priority) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(
                  avatar: Icon(
                    priority.icon,
                    size: 16,
                    color: priority.color,
                  ),
                  label: Text(
                    priority.label,
                    style: const TextStyle(fontSize: 12),
                  ),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () => provider.togglePriorityFilter(priority),
                  backgroundColor: priority.color.withOpacity(0.1),
                  side: BorderSide(color: priority.color.withOpacity(0.3)),
                ),
              )),

          // Botão Filtro de Transportadora
          PopupMenuButton<String>(
            child: Chip(
              avatar: const Icon(Icons.local_shipping, size: 18),
              label: Text(
                'Transportadora ${provider.carrierFilters.isNotEmpty ? "(${provider.carrierFilters.length})" : ""}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: provider.carrierFilters.isNotEmpty
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
              backgroundColor: provider.carrierFilters.isNotEmpty
                  ? Colors.green.shade100
                  : Colors.grey.shade200,
            ),
            itemBuilder: (context) => ShipmentService.getCarriers()
                .map((carrier) => CheckedPopupMenuItem<String>(
                      value: carrier,
                      checked: provider.carrierFilters.contains(carrier),
                      child: Text(carrier),
                    ))
                .toList(),
            onSelected: (carrier) => provider.toggleCarrierFilter(carrier),
          ),
          const SizedBox(width: 8),

          // Badges de Transportadoras Selecionadas
          ...provider.carrierFilters.map((carrier) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(
                  avatar: Icon(
                    Icons.local_shipping,
                    size: 16,
                    color: Colors.green.shade700,
                  ),
                  label: Text(
                    carrier,
                    style: const TextStyle(fontSize: 12),
                  ),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () => provider.toggleCarrierFilter(carrier),
                  backgroundColor: Colors.green.shade50,
                  side: BorderSide(color: Colors.green.shade300),
                ),
              )),

          // Botão Limpar Todos os Filtros
          if (provider.hasActiveFilters)
            TextButton.icon(
              icon: Icon(Icons.clear_all, size: 18, color: Colors.red.shade700),
              label: Text(
                'Limpar Tudo',
                style: TextStyle(
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                side: BorderSide(color: Colors.red.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => provider.clearFilters(),
            ),
        ],
      ),
    );
  }
}
