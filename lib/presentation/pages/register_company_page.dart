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


  static const Color primary     = Color(0xFF1ABC9C);
  static const Color primaryDark = Color(0xFF16A085);
  static const Color bgPage      = Color(0xFFF4F7F6);
  static const Color cardBg      = Colors.white;
  static const Color border      = Color(0xFFDDE8E5);
  static const Color chipBg      = Color(0xFFE8F8F4);


  static const Color gradBlue  = Color(0xFF4A90E2);
  static const Color gradGreen = Color(0xFF2ECC71);


  static const Color iconBasicInfo = Color(0xFF4A90E2); // Blue
  static const Color iconLocation  = Color(0xFFE74C3C); // Red

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPage,

      appBar: AppBar(
        backgroundColor: bgPage,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Register Company",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [


              _sectionCard(
                icon: Icons.business,
                iconColor: iconBasicInfo,
                iconBgColor: const Color(0xFFEAF3FC),
                title: "BASIC INFORMATION",
                children: const [
                  CompanyField(label: "Company Name *", value: "Nexora Technologies Pvt. Ltd."),
                  CompanyField(label: "Company Strength *", value: "350 employees"),
                  CompanyField(label: "Official Company Email *", value: "hr@nexoratech.com"),
                ],
              ),

              const SizedBox(height: 14),


              _sectionCard(
                icon: Icons.location_on,
                iconColor: iconLocation,
                iconBgColor: const Color(0xFFFDECEB),
                title: "PRIMARY WORK LOCATION",
                children: const [
                  CompanyField(label: "City / Address *", value: "Pune, Maharashtra"),
                  CompanyField(label: "HR Contact Person *", value: "Priya Sharma"),
                  CompanyField(label: "Contact Number *", value: "+91 98765 43210"),
                  CompanyField(label: "Location Email", value: "pune.hr@nexoratech.com"),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [gradBlue, gradGreen],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: gradBlue.withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_rounded,
                      color: Colors.white, size: 18),
                  label: const Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      letterSpacing: 1.1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _sectionCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
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
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor, size: 15),
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