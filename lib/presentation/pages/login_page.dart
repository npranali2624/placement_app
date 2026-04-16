import 'package:flutter/material.dart';
import '../widgets/section_title.dart';
import 'coordinator_dashboard_page.dart';
import 'student_dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController    = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  String? _validateLogin(String? value) {
    if (value == null || value.trim().isEmpty) return "Enter Email or Mobile Number";
    final emailRegex  = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final mobileRegex = RegExp(r'^[0-9]{10}$');
    if (!emailRegex.hasMatch(value.trim()) && !mobileRegex.hasMatch(value.trim())) {
      return "Enter valid Email or 10-digit Mobile Number";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Enter Password";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  void _navigateTo(Widget page) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
    }
  }

  Widget _loginField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            keyboardType: keyboardType,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: const Color(0xFFF5F7F6),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFF2ECC71),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.redAccent, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gradientButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1ABC9C), Color(0xFF2ECC71)],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlinedButton({
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7F6),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF3dba8c), width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF2a9d72),
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }

  Widget _roleBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF3dba8c).withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF3dba8c).withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3dba8c),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5EDE3),
      body: SafeArea(
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.work_outline_rounded,
                      color: Color(0xFF3dba8c),
                      size: 36,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Placement App",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2a9d72),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Your career journey starts here",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _roleBadge("Coordinator"),
                      const SizedBox(width: 10),
                      _roleBadge("Student"),
                    ],
                  ),
                ],
              ),
            ),

            // EXTRA LARGE CARD
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const SectionTitle(title: "Login Details"),

                                _loginField(
                                  label: "Email or Mobile",
                                  hint: "Enter email or 10-digit mobile",
                                  controller: _loginController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _validateLogin,
                                ),

                                _loginField(
                                  label: "Password",
                                  hint: "Enter your password",
                                  controller: _passwordController,
                                  obscureText: _obscurePassword,
                                  validator: _validatePassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      color: const Color(0xFF3dba8c),
                                      size: 20,
                                    ),
                                    onPressed: () => setState(
                                          () => _obscurePassword = !_obscurePassword,
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: Color(0xFF2a9d72),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),
                                const SectionTitle(title: "Login As"),
                                const SizedBox(height: 6),

                                _gradientButton(
                                  label: "Login as Coordinator",
                                  onTap: () => _navigateTo(const CoordinatorDashboardPage()),
                                ),

                                const SizedBox(height: 12),

                                _outlinedButton(
                                  label: "Login as Student",
                                  onTap: () => _navigateTo(const StudentDashboardPage()),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
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
}