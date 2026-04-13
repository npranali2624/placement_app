import 'package:flutter/material.dart';

class EditStudentProfilePage extends StatefulWidget {
  const EditStudentProfilePage({super.key});

  @override
  State<EditStudentProfilePage> createState() =>
      _EditStudentProfilePageState();
}

class _EditStudentProfilePageState extends State<EditStudentProfilePage> {


  final Color primaryColor = const Color(0xFF3A8A80);
  final Color lightGreen = const Color(0xFFAED3C6);


  final skillsController =
  TextEditingController(text: "Flutter, Dart, Python, Firebase");

  final collegeController =
  TextEditingController(text: "MIT College of Engineering, Pune");

  final courseController =
  TextEditingController(text: "B.E.");

  final branchController =
  TextEditingController(text: "Computer Engineering");

  final yearController =
  TextEditingController(text: "3rd Year");

  final cgpaController =
  TextEditingController(text: "8.5 / 10");

  final diplomaController =
  TextEditingController(text: "85%");

  final passingYearController =
  TextEditingController(text: "2025");


  Widget formCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.08)),
      ),
      child: Column(children: children),
    );
  }


  Widget textField(String label, TextEditingController controller,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: enabled ? Colors.white : Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }


  Widget uploadButton(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: lightGreen.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: primaryColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }


  Widget gradientButton() {
    return GestureDetector(
      onTap: () {


        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Changes saved successfully"),
            backgroundColor: primaryColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(seconds: 2),
          ),
        );


        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF1ABC9C),
              Color(0xFF2ECC71),
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
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: lightGreen.withOpacity(0.25),

      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: lightGreen,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [


            formCard([
              textField("Full Name",
                  TextEditingController(text: "Rahul Sharma"),
                  enabled: false),
              textField("Email",
                  TextEditingController(
                      text: "rahul.sharma@email.com"),
                  enabled: false),
              textField("Phone",
                  TextEditingController(text: "+91 98765 43210"),
                  enabled: false),
              textField("Technical Skills", skillsController),
              textField("College Name", collegeController),
              textField("Course", courseController),
              textField("Branch", branchController),
              textField("Year", yearController),
              textField("CGPA", cgpaController),
              textField("12th / Diploma %", diplomaController),
              textField("Passing Year", passingYearController),
            ]),

            const SizedBox(height: 16),


            formCard([
              uploadButton("Upload Updated Resume", Icons.upload_file),
              uploadButton("Upload Documents", Icons.attach_file),
            ]),

            const SizedBox(height: 20),


            gradientButton(),
          ],
        ),
      ),
    );
  }
}