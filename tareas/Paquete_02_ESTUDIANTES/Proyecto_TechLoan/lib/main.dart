import 'package:flutter/material.dart';

import 'pages/equipment_page.dart';
import 'pages/home_page.dart';
import 'pages/loans_page.dart';
import 'services/local_store.dart';
import 'state/app_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TechLoanApp());
}

class TechLoanApp extends StatefulWidget {
  const TechLoanApp({super.key});

  @override
  State<TechLoanApp> createState() => _TechLoanAppState();
}

class _TechLoanAppState extends State<TechLoanApp> {
  late final AppController data;
  int selected = 0;

  @override
  void initState() {
    super.initState();
    data = AppController(LocalStore());
    data.addListener(refresh);
    data.load();
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    data.removeListener(refresh);
    data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechLoan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF23579A)),
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF23579A), foregroundColor: Colors.white),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('TechLoan | NexaSoft Solutions')),
        body: data.loading
            ? const Center(child: CircularProgressIndicator())
            : data.error != null
                ? Center(child: Padding(padding: const EdgeInsets.all(20), child: Text(data.error!)))
                : IndexedStack(
                    index: selected,
                    children: [
                      HomePage(data: data),
                      EquipmentPage(data: data),
                      LoansPage(data: data),
                    ],
                  ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selected,
          onDestinationSelected: (index) => setState(() => selected = index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Inicio'),
            NavigationDestination(icon: Icon(Icons.devices_other_outlined), selectedIcon: Icon(Icons.devices), label: 'Equipos'),
            NavigationDestination(icon: Icon(Icons.assignment_outlined), selectedIcon: Icon(Icons.assignment), label: 'Préstamos'),
          ],
        ),
      ),
    );
  }
}
