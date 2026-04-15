import 'package:flutter/material.dart';
import '../widgets/company_field.dart';
import '../widgets/section_title.dart';
import 'login_page.dart';

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
      backgroundColor: AppColors.background,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Companies"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Openings"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Applicants"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.textDark),
        title: const Text(
          "Register Company",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
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

              const CompanyField(label: "Company Name *", value: "Nexora Technologies Pvt. Ltd."),
              const CompanyField(label: "Company Strength *", value: "350 employees"),
              const CompanyField(label: "Official Company Email *", value: "hr@nexoratech.com"),

              const SizedBox(height: 10),
              const SectionTitle(title: "Primary Work Location"),

              const CompanyField(label: "City / Address *", value: "Pune, Maharashtra"),
              const CompanyField(label: "HR Contact Person *", value: "Priya Sharma"),
              const CompanyField(label: "Contact Number *", value: "+91 98765 43210"),
              const CompanyField(label: "Location Email", value: "pune.hr@nexoratech.com"),

              const SizedBox(height: 20),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppRadius.button),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: const Center(
                    child: Text(
                      "Register Company",
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