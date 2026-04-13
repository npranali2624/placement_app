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
  bool focused = false;

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

          Focus(
            onFocusChange: (v) {
              setState(() => focused = v);
            },
            child: TextFormField(
              initialValue: widget.value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),

              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF0F0F0),

                // ✅ LIGHT GREEN BORDER (DEFAULT)
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFAED3C6), // light green
                  ),
                ),

                // ✅ DARK GREEN ON FOCUS
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFAED3C6),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}