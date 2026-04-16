import 'package:flutter/material.dart';
import '../widgets/job_card.dart';
import 'login_page.dart';
import 'student_profile_page.dart';
import 'student_opening_details_page.dart';

class StudentDashboardPage extends StatefulWidget {
  const StudentDashboardPage({super.key});

  @override
  State<StudentDashboardPage> createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  int _currentIndex = 0;

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
    );
  }


  void _openJobDetails({
    required String title,
    required String company,
    required String location,
    required String type,
    required String salary,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentOpeningDetailsPage(
          title: title,
          company: company,
          location: location,
          type: type,
          salary: salary,
        ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFD5EDE3),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 26, color: Color(0xFF2ECC71)),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Student",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "student@email.com",
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
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search jobs, companies...",
              hintStyle: TextStyle(color: Colors.grey.shade600),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Welcome, Student!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Exploring suitable job openings",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 JOB CARD 1
              GestureDetector(
                onTap: () => _openJobDetails(
                  title: "Software Engineer",
                  company: "TechCorp",
                  location: "San Francisco, USA",
                  type: "Full Time",
                  salary: "₹4-6 LPA",
                ),
                child: JobCard(
                  title: "Software Engineer",
                  company: "TechCorp",
                  type: "Full Time",
                  location: "San Francisco, USA",
                  time: "5 hours ago",
                  salary: "₹4-6 LPA",
                  iconColor: const Color(0xFF2ECC71),
                  logoLetter: "T",
                ),
              ),

              // 🔥 JOB CARD 2
              GestureDetector(
                onTap: () => _openJobDetails(
                  title: "UI/UX Designer",
                  company: "XYZ Solutions",
                  location: "Remote",
                  type: "Remote",
                  salary: "₹3-5 LPA",
                ),
                child: JobCard(
                  title: "UI/UX Designer",
                  company: "XYZ Solutions",
                  type: "Remote",
                  location: "Remote",
                  time: "2 days ago",
                  salary: "₹3-5 LPA",
                  iconColor: const Color(0xFFFFC107),
                  logoLetter: "X",
                ),
              ),

              // 🔥 JOB CARD 3
              GestureDetector(
                onTap: () => _openJobDetails(
                  title: "Flutter Developer",
                  company: "DEE Technologies",
                  location: "Bengaluru, India",
                  type: "Full Time",
                  salary: "₹5-8 LPA",
                ),
                child: JobCard(
                  title: "Flutter Developer",
                  company: "DEE Technologies",
                  type: "Full Time",
                  location: "Bengaluru, India",
                  time: "3 hours ago",
                  salary: "₹5-8 LPA",
                  iconColor: const Color(0xFF3dba8c),
                  logoLetter: "D",
                ),
              ),

              // 🔥 JOB CARD 4
              GestureDetector(
                onTap: () => _openJobDetails(
                  title: "Data Analyst",
                  company: "Analytics Hub",
                  location: "Mumbai, India",
                  type: "Full Time",
                  salary: "₹3-5 LPA",
                ),
                child: JobCard(
                  title: "Data Analyst",
                  company: "Analytics Hub",
                  type: "Full Time",
                  location: "Mumbai, India",
                  time: "1 day ago",
                  salary: "₹3-5 LPA",
                  iconColor: const Color(0xFF1ABC9C),
                  logoLetter: "A",
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentProfilePage(),
              ),
            );
          } else {
            setState(() => _currentIndex = index);
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2ECC71),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Companies"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Applicants"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in), label: "Apply"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}