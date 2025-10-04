import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wms_expedicao/models/shipment_order.dart';
import 'package:wms_expedicao/widgets/hold_order_dialog.dart';
import 'package:wms_expedicao/widgets/order_details_dialog.dart';

class OrderCardMobile extends StatelessWidget {
  final ShipmentOrder order;
  final VoidCallback onShipped;

  const OrderCardMobile({
    super.key,
    required this.order,
    required this.onShipped,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => OrderDetailsDialog(order: order),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(18), // Mais padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com prioridade e número do pedido
              Row(
                children: [
                  Icon(
                    order.priority.icon,
                    color: order.priority.color,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    order.orderNumber,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700, // Mais forte
                    ),
                  ),
                  const Spacer(),
                  // TAG MODERNIZADA
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
                ],
              ),
              const SizedBox(height: 16), // Mais espaço

              // Destino
              Row(
                children: [
                  Icon(Icons.location_on, size: 20, color: Colors.grey.shade600),
                  const SizedBox(width: 10),
                  Text(
                    order.fullDestination,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Transportadora
              Row(
                children: [
                  Icon(Icons.local_shipping, size: 20, color: Colors.grey.shade600),
                  const SizedBox(width: 10),
                  Text(
                    order.carrier,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Data e informações
              Row(
                children: [
                  Icon(Icons.access_time, size: 18, color: Colors.grey.shade600),
                  const SizedBox(width: 10),
                  Text(
                    dateFormat.format(order.createdAt),
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${order.itemCount} itens • ${order.weight.toStringAsFixed(1)}kg',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // Motivo de retenção (se houver)
              if (order.heldReason != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning, size: 18, color: Colors.red.shade700),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          order.heldReason!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // Botões de ação - MENU DE 3 PONTOS
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.pause_circle_outline, size: 20),
                      label: const Text('Reter'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => HoldOrderDialog(
                            orderNumber: order.orderNumber,
                            orderId: order.id,
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.orange.shade700,
                        side: BorderSide(color: Colors.orange.shade300),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.check_circle_outline, size: 20),
                      label: const Text('Enviar'),
                      onPressed: onShipped,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
