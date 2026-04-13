import 'package:flutter/material.dart';
import '../widgets/company_field.dart';
import '../widgets/section_title.dart';
import '../widgets/primary_button.dart';

class RegisterCompanyPage extends StatefulWidget {
  const RegisterCompanyPage({super.key});

  @override
  State<RegisterCompanyPage> createState() => _RegisterCompanyPageState();
}

class _RegisterCompanyPageState extends State<RegisterCompanyPage> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5EDE3),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2ECC71),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Companies"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Openings"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Applicants"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [

            // APP BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              color: const Color(0xFFD5EDE3),
              child: Stack(
                alignment: Alignment.center,
                children: [

                  const Center(
                    child: Text(
                      "Register Company",
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
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ✅ FIXED: ONLY * RED
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "Fields marked "),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "  are required"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    const SectionTitle(title: "Basic Information"),

                    const CompanyField(
                      label: "Company Name *",
                      value: "Nexora Technologies Pvt. Ltd.",
                    ),
                    const CompanyField(
                      label: "Company Strength *",
                      value: "350 employees",
                    ),
                    const CompanyField(
                      label: "Official Company Email *",
                      value: "hr@nexoratech.com",
                    ),

                    const SizedBox(height: 10),

                    const SectionTitle(title: "Primary Work Location"),

                    const CompanyField(
                      label: "City / Address *",
                      value: "Pune, Maharashtra",
                    ),
                    const CompanyField(
                      label: "HR Contact Person *",
                      value: "Priya Sharma",
                    ),
                    const CompanyField(
                      label: "Contact Number *",
                      value: "+91 98765 43210",
                    ),
                    const CompanyField(
                      label: "Location Email",
                      value: "pune.hr@nexoratech.com",
                    ),

                    const SizedBox(height: 20),

                    const PrimaryButton(text: "Register Company"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}