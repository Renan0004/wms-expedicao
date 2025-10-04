import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wms_expedicao/services/shipment_provider.dart';

class HoldOrderDialog extends StatefulWidget {
  final String orderNumber;
  final String orderId;

  const HoldOrderDialog({
    super.key,
    required this.orderNumber,
    required this.orderId,
  });

  @override
  State<HoldOrderDialog> createState() => _HoldOrderDialogState();
}

class _HoldOrderDialogState extends State<HoldOrderDialog> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  String? _selectedReason;

  final List<String> _commonReasons = [
    'Documentação pendente',
    'Produto em falta',
    'Endereço incompleto',
    'Aguardando pagamento',
    'Solicitação do cliente',
    'Outro motivo',
  ];

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final reason = _selectedReason == 'Outro motivo'
          ? _reasonController.text
          : _selectedReason!;

      context.read<ShipmentProvider>().holdOrder(widget.orderId, reason);
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pedido ${widget.orderNumber} retido com sucesso'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.pause_circle, color: Colors.orange),
          const SizedBox(width: 12),
          Text('Reter Pedido ${widget.orderNumber}'),
        ],
      ),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selecione o motivo da retenção:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),

              // Lista de motivos
              ..._commonReasons.map((reason) {
                return RadioListTile<String>(
                  title: Text(reason),
                  value: reason,
                  groupValue: _selectedReason,
                  onChanged: (value) {
                    setState(() {
                      _selectedReason = value;
                    });
                  },
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                );
              }),

              // Campo de texto customizado
              if (_selectedReason == 'Outro motivo') ...[
                const SizedBox(height: 8),
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Descreva o motivo',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (_selectedReason == 'Outro motivo' &&
                        (value == null || value.trim().isEmpty)) {
                      return 'Por favor, descreva o motivo';
                    }
                    return null;
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton.icon(
          onPressed: _selectedReason != null ? _submit : null,
          icon: const Icon(Icons.pause_circle),
          label: const Text('Reter Pedido'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
