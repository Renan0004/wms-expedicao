import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wms_expedicao/models/shipment_order.dart';
import 'package:wms_expedicao/widgets/hold_order_dialog.dart';
import 'package:wms_expedicao/widgets/order_details_dialog.dart';

class OrderTableDesktop extends StatelessWidget {
  final List<ShipmentOrder> orders;
  final Function(String) onShipped;

  const OrderTableDesktop({
    super.key,
    required this.orders,
    required this.onShipped,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey.shade100),
          headingRowHeight: 56,
          dataRowMinHeight: 64,
          dataRowMaxHeight: 72,
          columnSpacing: 24,
          horizontalMargin: 24,
          columns: const [
            DataColumn(
              label: Text(
                'Prio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Pedido',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Destino',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Transportadora',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Data/Hora',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Itens',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Peso',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'Ações',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ],
          rows: orders.map((order) {
            return DataRow(
              cells: [
                // Prioridade
                DataCell(
                  Tooltip(
                    message: order.priority.label,
                    child: Icon(
                      order.priority.icon,
                      color: order.priority.color,
                      size: 22,
                    ),
                  ),
                ),

                // Número do Pedido
                DataCell(
                  Text(
                    order.orderNumber,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),

                // Destino
                DataCell(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        order.city,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        order.state,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Transportadora
                DataCell(
                  Text(
                    order.carrier,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),

                // Status
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: order.status.backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: order.status.color.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      order.status.label,
                      style: TextStyle(
                        color: order.status.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),

                // Data/Hora
                DataCell(
                  Text(
                    dateFormat.format(order.createdAt),
                    style: const TextStyle(fontSize: 13),
                  ),
                ),

                // Itens
                DataCell(
                  Text(
                    '${order.itemCount}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),

                // Peso
                DataCell(
                  Text(
                    '${order.weight.toStringAsFixed(1)}kg',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),

                // Ações - MENU DE 3 PONTOS
                DataCell(
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.grey.shade700,
                      size: 22,
                    ),
                    tooltip: 'Ações',
                    offset: const Offset(0, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'details',
                        child: Row(
                          children: [
                            Icon(
                              Icons.visibility_outlined,
                              size: 20,
                              color: Colors.blue.shade700,
                            ),
                            const SizedBox(width: 12),
                            const Text('Ver Detalhes'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'shipped',
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: Colors.green.shade700,
                            ),
                            const SizedBox(width: 12),
                            const Text('Marcar como Enviado'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'hold',
                        child: Row(
                          children: [
                            Icon(
                              Icons.pause_circle_outline,
                              size: 20,
                              color: Colors.orange.shade700,
                            ),
                            const SizedBox(width: 12),
                            const Text('Reter Pedido'),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      switch (value) {
                        case 'details':
                          showDialog(
                            context: context,
                            builder: (context) => OrderDetailsDialog(order: order),
                          );
                          break;
                        case 'shipped':
                          onShipped(order.id);
                          break;
                        case 'hold':
                          showDialog(
                            context: context,
                            builder: (context) => HoldOrderDialog(
                              orderNumber: order.orderNumber,
                              orderId: order.id,
                            ),
                          );
                          break;
                      }
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
