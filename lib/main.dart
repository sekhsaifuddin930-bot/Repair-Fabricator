// =====================================================================
// WELDER CONNECT (REPAIR FABRICATOR) - ENTERPRISE PRO APPLICATION
// DIRECTOR & FOUNDER: Saifuddin Sekh
// PNB AUTO-SPLIT A/C: 0701200100018129 (IFSC: PUNB0070120)
// =====================================================================
import 'package:flutter/material.dart';

void main() {
  runApp(const WelderConnectApp());
}

class WelderConnectApp extends StatelessWidget {
  const WelderConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welder Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF5722),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        useMaterial3: true,
      ),
      home: const MainSplashScreen(),
    );
  }
}

/// 1. Splash Screen
class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({super.key});

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
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
              'WELDER CONNECT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Director: Saifuddin Sekh | PNB Secured',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFFFF5722)),
          ],
        ),
      ),
    );
  }
}
/// 2. Role Selection Screen (Matching Design Mockup)
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

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
            const Icon(Icons.engineering, size: 60, color: Color(0xFFFF5722)),
            const SizedBox(height: 20),
            _buildRoleButton(context, 'CUSTOMER', Colors.deepOrange, Icons.person),
            const SizedBox(height: 15),
            _buildRoleButton(context, 'WELDER', const Color(0xFF1A1A2E), Icons.security),
            const SizedBox(height: 15),
            _buildRoleButton(context, 'CONTRACTOR', Colors.deepOrange, Icons.assignment),
            const SizedBox(height: 15),
            _buildRoleButton(context, 'SHOP OWNER', const Color(0xFF1A1A2E), Icons.store),
            const Spacer(),
            const Text(
              'Welder Connect Platform © 2026.\nDirector: Saifuddin Sekh. PNB Auto-Split A/C Secured.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String title, Color color, IconData icon) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: Icon(icon),
        label: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MainDashboard()),
          );
        },
      ),
    );
  }
}

/// 3. Main Dashboard with Bottom Navigation (Home, Post Job, Track, Support)
class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreenTab(),
    const PostJobScreenTab(),
    const TrackScreenTab(),
    const SupportScreenTab(),
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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


/// Tab 1: Home Screen
class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welder Connect Hub'), backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white),
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
                  Text('Active Industrial Platform', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Text('• 15% Automated Commission Split Active.'),
                  Text('• Direct Payout to Director Saifuddin Sekh (PNB A/C: 0701200100018129).'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            leading: const Icon(Icons.handyman, color: Color(0xFFFF5722)),
            title: const Text('Find Local Welders & Fabricators'),
            subtitle: const Text('Connect instantly with verified experts in your area'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.amber),
            title: const Text('Rate Recent Completed Jobs'),
            subtitle: const Text('Star ratings and review submission portal'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

/// Tab 2: Post Job & Budget Selector (Matching Mockup)
class PostJobScreenTab extends StatefulWidget {
  const PostJobScreenTab({super.key});

  @override
  State<PostJobScreenTab> createState() => _PostJobScreenTabState();
}

class _PostJobScreenTabState extends State<PostJobScreenTab> {
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
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt, size: 50, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),
            Text('Customer Budget: ₹${currentBudget.toInt()}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFFF5722))),
            Slider(
              value: currentBudget,
              min: 300,
              max: 1000,
              divisions: 7,
              activeColor: const Color(0xFFFF5722),
              label: '₹${currentBudget.toInt()}',
              onChanged: (val) {
                setState(() {
                  currentBudget = val;
                });
              },
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Welder Counter Offers:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(avatar: const Icon(Icons.person), label: const Text('Welder A: ₹650')),
                Chip(avatar: const Icon(Icons.person), label: const Text('Welder B: ₹700')),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF1A1A2E),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Deal Confirmed! 15% Platform Commission Locked.')),
                );
              },
              child: const Text('CONFIRM DEAL', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 15),
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

/// Tab 3: Live Tracking Screen
class TrackScreenTab extends StatelessWidget {
  const TrackScreenTab({super.key});

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
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange.shade50,
              child: const Center(
                child: Icon(Icons.map, size: 100, color: Color(0xFFFF5722)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                const Text('Secure In-App Chat Active', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
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

/// Tab 4: Support & PNB Details Hub
class SupportScreenTab extends StatelessWidget {
  const SupportScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support & PNB Details'), backgroundColor: const Color(0xFFFF5722), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Raise a Complaint', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          _buildSupportButton('Report Welder', Icons.report),
          _buildSupportButton('Report Customer', Icons.person_off),
          _buildSupportButton('Job Quality Issue', Icons.warning),
          _buildSupportButton('Payment Discrepancy', Icons.payment),
          const SizedBox(height: 20),
          const Text('Past PNB Splits (15% platform fee)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Card(
            child: ListTile(
              title: const Text('Rahul Welder - ₹50.00'),
              subtitle: const Text('To Saifuddin Sekh\'s PNB A/C: 0701200100018129 (IFSC: PUNB0070120)'),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportButton(String title, IconData icon) {
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

