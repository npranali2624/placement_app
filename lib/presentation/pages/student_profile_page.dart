import 'package:flutter/material.dart';
import 'student_dashboard_page.dart';
import 'edit_student_profile_page.dart';
import 'login_page.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  static const String _name        = "Rahul Sharma";
  static const String _email       = "rahul.sharma@email.com";
  static const String _gender      = "Male";
  static const String _dob         = "15 Aug 2002";
  static const String _phone       = "+91 98765 43210";
  static const String _address     = "Pune, Maharashtra";
  static const String _skills      = "Flutter, Dart, Python, Firebase";

  static const String _college     = "MIT College of Engineering, Pune";
  static const String _course      = "B.E.";
  static const String _branch      = "Computer Engineering";
  static const String _year        = "3rd Year";
  static const String _cgpa        = "8.5 / 10";
  static const String _diplomaPct  = "85%";
  static const String _yearPassing = "2025";

  Widget _sectionCard({
    required String title,
    required List<Color> gradientColors,
    required List<Map<String, String>> rows,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradientColors),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 0.6,
              ),
            ),
          ),
          ...rows.asMap().entries.map((entry) {
            final isLast = entry.key == rows.length - 1;
            final row = entry.value;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                  child: Row(
                    children: [
                      Text(
                        row['label']!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        row['value']!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.grey.shade300,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5EDE3),

      appBar: AppBar(
        title: const Text(
          "Student Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFFD5EDE3),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD54F).withOpacity(0.25), // soft yellow bg
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 52,
                        color: Color(0xFFFFA000), // amber icon (not too bright)
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      _name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      _email,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF2ECC71),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🟠 PERSONAL DETAILS
              _sectionCard(
                title: "PERSONAL DETAILS",
                gradientColors: const [
                  Color(0xFFFFA726),
                  Color(0xFFFFCC80),
                ],
                rows: const [
                  {'label': 'Gender', 'value': _gender},
                  {'label': 'Date of Birth', 'value': _dob},
                  {'label': 'Phone Number', 'value': _phone},
                  {'label': 'Location / Address', 'value': _address},
                  {'label': 'Technical Skills', 'value': _skills},
                ],
              ),

              const SizedBox(height: 16),

              // 🟠 QUALIFICATION (same color)
              _sectionCard(
                title: "QUALIFICATION",
                gradientColors: const [
                  Color(0xFFFFA726),
                  Color(0xFFFFCC80),
                ],
                rows: const [
                  {'label': 'College Name', 'value': _college},
                  {'label': 'Course', 'value': _course},
                  {'label': 'Branch', 'value': _branch},
                  {'label': 'Year', 'value': _year},
                  {'label': 'CGPA', 'value': _cgpa},
                  {'label': '12th / Diploma %', 'value': _diplomaPct},
                  {'label': 'Year of Passing', 'value': _yearPassing},
                ],
              ),

              const SizedBox(height: 28),

              // 🔵 BUTTON
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditStudentProfilePage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF64B5F6),
                        Color(0xFF90CAF9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Center(
                    child: Text(
                      "Update Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}