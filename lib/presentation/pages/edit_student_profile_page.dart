import 'package:flutter/material.dart';
import '../widgets/company_field.dart';
import '../widgets/section_title.dart';
import '../widgets/primary_button.dart';

class EditStudentProfilePage extends StatefulWidget {
  const EditStudentProfilePage({super.key});

  @override
  State<EditStudentProfilePage> createState() =>
      _EditStudentProfilePageState();
}

class _EditStudentProfilePageState
    extends State<EditStudentProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5EDE3),

      body: SafeArea(
        child: Column(
          children: [

            // 🔹 APP BAR
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
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    // 🔹 PERSONAL INFO (NON-EDITABLE)
                    const SectionTitle(
                        title: "Personal Information"),

                    Opacity(
                      opacity: 0.7,
                      child: AbsorbPointer(
                        child: CompanyField(
                          label: "Full Name",
                          value: "Rahul Sharma",
                        ),
                      ),
                    ),

                    Opacity(
                      opacity: 0.7,
                      child: AbsorbPointer(
                        child: CompanyField(
                          label: "Email",
                          value: "rahul.sharma@email.com",
                        ),
                      ),
                    ),

                    Opacity(
                      opacity: 0.7,
                      child: AbsorbPointer(
                        child: CompanyField(
                          label: "Phone",
                          value: "+91 98765 43210",
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🔹 SKILLS
                    const SectionTitle(
                        title: "Technical Skills"),

                    const CompanyField(
                      label: "Skills",
                      value:
                      "Flutter, Dart, Python, Firebase",
                    ),

                    const SizedBox(height: 10),

                    // 🔹 QUALIFICATION
                    const SectionTitle(
                        title: "Qualification"),

                    const CompanyField(
                      label: "College Name",
                      value:
                      "MIT College of Engineering, Pune",
                    ),
                    const CompanyField(
                      label: "Course",
                      value: "B.E.",
                    ),
                    const CompanyField(
                      label: "Branch",
                      value: "Computer Engineering",
                    ),
                    const CompanyField(
                      label: "Year",
                      value: "3rd Year",
                    ),
                    const CompanyField(
                      label: "CGPA",
                      value: "8.5 / 10",
                    ),
                    const CompanyField(
                      label: "12th / Diploma %",
                      value: "85%",
                    ),
                    const CompanyField(
                      label: "Year of Passing",
                      value: "2025",
                    ),

                    const SizedBox(height: 10),

                    // 🔹 DOCUMENTS
                    const SectionTitle(title: "Documents"),

                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.upload_file),
                        label:
                        const Text("Upload Resume"),
                        style: OutlinedButton.styleFrom(
                          minimumSize:
                          const Size(double.infinity, 48),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.attach_file),
                        label:
                        const Text("Upload Documents"),
                        style: OutlinedButton.styleFrom(
                          minimumSize:
                          const Size(double.infinity, 48),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 SAVE BUTTON
                    const PrimaryButton(
                        text: "Save Changes"),

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
}