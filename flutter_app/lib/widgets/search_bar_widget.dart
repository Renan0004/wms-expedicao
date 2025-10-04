import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wms_expedicao/services/shipment_provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShipmentProvider>();

    return TextField(
      onChanged: (value) => provider.setSearchQuery(value),
      decoration: InputDecoration(
        hintText: 'Buscar pedido, destino ou transportadora...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: provider.searchQuery.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => provider.setSearchQuery(''),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
    );
  }
}
