import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String type;
  final String location;
  final String time;
  final String salary;
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
    required this.iconColor,
    required this.logoLetter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 TOP ROW
          Row(
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.2),
                child: Text(
                  logoLetter,
                  style: TextStyle(color: iconColor),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      company,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // 🔹 DETAILS ROW (FIXED OVERFLOW)
          Row(
            children: [
              Expanded(
                child: Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Text(
                salary,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Text(
                type,
                style: const TextStyle(fontSize: 12),
              ),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}