import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────
//  COMPANY DETAILS SCREEN
//  Fields sourced from architecture: companyName, companyStrength,
//  companyLocation (address, contactPersonName, contactNumber, mail),
//  workLocation[] (address, contactPersonName, contactNumber, mail),
//  companyMail
// ─────────────────────────────────────────────────────────────

class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key});

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen>
    with SingleTickerProviderStateMixin {
  // ── Palette ──────────────────────────────────────────────
  static const Color primary     = Color(0xFF1ABC9C);
  static const Color primaryDark = Color(0xFF16A085);
  static const Color amber       = Color(0xFFF39C12);
  static const Color amberLight  = Color(0xFFFFF3E0);
  static const Color bgPage      = Color(0xFFF4F7F6);
  static const Color cardBg      = Colors.white;
  static const Color textHead    = Color(0xFF1A2E2A);
  static const Color textSub     = Color(0xFF5A7A74);
  static const Color textMuted   = Color(0xFF9DB5B0);
  static const Color border      = Color(0xFFDDE8E5);
  static const Color chipBg      = Color(0xFFE8F8F4);

  // ── Mock Data (from architecture JSON) ───────────────────
  final Map<String, dynamic> company = {
    'companyName': 'ABC Company',
    'companyStrength': 180,
    'companyMail': 'info@abccompany.com',
    'companyLocation': {
      'address': '4th Floor, Baner Road, Pune – 411045',
      'contactPersonName': 'Rajesh Mehta',
      'contactNumber': '+91 98765 43210',
      'mail': 'rajesh@abccompany.com',
    },
    'workLocation': [
      {
        'address': 'Andheri East, Mumbai – 400069',
        'contactPersonName': 'Priya Sharma',
        'contactNumber': '+91 98001 12345',
        'mail': 'priya.mumbai@abccompany.com',
      },
      {
        'address': 'Koramangala, Bengaluru – 560034',
        'contactPersonName': 'Karan Joshi',
        'contactNumber': '+91 97700 54321',
        'mail': 'karan.blr@abccompany.com',
      },
      {
        'address': 'Sector 44, Gurugram – 122003',
        'contactPersonName': 'Neha Singh',
        'contactNumber': '+91 99110 67890',
        'mail': 'neha.gurugram@abccompany.com',
      },
    ],
  };

  final List<Map<String, dynamic>> openings = [
    {
      'title': 'Software Engineer',
      'type': 'Full Time',
      'salary': '4–6 LPA',
      'applicants': 28,
      'posted': '3 days ago',
      'active': true,
    },
    {
      'title': 'Flutter Developer',
      'type': 'Freelance',
      'salary': '3–5 LPA',
      'applicants': 13,
      'posted': '1 week ago',
      'active': true,
    },
  ];

  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  int _selectedTab = 0; // 0 = Shortlisted, 1 = Interviewed

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  // ── BUILD ─────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPage,
      body: FadeTransition(
        opacity: _fadeAnim,
        child: Column(children: [
          _header(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              child: Column(children: [
                _companyInfoCard(),
                const SizedBox(height: 14),
                _workLocationsCard(),
                const SizedBox(height: 14),
                _openingsSection(),
                const SizedBox(height: 14),
                _contactCard(),
              ]),
            ),
          ),
          // _bottomNav(),
        ]),
      ),
    );
  }

  // ── HEADER ────────────────────────────────────────────────
  Widget _header() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        bottom: 24,
        left: 20,
        right: 20,
      ),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _circleBtn(Icons.arrow_back_ios_new_rounded,
                  () => Navigator.of(context).maybePop()),
          const Text('Company Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          _circleBtn(Icons.more_vert_rounded, () {}),
        ]),
        const SizedBox(height: 20),
        // Avatar + name
        Row(children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 4))
              ],
            ),
            child: const Center(
              child: Text('A',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: primaryDark)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(company['companyName'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Row(children: [
                const Icon(Icons.email_outlined,
                    color: Colors.white60, size: 12),
                const SizedBox(width: 4),
                Text(company['companyMail'],
                    style: const TextStyle(color: Colors.white60, fontSize: 11)),
              ]),
            ]),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${company['companyStrength']} Staff',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ]),
      ]),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18), shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 17),
    ),
  );

  // ── COMPANY INFO CARD ─────────────────────────────────────
  Widget _companyInfoCard() {
    final loc = company['companyLocation'] as Map<String, dynamic>;
    return _sectionCard(
      icon: Icons.corporate_fare_rounded,
      title: 'COMPANY INFORMATION',
      child: Column(children: [
        _infoRow(Icons.location_on_rounded, 'Head Office', loc['address']),
        const Divider(height: 16, color: border),
        _infoRow(Icons.person_rounded, 'Contact Person', loc['contactPersonName']),
        const Divider(height: 16, color: border),
        _infoRow(Icons.phone_rounded, 'Phone', loc['contactNumber']),
        const Divider(height: 16, color: border),
        _infoRow(Icons.email_rounded, 'Email', loc['mail']),
      ]),
    );
  }

  // ── WORK LOCATIONS CARD ───────────────────────────────────
  Widget _workLocationsCard() {
    final locs = company['workLocation'] as List;
    return _sectionCard(
      icon: Icons.map_rounded,
      title: 'WORK LOCATIONS (${locs.length})',
      child: Column(
        children: locs.asMap().entries.map((entry) {
          final i = entry.key;
          final loc = entry.value as Map<String, dynamic>;
          return Column(children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgPage,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: border),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: chipBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text('Location ${i + 1}',
                            style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: primaryDark)),
                      ),
                    ]),
                    const SizedBox(height: 8),
                    _miniInfoRow(Icons.location_on_outlined, loc['address']),
                    const SizedBox(height: 4),
                    _miniInfoRow(Icons.person_outline_rounded, loc['contactPersonName']),
                    const SizedBox(height: 4),
                    _miniInfoRow(Icons.phone_outlined, loc['contactNumber']),
                    const SizedBox(height: 4),
                    _miniInfoRow(Icons.mail_outline_rounded, loc['mail']),
                  ]),
            ),
            if (i < locs.length - 1) const SizedBox(height: 10),
          ]);
        }).toList(),
      ),
    );
  }

  // ── OPENINGS SECTION ─────────────────────────────────────
  Widget _openingsSection() {
    return _sectionCard(
      icon: Icons.work_outline_rounded,
      title: 'PROJECTS HIRING',
      child: Column(
        children: openings.map((op) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgPage,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: border),
            ),
            child: Row(children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: chipBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.code_rounded, color: primary, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(op['title'],
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: textHead)),
                      const SizedBox(height: 3),
                      Row(children: [
                        _chip(op['type']),
                        const SizedBox(width: 6),
                        Text(op['salary'],
                            style: const TextStyle(
                                fontSize: 10,
                                color: primaryDark,
                                fontWeight: FontWeight.w700)),
                      ]),
                      const SizedBox(height: 3),
                      Text('${op['applicants']} applicants · ${op['posted']}',
                          style: const TextStyle(
                              fontSize: 10, color: textMuted)),
                    ]),
              ),
              const Icon(Icons.chevron_right_rounded, color: textMuted),
            ]),
          );
        }).toList(),
      ),
    );
  }

  // ── CONTACT CARD + EDIT ───────────────────────────────────
  Widget _contactCard() {
    return Column(children: [
      _sectionCard(
        icon: Icons.contact_mail_rounded,
        title: 'CONTACT',
        child: Column(children: [
          _infoRow(Icons.mail_rounded, 'Company Mail', company['companyMail']),
          const SizedBox(height: 8),
          _infoRow(Icons.phone_rounded, 'Phone',
              (company['companyLocation']
              as Map<String, dynamic>)['contactNumber']),
        ]),
      ),
      const SizedBox(height: 14),
      // Edit Details Button (amber – matches UI mockup)
      Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFF39C12), Color(0xFFE67E22)]),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: amber.withOpacity(0.30),
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit_rounded, color: Colors.white, size: 17),
          label: const Text('EDIT DETAILS',
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
      ),
    ]);
  }

  // ── SHARED WIDGETS ────────────────────────────────────────
  Widget _sectionCard(
      {required IconData icon,
        required String title,
        required Widget child}) {
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
                  color: chipBg,
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: primary, size: 15),
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
          child: child,
        ),
      ]),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: chipBg, borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: primary, size: 14),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style: const TextStyle(fontSize: 10, color: textMuted)),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: textHead)),
        ]),
      ),
    ]);
  }

  Widget _miniInfoRow(IconData icon, String value) {
    return Row(children: [
      Icon(icon, color: textMuted, size: 12),
      const SizedBox(width: 6),
      Expanded(
        child: Text(value,
            style: const TextStyle(fontSize: 11, color: textSub),
            overflow: TextOverflow.ellipsis),
      ),
    ]);
  }

  Widget _chip(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      color: chipBg,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(label,
        style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: primaryDark)),
  );

  // ── BOTTOM NAV ────────────────────────────────────────────
  // Widget _bottomNav() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //             color: Colors.black.withOpacity(0.06),
  //             blurRadius: 12,
  //             offset: const Offset(0, -4))
  //       ],
  //     ),
  //     padding: EdgeInsets.only(
  //         top: 10,
  //         bottom: MediaQuery.of(context).padding.bottom + 10,
  //         left: 10,
  //         right: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _navItem(Icons.grid_view_rounded, 'Dashboard', false),
  //         _navItem(Icons.home_work_rounded, 'Companies', true),
  //         _navItem(Icons.work_rounded, 'Openings', false),
  //         _navItem(Icons.person_outline_rounded, 'Profile', false),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _navItem(IconData icon, String label, bool active) => Column(
  //   mainAxisSize: MainAxisSize.min,
  //   children: [
  //     Icon(icon,
  //         color: active ? primary : textMuted, size: 22),
  //     const SizedBox(height: 3),
  //     Text(label,
  //         style: TextStyle(
  //             fontSize: 9,
  //             fontWeight:
  //             active ? FontWeight.w700 : FontWeight.w400,
  //             color: active ? primary : textMuted)),
  //     if (active)
  //       Container(
  //           margin: const EdgeInsets.only(top: 3),
  //           height: 3,
  //           width: 20,
  //           decoration: BoxDecoration(
  //               color: primary,
  //               borderRadius: BorderRadius.circular(2))),
  //   ],
  // );
}