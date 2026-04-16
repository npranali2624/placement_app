import 'package:flutter/material.dart';

class AddEditOpeningScreen extends StatefulWidget {
  final bool isEdit;
  const AddEditOpeningScreen({super.key, this.isEdit = true});

  @override
  State<AddEditOpeningScreen> createState() => _AddEditOpeningScreenState();
}

class _AddEditOpeningScreenState extends State<AddEditOpeningScreen>
    with SingleTickerProviderStateMixin {

  // ── Palette ──────────────────────────────────────────────
  static const Color primary     = Color(0xFF1ABC9C);
  static const Color primaryDark = Color(0xFF16A085);
  static const Color accent      = Color(0xFF2ECC71);
  static const Color bgPage      = Color(0xFFF4F7F6);
  static const Color cardBg      = Colors.white;
  static const Color textHead    = Color(0xFF1A2E2A);
  static const Color textSub     = Color(0xFF5A7A74);
  static const Color textMuted   = Color(0xFF9DB5B0);
  static const Color border      = Color(0xFFDDE8E5);
  static const Color chipBg      = Color(0xFFE8F8F4);

  static const Color gradBlue  = Color(0xFF4A90E2);
  static const Color gradGreen = Color(0xFF2ECC71);


  static const Color iconJobDetails     = Color(0xFF4A90E2); // Blue
  static const Color iconCompensation   = Color(0xFFE67E22); // Orange
  static const Color iconLocation       = Color(0xFFE74C3C); // Red
  static const Color iconResponsibility = Color(0xFF9B59B6); // Purple


  final _jobTitleCtrl        = TextEditingController(text: 'Backend Developer');
  final _vacanciesCtrl       = TextEditingController(text: '8');
  final _salaryMinCtrl       = TextEditingController(text: '5');
  final _salaryMaxCtrl       = TextEditingController(text: '8');
  final _termsCtrl           = TextEditingController(text: '1 year service bond');
  final _responsibilitiesCtrl = TextEditingController(
      text: 'Develop REST APIs, manage databases, perform code reviews');
  final _techReqCtrl         = TextEditingController(
      text: 'Node.js, PostgreSQL, Docker, REST, Git');
  final _timeConstraintCtrl  = TextEditingController(text: '30 days');


  String selectedOpeningType   = 'Placement';
  String selectedCompany       = 'Nexora Technologies';
  String selectedQualification = 'B.Tech / MCA / M.Sc';
  String selectedExperience    = 'Fresher';
  String selectedLocation      = 'Pune, Maharashtra';

  final openingTypes     = ['Placement', 'Internship', 'Hybrid'];
  final companies        = ['Nexora Technologies', 'ABC Corp', 'DEE Technologies'];
  final qualifications   = ['B.Tech / MCA / M.Sc', 'BCA / B.Sc', 'MBA', 'Any Graduate'];
  final experiences      = ['Fresher', '0–1 year', '1–3 years', '3+ years'];
  final locations        = ['Pune, Maharashtra', 'Mumbai, Maharashtra',
    'Bengaluru, Karnataka', 'Remote'];

  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _jobTitleCtrl.dispose();
    _vacanciesCtrl.dispose();
    _salaryMinCtrl.dispose();
    _salaryMaxCtrl.dispose();
    _termsCtrl.dispose();
    _responsibilitiesCtrl.dispose();
    _techReqCtrl.dispose();
    _timeConstraintCtrl.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPage,

      appBar: AppBar(
        backgroundColor: bgPage,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          widget.isEdit ? "Edit Opening" : "Add Opening",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: FadeTransition(
        opacity: _fadeAnim,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 110),
                child: Column(children: [


                  _companyHeaderCard(),

                  const SizedBox(height: 16),

                  _sectionCard(
                    icon: Icons.work_rounded,
                    iconColor: iconJobDetails,
                    iconBgColor: const Color(0xFFEAF3FC),
                    title: 'JOB DETAILS',
                    children: [
                      _field('Job Title', _jobTitleCtrl, required: true),
                      _dropdown('Company', selectedCompany, companies, required: true,
                          onChanged: (v) => setState(() => selectedCompany = v!)),
                      _openingTypeToggle(),
                      const SizedBox(height: 6),
                      _dropdown('Required Qualification', selectedQualification,
                          qualifications, required: true,
                          onChanged: (v) => setState(() => selectedQualification = v!)),
                      Row(children: [
                        Expanded(
                          child: _field('No. of Vacancies', _vacanciesCtrl,
                              required: true, keyboardType: TextInputType.number),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _dropdown('Experience', selectedExperience, experiences,
                              required: true,
                              onChanged: (v) => setState(() => selectedExperience = v!)),
                        ),
                      ]),
                    ],
                  ),

                  const SizedBox(height: 14),

                  _sectionCard(
                    icon: Icons.payments_rounded,
                    iconColor: iconCompensation,
                    iconBgColor: const Color(0xFFFDF0E6),
                    title: 'COMPENSATION',
                    children: [_salaryRange()],
                  ),

                  const SizedBox(height: 14),

                  _sectionCard(
                    icon: Icons.location_on_rounded,
                    iconColor: iconLocation,
                    iconBgColor: const Color(0xFFFDECEB),
                    title: 'LOCATION & SCOPE',
                    children: [
                      _dropdown('Work Location', selectedLocation, locations, required: true,
                          onChanged: (v) => setState(() => selectedLocation = v!)),
                      _field('Terms / Bond', _termsCtrl, hint: 'e.g. 1 year service bond'),
                      _field('Time Constraint', _timeConstraintCtrl, hint: 'e.g. 30 days'),
                    ],
                  ),

                  const SizedBox(height: 14),

                  _sectionCard(
                    icon: Icons.list_alt_rounded,
                    iconColor: iconResponsibility,
                    iconBgColor: const Color(0xFFF5EEF8),
                    title: 'RESPONSIBILITIES & REQUIREMENTS',
                    children: [
                      _textArea('Responsibilities', _responsibilitiesCtrl, required: true),
                      const SizedBox(height: 10),
                      _textArea('Technical / Professional Requirements', _techReqCtrl),
                    ],
                  ),

                  const SizedBox(height: 24),

                  _saveButton(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _companyHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [gradBlue, gradGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: gradBlue.withOpacity(0.30),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.work_rounded, color: gradBlue),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedCompany,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                widget.isEdit ? "Edit job opening details" : "Add a new job opening",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
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
              offset: const Offset(0, 5)),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: iconBgColor, borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: iconColor, size: 15),
            ),
            const SizedBox(width: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: primaryDark,
                    letterSpacing: 0.8)),
          ]),
        ),
        Divider(height: 1, color: border),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: children),
        ),
      ]),
    );
  }

  Widget _label(String text, {bool required = false}) => Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(children: [
      Text(text,
          style: const TextStyle(
              fontSize: 11, fontWeight: FontWeight.w700, color: textSub)),
      if (required)
        const Text(' *', style: TextStyle(color: Colors.red, fontSize: 12)),
    ]),
  );

  InputDecoration _inputDeco({String? hint}) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: textMuted, fontSize: 12),
    filled: true,
    fillColor: bgPage,
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: border)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: primary, width: 1.6)),
  );

  Widget _field(String label, TextEditingController ctrl,
      {bool required = false,
        String? hint,
        TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _label(label, required: required),
        TextField(
          controller: ctrl,
          keyboardType: keyboardType,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w600, color: textHead),
          decoration: _inputDeco(hint: hint),
        ),
      ]),
    );
  }

  Widget _dropdown(String label, String value, List<String> items,
      {bool required = false, required ValueChanged<String?> onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _label(label, required: required),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w600, color: textHead),
          decoration: _inputDeco(),
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: primaryDark, size: 20),
          dropdownColor: Colors.white,
        ),
      ]),
    );
  }


  Widget _openingTypeToggle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _label('Opening Type', required: true),
      const SizedBox(height: 4),
      Row(
        children: openingTypes.map((type) {
          final sel = type == selectedOpeningType;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedOpeningType = type),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 8, bottom: 12),
                padding: const EdgeInsets.symmetric(vertical: 11),
                decoration: BoxDecoration(
                  gradient: sel
                      ? const LinearGradient(
                    colors: [gradBlue, gradGreen],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                      : null,
                  color: sel ? null : cardBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: sel ? Colors.transparent : border),
                  boxShadow: sel
                      ? [
                    BoxShadow(
                        color: gradBlue.withOpacity(0.30),
                        blurRadius: 8,
                        offset: const Offset(0, 3))
                  ]
                      : [],
                ),
                child: Center(
                  child: Text(type,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: sel ? Colors.white : textSub)),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }

  Widget _salaryRange() {
    final isSalary = selectedOpeningType != 'Internship';
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _label(isSalary ? 'Salary Range (LPA)' : 'Stipend Range (₹/month)',
          required: true),
      Row(children: [
        Expanded(child: _miniField(_salaryMinCtrl, isSalary ? 'Min LPA' : 'Min ₹')),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('to',
              style: const TextStyle(
                  color: textMuted, fontWeight: FontWeight.w700, fontSize: 13)),
        ),
        Expanded(child: _miniField(_salaryMaxCtrl, isSalary ? 'Max LPA' : 'Max ₹')),
      ]),
    ]);
  }

  Widget _miniField(TextEditingController ctrl, String hint) => TextField(
    controller: ctrl,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    style: const TextStyle(
        fontSize: 13, fontWeight: FontWeight.w700, color: textHead),
    decoration: _inputDeco(hint: hint),
  );

  Widget _textArea(String label, TextEditingController ctrl,
      {bool required = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _label(label, required: required),
      TextField(
        controller: ctrl,
        maxLines: 3,
        style: const TextStyle(
            fontSize: 12.5, fontWeight: FontWeight.w500, color: textHead),
        decoration: _inputDeco(),
      ),
    ]);
  }

  // ── Save Button (Blue → Green gradient) ──────────────────
  Widget _saveButton() {
    return Container(
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
              offset: const Offset(0, 5)),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.check_circle_rounded,
            color: Colors.white, size: 18),
        label: const Text('SAVE OPENING',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 13,
                letterSpacing: 1.1)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}