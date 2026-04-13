import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';
import 'login_page.dart';

class CoordinatorDashboardPage extends StatefulWidget {
  const CoordinatorDashboardPage({super.key});

  @override
  State<CoordinatorDashboardPage> createState() =>
      _CoordinatorDashboardPageState();
}

class _CoordinatorDashboardPageState
    extends State<CoordinatorDashboardPage> {

  int _currentIndex = 0;

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5EDE3),

      drawer: Drawer(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFAED3C6),
              ),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 26),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coordinator",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("coordinator@email.com"),
                    ],
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings Clicked")),
                );
              },
            ),

            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              child: GestureDetector(
                onTap: _logout,
                child: const Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: const Color(0xFFD5EDE3),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        title: const Text(
          "Placement App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          )
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Welcome, Coordinator!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatItem("28", "Companies", Color(0xFFFF8A00)),
                    StatItem("54", "Openings", Color(0xFF2ECC71)),
                    StatItem("196", "Applicants", Color(0xFF1ABC9C)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Company Operations:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const InfoTile(
                icon: Icons.business,
                title: "Register Company",
                subtitle: "Add new company details",
                color: Color(0xFFFFC107),
              ),

              const InfoTile(
                icon: Icons.location_on,
                title: "Add Work Location",
                subtitle: "Add work company locations",
                color: Color(0xFF26A69A),
              ),

              const InfoTile(
                icon: Icons.edit,
                title: "Edit Company Details",
                subtitle: "Edit company information",
                color: Color(0xFF66BB6A),
              ),

              const SizedBox(height: 20),

              const Text(
                "Opening Operations:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const InfoTile(
                icon: Icons.work,
                title: "Create Opening",
                subtitle: "Post new job openings",
                color: Color(0xFF42A5F5),
              ),

              const InfoTile(
                icon: Icons.visibility,
                title: "Read Opening",
                subtitle: "View all job openings",
                color: Color(0xFF8E44AD),
              ),

              const InfoTile(
                icon: Icons.update,
                title: "Update Opening",
                subtitle: "Edit existing openings",
                color: Color(0xFFE67E22),
              ),
            ],
          ),
        ),
      ),

      /// 🔹 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Companies"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Openings"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Applicants"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const StatItem(this.number, this.label, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}