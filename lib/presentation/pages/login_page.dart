import 'package:flutter/material.dart';
import 'coordinator_dashboard_page.dart';
import 'student_dashboard_page.dart';

class AppColors {
  static const Color primary    = Color(0xFF55A3A7);
  static const Color secondary  = Color(0xFF4A83B0);
  static const Color accent     = Color(0xFFE9C966);
  static const Color amber      = Color(0xFFECB93C);
  static const Color sage       = Color(0xFF91BA90);
  static const Color background = Color(0xFFD5EDE3);
  static const Color sageHeader = Color(0xFFAED3C6);

  // ✅ UNIFIED: text & surface colors used across all pages
  static const Color textDark      = Color(0xFF1A4A44);
  static const Color textMuted     = Color(0xFF6B8F85);
  static const Color fieldFill     = Color(0xFFEAF6F3);
  static const Color fieldBorder   = Color(0xFFCCE8DE);
  static const Color divider       = Color(0xFFE0EEEA);
  static const Color cardBorder    = Color(0xFFCCE8DE);
}

// ✅ UNIFIED: border radii used everywhere
class AppRadius {
  static const double field  = 12.0;
  static const double button = 14.0;
  static const double card   = 16.0;
  static const double logo   = 20.0;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginController    = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

  String? validateLogin(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Email or Mobile Number";
    }
    final emailRegex  = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final mobileRegex = RegExp(r'^[0-9]{10}$');
    if (!emailRegex.hasMatch(value.trim()) && !mobileRegex.hasMatch(value.trim())) {
      return "Enter valid Email or 10-digit Mobile Number";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Enter Password";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  // ✅ UNIFIED: shared input decoration matching all pages
  InputDecoration _fieldDecoration({
    required String hint,
    required IconData prefixIcon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
      prefixIcon: Icon(prefixIcon, color: AppColors.primary, size: 20),
      suffixIcon: suffix,
      filled: true,
      fillColor: AppColors.fieldFill,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.field),
        borderSide: const BorderSide(color: AppColors.fieldBorder, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.field),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.field),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.field),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }

  void _navigateTo(Widget page) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sageHeader,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top section: sage bg with logo + title ──
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 36, 20, 28),
              child: Column(
                children: [
                  // Logo box — ✅ uses AppRadius.logo
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.45),
                      borderRadius: BorderRadius.circular(AppRadius.logo),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.work_outline_rounded,
                      color: AppColors.primary,
                      size: 34,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    "Placement App",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Your career journey starts here",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textDark.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Role badges
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _roleBadge("Coordinator", AppColors.primary),
                      const SizedBox(width: 8),
                      _roleBadge("Student", AppColors.secondary),
                    ],
                  ),
                ],
              ),
            ),

            // ── Bottom white card — ✅ uses AppRadius.card ──
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppRadius.card + 8),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _sectionLabel("Email or Mobile"),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: loginController,
                          validator: validateLogin,
                          keyboardType: TextInputType.emailAddress,
                          decoration: _fieldDecoration(
                            hint: "Enter email or mobile number",
                            prefixIcon: Icons.mail_outline_rounded,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _sectionLabel("Password"),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: passwordController,
                          validator: validatePassword,
                          obscureText: obscurePassword,
                          decoration: _fieldDecoration(
                            hint: "Enter your password",
                            prefixIcon: Icons.lock_outline_rounded,
                            suffix: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppColors.primary,
                                size: 20,
                              ),
                              onPressed: () =>
                                  setState(() => obscurePassword = !obscurePassword),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // ✅ UNIFIED: divider color
                        Row(
                          children: [
                            const Expanded(child: Divider(color: AppColors.divider)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "login as",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Expanded(child: Divider(color: AppColors.divider)),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // ✅ UNIFIED: uses _loginButton with InkWell
                        _loginButton(
                          label: "Login as Coordinator",
                          color: AppColors.primary,
                          onTap: () => _navigateTo(const CoordinatorDashboardPage()),
                        ),
                        const SizedBox(height: 10),
                        _loginButton(
                          label: "Login as Student",
                          color: AppColors.secondary,
                          onTap: () => _navigateTo(const StudentDashboardPage()),
                        ),
                        const SizedBox(height: 16),

                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _dot(AppColors.primary),
                            const SizedBox(width: 6),
                            _dot(AppColors.sageHeader),
                            const SizedBox(width: 6),
                            _dot(AppColors.secondary.withOpacity(0.5)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ UNIFIED: section label style (matches edit profile)
  Widget _sectionLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0.8,
      ),
    );
  }

  Widget _roleBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color.withOpacity(0.85),
        ),
      ),
    );
  }

  // ✅ UNIFIED: uses InkWell for tap feedback, AppRadius.button
  Widget _loginButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.button),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppRadius.button),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}