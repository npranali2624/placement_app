import 'package:flutter/material.dart';
import 'login_page.dart';
import 'edit_coordinator_profile_page.dart';

class CoordinatorProfilePage extends StatelessWidget {
  const CoordinatorProfilePage({super.key});


  static const String _name        = "Priya Deshmukh";
  static const String _email       = "coordinator@email.com";
  static const String _phone       = "+91 98765 12345";
  static const String _gender      = "Female";
  static const String _dob         = "10 Jan 1995";
  static const String _address     = "Pune, Maharashtra";

  static const String _role        = "Placement Coordinator";
  static const String _department  = "Training & Placement Cell";
  static const String _college     = "MIT College of Engineering";
  static const String _experience  = "5 Years";

  static const String _companiesManaged = "28";
  static const String _openingsCreated  = "54";
  static const String _studentsHandled  = "196";


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
          "Coordinator Profile",
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
                        color: const Color(0xFF42A5F5).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.admin_panel_settings,
                        size: 52,
                        color: Color(0xFF1E88E5),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      _name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
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


              _sectionCard(
                title: "PERSONAL DETAILS",
                gradientColors: const [
                  Color(0xFFFF8A00),
                  Color(0xFFFFB74D),
                ],
                rows: const [
                  {'label': 'Gender', 'value': _gender},
                  {'label': 'Date of Birth', 'value': _dob},
                  {'label': 'Phone Number', 'value': _phone},
                  {'label': 'Address', 'value': _address},
                ],
              ),

              const SizedBox(height: 16),


              _sectionCard(
                title: "PROFESSIONAL DETAILS",
                gradientColors: const [
                  Color(0xFFFF8A00),
                  Color(0xFFFFB74D),
                ],
                rows: const [
                  {'label': 'Role', 'value': _role},
                  {'label': 'Department', 'value': _department},
                  {'label': 'Organization', 'value': _college},
                  {'label': 'Experience', 'value': _experience},
                ],
              ),

              const SizedBox(height: 16),


              _sectionCard(
                title: "WORK SUMMARY",
                gradientColors: const [
                  Color(0xFFFF8A00),
                  Color(0xFFFFB74D),
                ],
                rows: const [
                  {'label': 'Companies Managed', 'value': _companiesManaged},
                  {'label': 'Openings Created', 'value': _openingsCreated},
                  {'label': 'Students Handled', 'value': _studentsHandled},
                ],
              ),

              const SizedBox(height: 28),


              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditCoordinatorProfilePage(),
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