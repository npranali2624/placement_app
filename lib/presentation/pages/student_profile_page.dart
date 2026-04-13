import 'package:flutter/material.dart';
import 'student_dashboard_page.dart';
import 'edit_student_profile_page.dart';
import '../widgets/custom_button.dart';

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
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.teal.withOpacity(0.2)),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 Gradient Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
              ),
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

          // 🔹 Rows
          ...rows.asMap().entries.map((entry) {
            final isLast = entry.key == rows.length - 1;
            final row = entry.value;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 11),
                  child: Row(
                    children: [
                      Text(
                        row['label']!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B8F85),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        row['value']!,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1A3C34),
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.teal.withOpacity(0.12),
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
      backgroundColor: const Color(0xFFF5F9F8), // light background

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F9F8),
        elevation: 0,
        title: const Text(
          "Student Profile",
          style: TextStyle(
            color: Color(0xFF1A3C34),
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF1A3C34)),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            children: [

              // 🔹 Profile Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.teal.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 52,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      _name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A3C34),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      _email,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Personal Details
              _sectionCard(
                title: "PERSONAL DETAILS",
                gradientColors: const [
                  Color(0xFF55A3A7),
                  Color(0xFF91BA90),
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

              // 🔹 Qualification
              _sectionCard(
                title: "QUALIFICATION",
                gradientColors: const [
                  Color(0xFF4A83B0),
                  Color(0xFF55A3A7),
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


              CustomButton(
                label: "Update Profile",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const EditStudentProfilePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}