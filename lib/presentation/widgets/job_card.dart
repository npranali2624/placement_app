import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String type;
  final String location;
  final String time;
  final String salary;
  final Color bgColor;
  final Color iconColor;
  final String logoLetter;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.type,
    required this.location,
    required this.time,
    required this.salary,
    required this.bgColor,
    required this.iconColor,
    required this.logoLetter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5F6E6B).withOpacity(0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 🔹 Company Logo
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    logoLetter,
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF5F6E6B),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      company,
                      style: const TextStyle(
                        color: Color(0xFFB8CCCA),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.chevron_right, size: 20, color: Color(0xFFB8CCCA)),
            ],
          ),

          const SizedBox(height: 10),

          Divider(height: 1, color: const Color(0xFFEAEFE9)),

          const SizedBox(height: 10),

          // 🔹 Meta Details
          Row(
            children: [
              _MetaChip(icon: Icons.work_outline, label: type),
              const SizedBox(width: 14),
              _MetaChip(icon: Icons.location_on_outlined, label: location),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                salary,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF55A3A7),
                ),
              ),
              Text(
                "Posted $time",
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFFB8CCCA),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: const Color(0xFFB8CCCA)),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF5F6E6B)),
        ),
      ],
    );
  }
}