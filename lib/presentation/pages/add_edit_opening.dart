import 'package:flutter/material.dart';

class AddEditOpeningScreen extends StatefulWidget {
  const AddEditOpeningScreen({super.key});

  @override
  State<AddEditOpeningScreen> createState() => _AddEditOpeningScreenState();
}

class _AddEditOpeningScreenState extends State<AddEditOpeningScreen> {
  // ✅ UNIFIED: Colors matched to AppColors dashboard theme
  static const Color green         = Color(0xFF1ABC9C);
  static const Color greenDark     = Color(0xFF16A085);
  static const Color greenLight    = Color(0xFFE8F8F5);
  static const Color greenMid      = Color(0xFFB2DFDB);
  static const Color textPrimary   = Color(0xFF2C3E50);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textMuted     = Color(0xFFB0BEC5);
  static const Color borderColor   = Color(0xFFDDE2E8);
  static const Color borderLight   = Color(0xFFECF0F1);
  static const Color bgPage        = Color(0xFFF8FAFB);

  String selectedOpeningType = 'Placement';
  final List<String> openingTypes = ['Placement', 'Internship', 'Hybrid'];

  final _jobTitleController = TextEditingController(text: 'Backend Developer');
  final _vacanciesController = TextEditingController(text: '8');
  final _salaryMinController = TextEditingController(text: '5 LPA');
  final _salaryMaxController = TextEditingController(text: '8 LPA');
  final _termsController = TextEditingController();
  final _responsibilitiesController = TextEditingController(
    text: 'Develop REST APIs, manage databases, code reviews',
  );

  String selectedCompany = 'Nexora Technologies';
  String selectedQualification = 'B.Tech / MCA / M.Sc';
  String selectedExperience = 'Fresher';
  String selectedLocation = 'Pune, Maharashtra';

  @override
  void dispose() {
    _jobTitleController.dispose();
    _vacanciesController.dispose();
    _salaryMinController.dispose();
    _salaryMaxController.dispose();
    _termsController.dispose();
    _responsibilitiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPage,
      body: Column(
        children: [
          _buildHeaderWithGradient(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              child: Column(
                children: [
                  _buildFormCard(
                    title: 'Job Details',
                    icon: Icons.work_rounded,
                    children: [
                      _buildTextField(label: 'Job Title', controller: _jobTitleController, required: true, focused: true),
                      _buildDropdownField(label: 'Company', value: selectedCompany, required: true, onTap: () {}),
                      _buildOpeningTypeField(),
                      const SizedBox(height: 10),
                      _buildDropdownField(label: 'Required Qualification', value: selectedQualification, required: true, onTap: () {}),
                      Row(
                        children: [
                          Expanded(child: _buildTextField(label: 'Vacancies', controller: _vacanciesController, required: true, keyboardType: TextInputType.number)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildDropdownField(label: 'Experience', value: selectedExperience, required: true, onTap: () {})),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildFormCard(
                    title: 'Compensation',
                    icon: Icons.payments_rounded,
                    children: [
                      _buildSalaryRangeField(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildFormCard(
                    title: 'Location & Responsibilities',
                    icon: Icons.map_rounded,
                    children: [
                      _buildDropdownField(label: 'Work Location', value: selectedLocation, required: true, onTap: () {}),
                      _buildTextField(label: 'Terms / Bond', controller: _termsController, hint: 'e.g. 1 year service bond'),
                      _buildTextAreaField(label: 'Responsibilities', controller: _responsibilitiesController),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildGradientSaveButton(),
                ],
              ),
            ),
          ),
          _buildBottomNav(),
        ],
      ),
    );
  }

  // --- NEW ATTRACTIVE COMPONENTS ---

  Widget _buildHeaderWithGradient() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [green, greenDark],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 25,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                ),
              ),
              const Text(
                'Edit Opening',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Nexora Technologies Pvt. Ltd.',
            style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildFormCard({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Icon(icon, color: green, size: 18),
                const SizedBox(width: 8),
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: greenDark, letterSpacing: 0.5),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: borderLight),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientSaveButton() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [green, greenDark]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: green.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text(
          'SAVE OPENING',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14, letterSpacing: 1),
        ),
      ),
    );
  }

  // --- REFINED EXISTING COMPONENTS ---

  Widget _buildFieldLabel(String label, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: textSecondary)),
          if (required) const Text(' *', style: TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required TextEditingController controller, bool required = false, bool focused = false, String? hint, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldLabel(label, required: required),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textPrimary),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: bgPage,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: borderColor)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: green, width: 1.5)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({required String label, required String value, bool required = false, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFieldLabel(label, required: required),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: bgPage,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textPrimary)),
                  const Icon(Icons.arrow_drop_down, color: greenDark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpeningTypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Opening Type', required: true),
        const SizedBox(height: 4),
        Row(
          children: openingTypes.map((type) {
            final isSelected = type == selectedOpeningType;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedOpeningType = type),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: isSelected ? const LinearGradient(colors: [green, greenDark]) : null,
                    color: isSelected ? null : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: isSelected ? Colors.transparent : borderColor),
                  ),
                  child: Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSalaryRangeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Salary Range (LPA)', required: true),
        Row(
          children: [
            Expanded(child: _buildTextFieldOnly(_salaryMinController)),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('to', style: TextStyle(color: textMuted, fontWeight: FontWeight.bold))),
            Expanded(child: _buildTextFieldOnly(_salaryMaxController)),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldOnly(TextEditingController controller) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        filled: true,
        fillColor: bgPage,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: green)),
      ),
    );
  }

  Widget _buildTextAreaField({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label),
        TextField(
          controller: controller,
          maxLines: 3,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            filled: true,
            fillColor: bgPage,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: borderColor)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: green)),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.grid_view_rounded, color: textMuted),
          Icon(Icons.home_work_rounded, color: green),
          Icon(Icons.work_outline, color: textMuted),
          Icon(Icons.person_outline, color: textMuted),
        ],
      ),
    );
  }
}