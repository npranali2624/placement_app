import 'package:flutter/material.dart';

class AddWorkLocationPage extends StatefulWidget {
  final String companyName;
  const AddWorkLocationPage({
    super.key,
    this.companyName = 'Nexora Technologies',
  });

  @override
  State<AddWorkLocationPage> createState() => _AddWorkLocationPageState();
}

class _AddWorkLocationPageState extends State<AddWorkLocationPage> {


  static const Color bgPage = Color(0xFFD5EDE3);
  static const Color primary = Color(0xFF26A69A);
  static const Color accent = Color(0xFF2ECC71);
  static const Color blue = Color(0xFF4A90E2);
  static const Color cardBg = Colors.white;

  final List<Map<String, TextEditingController>> _locations = [];

  String selectedCompany = 'Nexora Technologies';
  final List<String> companies = [
    'Nexora Technologies',
    'ABC Corp',
    'DEE Technologies',
  ];

  @override
  void initState() {
    super.initState();
    _addLocation();
  }

  void _addLocation() {
    setState(() {
      _locations.add({
        'address': TextEditingController(),
        'contactpersonname': TextEditingController(),
        'contactNumber': TextEditingController(),
        'mail': TextEditingController(),
      });
    });
  }

  void _removeLocation(int index) {
    if (_locations.length == 1) return;
    setState(() {
      _locations.removeAt(index);
    });
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
        title: const Text(
          "Add Work Location",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [


            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [blue, accent],
                ),
                borderRadius: BorderRadius.circular(18),
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
                    child: const Icon(Icons.location_on, color: primary),
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
                      const Text(
                        "Add multiple work locations",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            _card(
              child: _dropdown(
                "Company",
                selectedCompany,
                companies,
                    (val) => setState(() => selectedCompany = val!),
              ),
            ),

            const SizedBox(height: 20),

            ..._locations.asMap().entries.map((entry) {
              return _locationCard(entry.key, entry.value);
            }),

            const SizedBox(height: 12),

            GestureDetector(
              onTap: _addLocation,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    "Add Another Location",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),


            GestureDetector(
              onTap: _onSave,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [blue, accent],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    "SAVE LOCATIONS",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

  Widget _locationCard(
      int index, Map<String, TextEditingController> loc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Location ${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => _removeLocation(index),
                icon: const Icon(Icons.delete, color: Colors.red),
              )
            ],
          ),

          _field("Address", loc['address']!),
          _field("Contact Person", loc['contactpersonname']!),
          _field("Phone", loc['contactNumber']!),
          _field("Email", loc['mail']!),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

  Widget _field(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: ctrl,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5F7F6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: accent,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdown(String label, String value, List<String> items,
      Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Company",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F7F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: accent,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
  void _onSave() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Locations Saved")),
    );
  }
}