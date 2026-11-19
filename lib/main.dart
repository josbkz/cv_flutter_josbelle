import 'package:flutter/material.dart';

void main() {
  runApp(const CvApp());
}

class CvApp extends StatelessWidget {
  const CvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV - Bahati Bakunzi Josbelle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF542D40), // Soft Plum / Burgundy
          primary: const Color(0xFF542D40),
          secondary: const Color(0xFFDB2777), // Medium Pink Accent
          surface: Colors.white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF5F7), // Very light pink, almost white
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF542D40),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shadowColor: const Color(0x14542D40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ==================== ROBUST PROFILE AVATAR ====================
class ProfileAvatar extends StatelessWidget {
  final double radius;
  const ProfileAvatar({super.key, this.radius = 42});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          'assets/profile.jpeg',
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/profile.jpg',
              width: radius * 2,
              height: radius * 2,
              fit: BoxFit.cover,
              errorBuilder: (context, error2, stackTrace2) {
                return Icon(Icons.person, size: radius, color: const Color(0xFF542D40));
              },
            );
          },
        ),
      ),
    );
  }
}

// ==================== ROBUST FAMILY AVATAR ====================
class FamilyAvatar extends StatelessWidget {
  final double radius;
  const FamilyAvatar({super.key, this.radius = 32});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          'assets/profile_soeur.jpeg',
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/profile_soeur.jpg',
              width: radius * 2,
              height: radius * 2,
              fit: BoxFit.cover,
              errorBuilder: (context, error2, stackTrace2) {
                return Icon(Icons.family_restroom, size: radius, color: const Color(0xFF542D40));
              },
            );
          },
        ),
      ),
    );
  }
}

// ==================== LOGIN PAGE ====================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idController = TextEditingController(text: 'josbelle');
  final _passwordController = TextEditingController(text: '123456');
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainDashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF5F7), Color(0xFFFCE4EC), Color(0xFFF8BBD0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        'Espace CV',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF542D40),
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Bahati Bakunzi Josbelle',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9C6B82),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _idController,
                        decoration: InputDecoration(
                          labelText: 'Identifiant',
                          hintText: 'josbelle',
                          prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF542D40)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.pink.shade100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Color(0xFF542D40), width: 2),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFF9FA),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre identifiant';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                          hintText: '123456',
                          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF542D40)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xFF542D40),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.pink.shade100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Color(0xFF542D40), width: 2),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFFFF9FA),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre mot de passe';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF542D40),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 2,
                          ),
                          onPressed: _login,
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== MAIN DASHBOARD ====================
class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    CvHomePage(),
    FamilyPage(),
    ContactPage(),
  ];

  final List<String> _titles = const [
    'Mon CV',
    'Ma Famille',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF542D40), Color(0xFF3D1F2E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF542D40), Color(0xFF3D1F2E)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              currentAccountPicture: const ProfileAvatar(radius: 28),
              accountName: const Text(
                'Bahati Bakunzi Josbelle',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              accountEmail: const Text(
                'josbelbkz2006@icloud.com',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: Color(0xFF542D40)),
              title: const Text('Accueil / CV', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF542D40))),
              selected: _currentIndex == 0,
              selectedTileColor: const Color(0xFFFFF1F2),
              onTap: () {
                setState(() => _currentIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.family_restroom_outlined, color: Color(0xFF542D40)),
              title: const Text('Famille', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF542D40))),
              selected: _currentIndex == 1,
              selectedTileColor: const Color(0xFFFFF1F2),
              onTap: () {
                setState(() => _currentIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts_outlined, color: Color(0xFF542D40)),
              title: const Text('Contact', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF542D40))),
              selected: _currentIndex == 2,
              selectedTileColor: const Color(0xFFFFF1F2),
              onTap: () {
                setState(() => _currentIndex = 2);
                Navigator.pop(context);
              },
            ),
            const Divider(height: 32),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('Déconnexion', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.redAccent)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x0A542D40),
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: const Color(0xFF542D40),
          unselectedItemColor: Colors.grey.shade400,
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'CV',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom_outlined),
              activeIcon: Icon(Icons.family_restroom),
              label: 'Famille',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts_outlined),
              activeIcon: Icon(Icons.contacts),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== PAGE 1: CV HOME ====================
class CvHomePage extends StatelessWidget {
  const CvHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Header Card with User Profile Picture
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF542D40), Color(0xFF703D55), Color(0xFF8C4D6B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x26542D40),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x1A000000),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: const ProfileAvatar(radius: 42),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bahati Bakunzi Josbelle',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Étudiante en Informatique Appliquée à la Gestion des Entreprises',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Profil
          const _SectionHeader(title: 'Profil Professionnel', icon: Icons.badge_outlined),
          const _InfoCard(
            content: 'Étudiante motivée et passionnée en Informatique Appliquée à la Gestion des Entreprises, désireuse d\'appliquer mes compétences techniques et organisationnelles dans des projets professionnels innovants.',
          ),

          // Formation
          const _SectionHeader(title: 'Formation', icon: Icons.school_outlined),
          const _InfoCard(
            content: 'Informatique Appliquée à la Gestion des Entreprises',
            subtitle: 'Cursus Universitaire',
          ),

          // Expériences
          const _SectionHeader(title: 'Expériences', icon: Icons.work_outline),
          const _InfoCard(
            content: 'Expérience en Informatique',
            subtitle: 'Projets académiques et pratiques professionnelles',
          ),

          // Compétences Techniques
          const _SectionHeader(title: 'Compétences Techniques', icon: Icons.computer_outlined),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: const [
                  _SkillChip(label: 'Informatique'),
                  _SkillChip(label: 'Gestion des Entreprises'),
                  _SkillChip(label: 'Bureautique'),
                  _SkillChip(label: 'Support Technique'),
                ],
              ),
            ),
          ),

          // Compétences Linguistiques
          const _SectionHeader(title: 'Compétences Linguistiques', icon: Icons.language_outlined),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: const [
                  _LanguageChip(label: 'Swahili '),
                  _LanguageChip(label: 'Lingala '),
                  _LanguageChip(label: 'Français '),
                ],
              ),
            ),
          ),

          // Centres d'intérêt
          const _SectionHeader(title: 'Centres d\'intérêt', icon: Icons.favorite_border),
          const _InfoCard(
            content: 'Nouvelles technologies, Lecture, Veille informatique, Projets collaboratifs',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ==================== PAGE 2: FAMILY ====================
class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final familyMembers = [
      {
        'name': 'Bakunzi Mulomba Chancelle',
        'relation': 'Sœur',
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        const Text(
          'Membres de la Famille',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF542D40),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 16),
        ...familyMembers.map((member) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x10542D40),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFDB2777), width: 2),
                    ),
                    child: const FamilyAvatar(radius: 36),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member['name']!,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF542D40),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF1F2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            member['relation']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFDB2777),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

// ==================== PAGE 3: CONTACT ====================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  void _showActionSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF542D40),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Text(
            'Informations de Contact',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF542D40),
            ),
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.phone, color: Color(0xFF542D40)),
                ),
                title: const Text('Téléphone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: const Text('+243 999 48 48 68', style: TextStyle(color: Color(0xFF6B4255), fontSize: 15)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFD1A1B8)),
                onTap: () => _showActionSnackbar(context, 'Appel vers +243 999 48 48 68'),
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.email, color: Color(0xFF542D40)),
                ),
                title: const Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: const Text('josbelbkz2006@icloud.com', style: TextStyle(color: Color(0xFF6B4255), fontSize: 15)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFD1A1B8)),
                onTap: () => _showActionSnackbar(context, 'Ouverture de l\'email: josbelbkz2006@icloud.com'),
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.location_on, color: Color(0xFF542D40)),
                ),
                title: const Text('Adresse', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: const Text('Gisenyi', style: TextStyle(color: Color(0xFF6B4255), fontSize: 15)),
                trailing: const Icon(Icons.map, size: 20, color: Color(0xFF542D40)),
                onTap: () => _showActionSnackbar(context, 'Adresse: Gisenyi'),
              ),
              const Divider(height: 1, indent: 20, endIndent: 20),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.code, color: Color(0xFF542D40)),
                ),
                title: const Text('GitHub', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                subtitle: const Text('https://github.com/josbkz', style: TextStyle(color: Color(0xFF6B4255), fontSize: 15)),
                trailing: const Icon(Icons.open_in_new, size: 18, color: Color(0xFF542D40)),
                onTap: () => _showActionSnackbar(context, 'Ouverture de https://github.com/josbkz'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ==================== HELPER WIDGETS ====================
class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1F2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF542D40), size: 20),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF542D40),
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String content;
  final String? subtitle;

  const _InfoCard({required this.content, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF2D1E26),
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 6),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9C6B82),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFFFF1F2),
      labelStyle: const TextStyle(
        color: Color(0xFF542D40),
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  final String label;

  const _LanguageChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.language, size: 16, color: Color(0xFF542D40)),
      label: Text(label),
      backgroundColor: const Color(0xFFFFF1F2),
      labelStyle: const TextStyle(
        color: Color(0xFF542D40),
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
