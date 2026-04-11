import 'package:flutter/material.dart';
import '../widgets/info_tile.dart';

class CoordinatorDashboardPage extends StatefulWidget {
  const CoordinatorDashboardPage({super.key});

  @override
  State<CoordinatorDashboardPage> createState() =>
      _CoordinatorDashboardPageState();
}

class _CoordinatorDashboardPageState
    extends State<CoordinatorDashboardPage> {

  int _currentIndex = 0; // ✅ TRACK SELECTED TAB

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFD5EDE3),

      appBar: AppBar(
        backgroundColor: const Color(0xFFD5EDE3),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: const Icon(Icons.menu, color: Colors.black),
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
          child: Padding(
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
              ],
            ),
          ),
        ),
      ),

      // ✅ FIXED BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex, // ✅ DYNAMIC
          onTap: (index) {
            setState(() {
              _currentIndex = index; // ✅ UPDATE TAB
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: "Companies",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: "Openings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Applicants",
            ),
          ],
        ),
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