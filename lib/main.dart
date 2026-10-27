import 'package:flutter/material.dart';

void main() {
  runApp(const GestionFinanciereApp());
}

class GestionFinanciereApp extends StatelessWidget {
  const GestionFinanciereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion Financière',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF0F2F5), // Gris métallique très clair / propre
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C757D), // Gris professionnel
          error: Colors.red.shade700,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // Les 4 ecrans de l'application
  final List<Widget> _screens = [
    const AccueilScreen(),
    const SaisieScreen(),
    const DashboardScreen(),
    const ConseilsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF212529),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Saisie'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Conseils'),
        ],
      ),
    );
  }
}

// --- 1. ÉCRAN D'ACCUEIL ---
class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Financiere'),
        backgroundColor: const Color(0xFFE2E8F0), // Gris métallique brillant
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bonjour, Pacy 👋',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2D3748)),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green.shade700),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'ou est ton tresor, la aussi sera ton coeur!',
                      style: TextStyle(color: Color(0xFF155724), fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 2. ÉCRAN DE SAISIE (Provisoure pour le squelette) ---
class SaisieScreen extends StatelessWidget {
  const SaisieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enregistrement des entrees'), backgroundColor: const Color(0xFFE2E8F0)),
      body: const Center(child: Text('Ici tu rempliras tes Entrées (Libres / Dédiées) et tes Sorties.')),
    );
  }
}

// --- 3. ÉCRAN DASHBOARD ---
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Évolution & Graphiques'), backgroundColor: const Color(0xFFE2E8F0)),
      body: const Center(child: Text('Ici s\'affichera l\'évolution au fil du temps.')),
    );
  }
}

// --- 4. ÉCRAN CONSEILS & ASSISTANCE ---
class ConseilsScreen extends StatelessWidget {
  const ConseilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Remarques & Suivi Humain'), backgroundColor: const Color(0xFFE2E8F0)),
      body: const Center(child: Text('Ici tu retrouveras tes notes, conseils et assistance.')),
    );
  }
}