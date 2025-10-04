import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wms_expedicao/services/shipment_provider.dart';
import 'package:wms_expedicao/widgets/search_bar_widget.dart';
import 'package:wms_expedicao/widgets/filter_chip_widget.dart';
import 'package:wms_expedicao/widgets/order_card_mobile.dart';
import 'package:wms_expedicao/widgets/order_table_desktop.dart';

class ShipmentScreen extends StatelessWidget {
  const ShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gestão de Expedição',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Consumer<ShipmentProvider>(
            builder: (context, provider, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Chip(
                    avatar: const Icon(Icons.inventory_2, size: 18),
                    label: Text(
                      '${provider.orders.length} pedidos',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                const SearchBarWidget(),
                const SizedBox(height: 12),
                const FilterChipWidget(),
              ],
            ),
          ),

          const Divider(height: 1),

          // Lista de pedidos (responsiva)
          Expanded(
            child: Consumer<ShipmentProvider>(
              builder: (context, provider, _) {
                if (provider.orders.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Nenhum pedido encontrado',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tente ajustar os filtros de busca',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    // Responsividade: Mobile vs Desktop
                    final isMobile = constraints.maxWidth < 900;

                    if (isMobile) {
                      // Layout Mobile - Cards
                      return ListView.builder(
                        itemCount: provider.orders.length,
                        itemBuilder: (context, index) {
                          final order = provider.orders[index];
                          return OrderCardMobile(
                            order: order,
                            onShipped: () {
                              provider.markAsShipped(order.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Pedido ${order.orderNumber} marcado como enviado',
                                  ),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else {
                      // Layout Desktop - Tabela com largura limitada
                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1400),
                          child: SingleChildScrollView(
                            child: OrderTableDesktop(
                              orders: provider.orders,
                              onShipped: (orderId) {
                                final order = provider.orders
                                    .firstWhere((o) => o.id == orderId);
                                provider.markAsShipped(orderId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Pedido ${order.orderNumber} marcado como enviado',
                                    ),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),

      // Botão Floating (apenas mobile)
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 900) {
            return FloatingActionButton.extended(
              onPressed: () {
                // Ação adicional (ex: escanear código de barras)
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Escanear'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
