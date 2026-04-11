import 'package:flutter/material.dart';
import '../widgets/job_card.dart';

class AppColors {
  static const Color primary      = Color(0xFF55A3A7);
  static const Color secondary    = Color(0xFF4A83B0);
  static const Color accent       = Color(0xFFE9C966);
  static const Color amber        = Color(0xFFECB93C);
  static const Color sage         = Color(0xFF91BA90);
  static const Color cream        = Color(0xFFEFDFAC);
  static const Color lightTeal    = Color(0xFFB8CCCA);
  static const Color dark         = Colors.black;

  static const Color background   = Color(0xFFD5EDE3);
}

class StudentDashboardPage extends StatefulWidget {
  const StudentDashboardPage({super.key});

  @override
  State<StudentDashboardPage> createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,

        leading: const Icon(Icons.menu, color: Colors.black),

        title: const Text(
          "Student's Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Welcome, John!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
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

            JobCard(
              title: "Software Engineer",
              company: "TechCorp",
              type: "Full Time",
              location: "San Francisco, USA",
              time: "5 hours ago",
              salary: "₹4-6 LPA",
              bgColor: AppColors.primary.withOpacity(0.12),
              iconColor: AppColors.primary,
              logoLetter: "T",
            ),

            JobCard(
              title: "UI/UX Designer",
              company: "XYZ Solutions",
              type: "Remote",
              location: "Remote",
              time: "2 days ago",
              salary: "₹3-5 LPA",
              bgColor: AppColors.accent.withOpacity(0.18),
              iconColor: AppColors.amber,
              logoLetter: "X",
            ),

            JobCard(
              title: "Flutter Developer",
              company: "DEE Technologies",
              type: "Full Time",
              location: "Bengaluru, India",
              time: "3 hours ago",
              salary: "₹5-8 LPA",
              bgColor: AppColors.sage.withOpacity(0.18),
              iconColor: AppColors.sage,
              logoLetter: "D",
            ),

            JobCard(
              title: "Data Analyst",
              company: "Analytics Hub",
              type: "Full Time",
              location: "Mumbai, India",
              time: "1 day ago",
              salary: "₹3-5 LPA",
              bgColor: AppColors.secondary.withOpacity(0.12),
              iconColor: AppColors.secondary,
              logoLetter: "A",
            ),
          ],
        ),
      ),

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
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
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