import 'package:flutter/material.dart';
import '../widgets/company_field.dart';
import '../widgets/section_title.dart';

class EditCoordinatorProfilePage extends StatefulWidget {
  const EditCoordinatorProfilePage({super.key});

  @override
  State<EditCoordinatorProfilePage> createState() =>
      _EditCoordinatorProfilePageState();
}

class _EditCoordinatorProfilePageState
    extends State<EditCoordinatorProfilePage> {

  static const Color primary     = Color(0xFF1ABC9C);
  static const Color primaryDark = Color(0xFF16A085);
  static const Color cardBg      = Colors.white;
  static const Color border      = Color(0xFFDDE8E5);
  static const Color chipBg      = Color(0xFFE8F8F4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5EDE3),

      body: SafeArea(
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              color: const Color(0xFFD5EDE3),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    // ❌ FULL PERSONAL INFO NON-EDITABLE
                    _sectionCard(
                      icon: Icons.person,
                      title: "Personal Information",
                      children: [
                        Opacity(
                          opacity: 0.7,
                          child: AbsorbPointer(
                            child: Column(
                              children: [
                                CompanyField(
                                  label: "Full Name",
                                  value: "Priya Deshmukh",
                                ),
                                CompanyField(
                                  label: "Email",
                                  value: "coordinator@email.com",
                                ),
                                CompanyField(
                                  label: "Phone",
                                  value: "+91 98765 12345",
                                ),
                                CompanyField(
                                  label: "Gender",
                                  value: "Female",
                                ),
                                CompanyField(
                                  label: "Date of Birth",
                                  value: "10 Jan 1995",
                                ),
                                CompanyField(
                                  label: "Address",
                                  value: "Pune, Maharashtra",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ✅ EDITABLE
                    _sectionCard(
                      icon: Icons.work,
                      title: "Professional Details",
                      children: [
                        CompanyField(
                          label: "Role",
                          value: "Placement Coordinator",
                        ),
                        CompanyField(
                          label: "Department",
                          value: "Training & Placement Cell",
                        ),
                        CompanyField(
                          label: "Organization",
                          value: "MIT College of Engineering",
                        ),
                        const CompanyField(
                          label: "Experience",
                          value: "5 Years",
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ✅ EDITABLE
                    _sectionCard(
                      icon: Icons.bar_chart,
                      title: "Work Summary",
                      children: [
                        CompanyField(
                          label: "Companies Managed",
                          value: "28",
                        ),
                        CompanyField(
                          label: "Openings Created",
                          value: "54",
                        ),
                        CompanyField(
                          label: "Students Handled",
                          value: "196",
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ✅ EDITABLE
                    _sectionCard(
                      icon: Icons.attach_file,
                      title: "Documents",
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.upload_file),
                            label: const Text("Upload Profile Photo"),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 48),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.attach_file),
                            label: const Text("Upload ID / Authorization Letter"),
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 48),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4CB8C4),
                              Color(0xFF3CD3AD),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Text(
                            "Save Changes",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: primary.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: chipBg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: primary, size: 15),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: primaryDark,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: border),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}