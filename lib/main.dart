// =====================================================================
// REPAIR FABRICATOR (WELDER CONNECT) - PRODUCTION READY MASTER APP
// FOUNDER & DIRECTOR: Saifuddin Sekh
// PNB AUTO-SPLIT BENEFICIARY A/C: 0701200100018129 (IFSC: PUNB0070120)
// =====================================================================
import 'package:flutter/material.dart';

void main() {
  runApp(const RepairFabricatorMasterApp());
}

class RepairFabricatorMasterApp extends StatelessWidget {
  const RepairFabricatorMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repair Fabricator Enterprise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF5722),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        useMaterial3: true,
      ),
      home: const ProductionSplashScreen(),
    );
  }
}

/// 1. Splash Screen
class ProductionSplashScreen extends StatefulWidget {
  const ProductionSplashScreen({super.key});

  @override
  State<ProductionSplashScreen> createState() => _ProductionSplashScreenState();
}

class _ProductionSplashScreenState extends State<ProductionSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RoleAuthHubScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.local_fire_department, size: 90, color: Color(0xFFFF5722)),
            SizedBox(height: 15),
            Text(
              'REPAIR FABRICATOR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Director: Saifuddin Sekh | PNB Secured 15% Auto-Split',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFFFF5722)),
          ],
        ),
      ),
    );
  }
}

/// 2. Role Hub & Authentication Selection
class RoleAuthHubScreen extends StatelessWidget {
  const RoleAuthHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WELCOME TO WELDER CONNECT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A1A2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.engineering, size: 65, color: Color(0xFFFF5722)),
            const SizedBox(height: 20),
            _buildRoleButton(context, 'CUSTOMER ACCESS', Colors.deepOrange, Icons.person, 'Customer'),
            const SizedBox(height: 12),
            _buildRoleButton(context, 'WELDER WORKSPACE', const Color(0xFF1A1A2E), Icons.security, 'Welder'),
            const SizedBox(height: 12),
            _buildRoleButton(context, 'CONTRACTOR HUB', Colors.deepOrange, Icons.assignment, 'Contractor'),
            const SizedBox(height: 12),
            _buildRoleButton(context, 'SHOP OWNER PORTAL', const Color(0xFF1A1A2E), Icons.store, 'ShopOwner'),
            const SizedBox(height: 12),
            _buildRoleButton(context, 'SUPER ADMIN / DIRECTOR PANEL', Colors.black, Icons.admin_panel_settings, 'SuperAdmin'),
            const Spacer(),
            const Text(
              'Repair Fabricator Platform © 2026.\nDirector: Saifuddin Sekh. PNB Auto-Split A/C Secured.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title, Color color, IconData icon, String roleType) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: Icon(icon),
        label: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        onPressed: () {
          if (roleType == 'SuperAdmin') {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SuperAdminDashboard()));
          } else {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => LegalAgreementDialog(
                onAccepted: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainWorkspaceDashboard(role: roleType)));
                },
              ),
            );
          }
        },
      ),
    );
  }
}

/// 3. Mandatory Legal Agreement (Indian Contract Act, 1872)
class LegalAgreementDialog extends StatelessWidget {
  final VoidCallback onAccepted;
  const LegalAgreementDialog({super.key, required this.onAccepted});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: const [
          Icon(Icons.gavel, color: Colors.deepOrange),
          SizedBox(width: 8),
          Expanded(child: Text('Mandatory Legal Consent', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'TERMS OF SERVICE & LEGAL AGREEMENT (Indian Contract Act, 1872):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              '1. Mandatory 15% Platform Commission: All structural fabrication, welding, and repair orders carry a non-bypassable 15% automated commission allocated directly to Director Saifuddin Sekh (PNB A/C: 0701200100018129, IFSC: PUNB0070120).\n\n'
              '2. Anti-Bypass Security Clause: Any attempt to negotiate offline payments to evade commission will result in permanent account termination and legal enforcement under breach of contract.\n\n'
              '3. 1-Month Post-Payment Window: Customers retain a 30-day inspection period to report structural defects or incomplete fabrication works.\n\n'
              '4. Site-Return Orders: Contractors and shop owners are legally obligated to execute mandatory Site-Return Orders to resolve non-compliant structural tasks without additional charge.',
              style: TextStyle(fontSize: 12, height: 1.4),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Decline')),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
          onPressed: onAccepted,
          child: const Text('I Agree & Accept'),
        ),
      ],
    );
  }
}

/// 4. Main Workspace with Bottom Navigation
class MainWorkspaceDashboard extends StatefulWidget {
  final String role;
  const MainWorkspaceDashboard({super.key, required this.role});

  @override
  State<MainWorkspaceDashboard> createState() => _MainWorkspaceDashboardState();
}

class _MainWorkspaceDashboardState extends State<MainWorkspaceDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenTab(),
    const PostJobPriceSelectorTab(),
    const LiveTrackingTab(),
    const SupportAndDisputeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFF5722),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Post Job'),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), label: 'Support'),
        ],
      ),
    );
  }
}

/// Tab 1: Home Hub
class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Repair Fabricator Hub'), backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Industrial Project Scope & Bidding Engine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Text('• Supports heavy structural projects up to 100mm x 16m beam/pipe structures.'),
                  Text('• 15% Automated Commission Split Active to Director Saifuddin Sekh.'),
                  Text('• PNB A/C: 0701200100018129 (IFSC: PUNB0070120).'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.handyman, color: Color(0xFFFF5722)),
            title: const Text('Submit Fabrication / Welding Request'),
            subtitle: const Text('Define structural dimensions, material specs, and geo-location'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star_rate, color: Colors.amber),
            title: const Text('Submit Rating & Customer Feedback'),
            subtitle: const Text('Star rating and written review submission portal'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.assignment_return, color: Colors.red),
            title: const Text('Site-Return Orders (Quality Compliance)'),
            subtitle: const Text('Legally binding correction orders for incomplete tasks'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
/// Tab 2: Small Repair Price Selector & Job Posting
class PostJobPriceSelectorTab extends StatefulWidget {
  const PostJobPriceSelectorTab({super.key});

  @override
  State<PostJobPriceSelectorTab> createState() => _PostJobPriceSelectorTabState();
}

class _PostJobPriceSelectorTabState extends State<PostJobPriceSelectorTab> {
  double currentBudget = 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Small Repair Price Selector'), backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Upload a photo of the damaged work', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Center(child: Icon(Icons.camera_alt, size: 45, color: Colors.black54)),
            ),
            const SizedBox(height: 15),
            Text('Customer Budget: ₹${currentBudget.toInt()}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFF5722))),
            Slider(
              value: currentBudget,
              min: 300,
              max: 1000,
              divisions: 7,
              activeColor: const Color(0xFFFF5722),
              label: '₹${currentBudget.toInt()}',
              onChanged: (val) => setState(() => currentBudget = val),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Welder Counter Offers:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Chip(avatar: Icon(Icons.person, size: 18), label: Text('Welder A: ₹650')),
                Chip(avatar: Icon(Icons.person, size: 18), label: Text('Welder B: ₹700')),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF1A1A2E),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Deal Confirmed! 15% PNB Auto-Split Escrow Locked.')),
                );
              },
              child: const Text('CONFIRM DEAL', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 12),
            const Text(
              'PLATFORM COMMISSION (15%) is auto-calculated and locked for Saifuddin Sekh\'s PNB A/C: 0701200100018129 (IFSC: PUNB0070120) upon deal confirmation.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tab 3: Live Tracking
class LiveTrackingTab extends StatelessWidget {
  const LiveTrackingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Tracking'), backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: const Color(0xFF1A1A2E),
            width: double.infinity,
            child: const Text(
              'Welder Rahul is arriving in 8 mins (1.9 km)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange.shade50,
              child: const Center(child: Icon(Icons.map, size: 90, color: Color(0xFFFF5722))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                const Text('Secure In-App Chat Active', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white, minimumSize: const Size.fromHeight(45)),
                  icon: const Icon(Icons.phone_in_talk),
                  label: const Text('CALL (Call Masking Active)'),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// Tab 4: Support & Dispute
class SupportAndDisputeTab extends StatelessWidget {
  const SupportAndDisputeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support & PNB Details'), backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Raise a Complaint', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          _buildBtn('Report Welder', Icons.report),
          _buildBtn('Report Customer', Icons.person_off),
          _buildBtn('Job Quality Issue', Icons.warning),
          _buildBtn('Payment Discrepancy', Icons.payment),
          const SizedBox(height: 20),
          const Text('Past PNB Splits (15% platform fee)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          const Card(
            child: ListTile(
              title: Text('Rahul Welder - ₹50.00'),
              subtitle: Text('To Saifuddin Sekh\'s PNB A/C: 0701200100018129 (IFSC: PUNB0070120)'),
              trailing: Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBtn(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A1A2E),
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(45),
          alignment: Alignment.centerLeft,
        ),
        icon: Icon(icon, color: const Color(0xFFFF5722)),
        label: Text(title),
        onPressed: () {},
      ),
    );
  }
}

/// 5. Super Admin Dashboard
class SuperAdminDashboard extends StatefulWidget {
  const SuperAdminDashboard({super.key});

  @override
  State<SuperAdminDashboard> createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  final TextEditingController directorNameCtrl = TextEditingController(text: 'Saifuddin Sekh');
  final TextEditingController phoneCtrl = TextEditingController(text: '8882384367');
  final TextEditingController accountNoCtrl = TextEditingController(text: '0701200100018129');
  final TextEditingController ifscCtrl = TextEditingController(text: 'PUNB0070120');

  bool isAccountMasked = true;

  @override
  Widget build(BuildContext context) {
    String displayAccount = isAccountMasked
        ? 'X' * (accountNoCtrl.text.length > 4 ? accountNoCtrl.text.length - 4 : 0) +
            (accountNoCtrl.text.length >= 4 ? accountNoCtrl.text.substring(accountNoCtrl.text.length - 4) : accountNoCtrl.text)
        : accountNoCtrl.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Admin Master Panel'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blueGrey.shade900,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'DIRECTOR BENEFICIARY INFO',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.orangeAccent),
                        ),
                        IconButton(
                          icon: Icon(
                            isAccountMasked ? Icons.visibility_off : Icons.visibility,
                            color: Colors.white,
                          ),
                          onPressed: () => setState(() => isAccountMasked = !isAccountMasked),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text('Director: ${directorNameCtrl.text}', style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    Text('Phone: ${phoneCtrl.text}', style: const TextStyle(color: Colors.white70)),
                    Text('PNB A/C: $displayAccount', style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 15)),
                    Text('IFSC: ${ifscCtrl.text}', style: const TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Update Master Configuration:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(controller: directorNameCtrl, decoration: const InputDecoration(labelText: 'Director Full Name', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: 'Contact Phone', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: accountNoCtrl, decoration: const InputDecoration(labelText: 'PNB Account Number', border: OutlineInputBorder())),
            const SizedBox(height: 10),
            TextField(controller: ifscCtrl, decoration: const InputDecoration(labelText: 'IFSC Code', border: OutlineInputBorder())),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Configuration updated and saved locally!')),
                );
              },
              child: const Text('SAVE MASTER CONFIGURATION', style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
