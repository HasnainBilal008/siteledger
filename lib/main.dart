import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SiteLedgerApp());
}

class SiteLedgerApp extends StatelessWidget {
  const SiteLedgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF16845B);
    return MaterialApp(
      title: 'SiteLedger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        scaffoldBackgroundColor: const Color(0xFFF6F8F7),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF18352A),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController(text: 'admin');
  final _password = TextEditingController(text: 'admin123');
  String? _error;
  bool _busy = false;

  void _login() {
    final accounts = {
      'admin': ('admin123', 'Admin'),
      'accountant': ('acc123', 'Accountant'),
      'manager': ('manager123', 'Manager'),
    };
    final account = accounts[_username.text.trim().toLowerCase()];
    if (account == null || account.$1 != _password.text) {
      setState(() => _error = 'Invalid username or password');
      return;
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => DashboardScreen(role: account.$2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.apartment_rounded, size: 64, color: Color(0xFF16845B)),
                  const SizedBox(height: 16),
                  const Text('SiteLedger', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Construction management, made simple',
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 36),
                  TextField(controller: _username, decoration: const InputDecoration(
                    labelText: 'Username', prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder())),
                  const SizedBox(height: 14),
                  TextField(controller: _password, obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder())),
                  if (_error != null) ...[
                    const SizedBox(height: 10),
                    Text(_error!, style: const TextStyle(color: Colors.red)),
                  ],
                  const SizedBox(height: 22),
                  FilledButton(onPressed: _busy ? null : _login,
                    style: FilledButton.styleFrom(padding: const EdgeInsets.all(16)),
                    child: const Text('Sign in')),
                  const SizedBox(height: 16),
                  const Text('Demo: admin/admin123 · accountant/acc123 · manager/manager123',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Colors.black54)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.location_city_outlined, 'Sites', 'Manage construction sites'),
      (Icons.groups_outlined, 'Workers', 'Worker profiles and wages'),
      (Icons.fact_check_outlined, 'Attendance', 'Daily worker attendance'),
      (Icons.payments_outlined, 'Payments', 'Wage and payment records'),
      (Icons.shopping_cart_outlined, 'Purchases', 'Materials and purchases'),
      (Icons.account_balance_wallet_outlined, 'Income & Expenses', 'Track site finances'),
      (Icons.bar_chart_rounded, 'Profit & Loss', 'Financial overview'),
      (Icons.manage_accounts_outlined, 'Users', 'Roles and permissions'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('SiteLedger'), actions: [
        Padding(padding: const EdgeInsets.only(right: 16),
          child: Center(child: Text(role, style: const TextStyle(fontWeight: FontWeight.w600)))),
      ]),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Good day, $role', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Here is your construction overview.'),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.22),
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.$2} module is next in development'))),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, children: [
                        Icon(item.$1, color: const Color(0xFF16845B), size: 30),
                        const SizedBox(height: 12),
                        Text(item.$2, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(item.$3, style: const TextStyle(fontSize: 11, color: Colors.black54)),
                      ]),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
