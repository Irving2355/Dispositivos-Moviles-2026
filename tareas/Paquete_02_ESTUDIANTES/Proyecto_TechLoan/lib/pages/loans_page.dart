import 'package:flutter/material.dart';

import '../models/loan.dart';
import '../state/app_controller.dart';
import 'new_loan_page.dart';

class LoansPage extends StatelessWidget {
  const LoansPage({super.key, required this.data});
  final AppController data;

  String dateLabel(DateTime date) => '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  @override
  Widget build(BuildContext context) {
    final items = [...data.loans]..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return Scaffold(
      body: items.isEmpty
          ? const Center(child: Text('Aún no hay préstamos registrados.'))
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 85),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final Loan loan = items[index];
                final device = data.findEquipment(loan.equipmentId);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(child: Text(device?.name ?? loan.equipmentId, style: Theme.of(context).textTheme.titleMedium)),
                          Chip(label: Text(loan.status)),
                        ]),
                        Text('${loan.id} · ${loan.borrower}'),
                        const SizedBox(height: 5),
                        Text('Registro: ${dateLabel(loan.createdAt)}  ·  Límite: ${dateLabel(loan.dueAt)}'),
                        if (loan.notes.isNotEmpty) Text('Nota: ${loan.notes}'),
                        if (loan.isActive)
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () async {
                                await data.returnLoan(loan);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Devolución registrada.')));
                                }
                              },
                              icon: const Icon(Icons.assignment_return_outlined),
                              label: const Text('Registrar devolución'),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => NewLoanPage(data: data))),
        icon: const Icon(Icons.add),
        label: const Text('Nuevo préstamo'),
      ),
    );
  }
}
