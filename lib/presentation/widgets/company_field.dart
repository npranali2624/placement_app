import 'package:flutter/material.dart';

class CompanyField extends StatefulWidget {
  final String label;
  final String value;

  const CompanyField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  State<CompanyField> createState() => _CompanyFieldState();
}

class _CompanyFieldState extends State<CompanyField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // LABEL with red *
          RichText(
            text: TextSpan(
              text: widget.label.replaceAll('*', ''),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
              children: widget.label.contains('*')
                  ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                )
              ]
                  : [],
            ),
          ),

          const SizedBox(height: 4),

          TextFormField(
            initialValue: widget.value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),

            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5F7F6), // SAME AS LOGIN

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
            ),
          ),
        ],
      ),
    );
  }
}