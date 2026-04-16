import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';
import 'login_page.dart';
import 'register_company_page.dart';
import 'add_edit_opening.dart';

// ✅ ADD THESE IMPORTS
import 'add_work_location_page.dart';
import 'company_details_page.dart';
import 'coordinator_profile_page.dart';

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

  void _openAddEditOpening() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddEditOpeningScreen(),
      ),
    );
  }

  // ✅ NEW NAVIGATION METHODS
  void _openAddWorkLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddWorkLocationPage(),
      ),
    );
  }

  void _openEditCompany() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CompanyDetailsScreen(),
      ),
    );
  }

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CoordinatorProfilePage(),
      ),
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
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFD5EDE3),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 26, color: Color(0xFF2ECC71)),
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
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "coordinator@email.com",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text("Settings",
                  style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings Clicked")),
                );
              },
            ),

            const Spacer(),

            InkWell(
              onTap: _logout,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16),
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
            child:
            Icon(Icons.notifications_none, color: Colors.black),
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
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Colors.grey.shade300, width: 1.2),
                ),
                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    StatItem("28", "Companies",
                        Color(0xFFFF8A00)),
                    StatItem("54", "Openings",
                        Color(0xFF2ECC71)),
                    StatItem("196", "Applicants",
                        Color(0xFF1ABC9C)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Company Operations:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const RegisterCompanyPage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: const InfoTile(
                  icon: Icons.business,
                  title: "Register Company",
                  subtitle: "Add new company details",
                  color: Color(0xFFFFC107),
                ),
              ),

              InkWell(
                onTap: _openAddWorkLocation, // ✅ UPDATED
                borderRadius: BorderRadius.circular(20),
                child: const InfoTile(
                  icon: Icons.location_on,
                  title: "Add Work Location",
                  subtitle: "Add work company locations",
                  color: Color(0xFF26A69A),
                ),
              ),

              InkWell(
                onTap: _openEditCompany, // ✅ UPDATED
                borderRadius: BorderRadius.circular(20),
                child: const InfoTile(
                  icon: Icons.edit,
                  title: "Edit Company Details",
                  subtitle: "Edit company information",
                  color: Color(0xFF66BB6A),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Opening Operations:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: _openAddEditOpening,
                borderRadius: BorderRadius.circular(20),
                child: const InfoTile(
                  icon: Icons.work,
                  title: "Create Opening",
                  subtitle: "Post new job openings",
                  color: Color(0xFF42A5F5),
                ),
              ),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: const InfoTile(
                  icon: Icons.visibility,
                  title: "Read Opening",
                  subtitle: "View all job openings",
                  color: Color(0xFF8E44AD),
                ),
              ),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: const InfoTile(
                  icon: Icons.update,
                  title: "Update Opening",
                  subtitle: "Edit existing openings",
                  color: Color(0xFFE67E22),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // ✅ PROFILE NAVIGATION ADDED
          if (index == 4) {
            _openProfile();
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF2ECC71)),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Color(0xFF3498DB)),
            label: "Companies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: Color(0xFFF39C12)),
            label: "Openings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Color(0xFF9B59B6)),
            label: "Applicants",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF1ABC9C)),
            label: "Profile",
          ),
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
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}