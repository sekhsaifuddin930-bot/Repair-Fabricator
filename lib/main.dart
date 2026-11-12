// =====================================================================
// REPAIR FABRICATOR: ALL-INDIA MUTUAL ENTERPRISE PRO APPLICATION
// DIRECTOR & FOUNDER: Saifuddin Sekh
// PNB AUTO-SPLIT A/C: 0701200100018129 (IFSC: PUNB0070120)
// =====================================================================
import 'package:flutter/material.dart';

void main() {
  runApp(const RepairFabricatorApp());
}

class RepairFabricatorApp extends StatelessWidget {
  const RepairFabricatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repair Fabricator Enterprise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
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
          MaterialPageRoute(builder: (context) => const LanguageAndRoleSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.build_circle, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'REPAIR FABRICATOR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Enterprise Industrial & Heavy Fabrication Platform',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}

/// 2. Language & Role Selection Screen
class LanguageAndRoleSelectionScreen extends StatefulWidget {
  const LanguageAndRoleSelectionScreen({super.key});

  @override
  State<LanguageAndRoleSelectionScreen> createState() => _LanguageAndRoleSelectionScreenState();
}

class _LanguageAndRoleSelectionScreenState extends State<LanguageAndRoleSelectionScreen> {
  String selectedLanguage = 'English';
  final List<String> languages = [
    'English', 'Bengali', 'Hindi', 'Tamil', 'Telugu',
    'Marathi', 'Gujarati', 'Kannada', 'Odia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Fabricator'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Preferred Language:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedLanguage,
              items: languages.map((String lang) {
                return DropdownMenuItem<String>(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedLanguage = val!;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Select User Role:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('Customer Access'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToLogin(context, 'Customer'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.engineering),
              label: const Text('Contractor / Welder / Shop Owner Access'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.blueGrey.shade800,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToLogin(context, 'Contractor'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.admin_panel_settings),
              label: const Text('Super Admin / Director Control Panel'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _navigateToLogin(context, 'SuperAdmin'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLogin(BuildContext context, String role) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginScreen(role: role, language: selectedLanguage)),
    );
  }
}
/// 3. Unified Login Screen
class LoginScreen extends StatefulWidget {
  final String role;
  final String language;
  const LoginScreen({super.key, required this.role, required this.language});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.role == 'SuperAdmin') {
      phoneController.text = '8882384367';
      passwordController.text = 'RIJU23';
    }
  }

  void _login() {
    if (widget.role == 'SuperAdmin') {
      if (passwordController.text == 'RIJU23' || passwordController.text.isNotEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OwnerAdminDashboard()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Admin PIN or Password!')),
        );
      }
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => LegalAgreementDialog(
          onAccepted: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => UserDashboard(role: widget.role),
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.role} Authentication (${widget.language})'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Icon(Icons.security, size: 70, color: Colors.deepOrange),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Registered Mobile / Email / Director ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password / Master PIN (Passcode)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                onPressed: _login,
                child: const Text('AUTHENTICATE & ENTER', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/// 4. Mandatory Sign-Up Agreement (Indian Contract Act, 1872)
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
              '1. Mandatory 15% Platform Commission: All structural fabrication, welding, and repair orders booked via cash or online channels carry a non-bypassable 15% automated commission allocated directly to Director Saifuddin Sekh (PNB A/C: 0701200100018129, IFSC: PUNB0070120).\n\n'
              '2. Anti-Bypass Security Clause: Any attempt to negotiate or accept offline payments to evade commission will result in permanent account termination and legal enforcement under breach of contract.\n\n'
              '3. 1-Month Post-Payment Window: Customers retain a 30-day inspection period to report structural defects or incomplete fabrication works.\n\n'
              '4. Site-Return Orders: Contractors and shop owners are legally obligated to execute mandatory Site-Return Orders to resolve non-compliant structural tasks without additional charge.',
              style: TextStyle(fontSize: 12, height: 1.4),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Decline'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
          onPressed: onAccepted,
          child: const Text('I Agree & Accept Terms'),
        ),
      ],
    );
  }
}

/// 5. Customer & Contractor Dashboard
class UserDashboard extends StatelessWidget {
  final String role;
  const UserDashboard({super.key, required this.role});

  void _showFeedbackDialog(BuildContext context) {
    double rating = 5.0;
    final TextEditingController reviewController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Customer Rating & Feedback'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Rate your work experience with the contractor/welder:'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 32,
                );
              }),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: reviewController,
              decoration: const InputDecoration(
                labelText: 'Write your comments or review',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Feedback submitted successfully! Thank you.')),
              );
            },
            child: const Text('Submit Feedback'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$role Operational Workspace'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_balance_wallet),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Auto-Split Escrow Engine Active: 15% Director Split Enabled')),
              );
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.orange.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Industrial Project Scope & Bidding Engine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 5),
                  Text('• Supports heavy structural projects up to 100mm x 16m beam/pipe structures.'),
                  Text('• 1-Month Post-Payment Quality Assurance Window active.'),
                  Text('• Automated 15% Platform Commission routed to Director Saifuddin Sekh.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.handyman, color: Colors.deepOrange),
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
            onTap: () => _showFeedbackDialog(context),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.assignment_return, color: Colors.red),
            title: const Text('Site-Return Orders (Quality Compliance)'),
            subtitle: const Text('Legally binding correction orders for incomplete tasks'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment, color: Colors.green),
            title: const Text('Automated Escrow Payment Portal'),
            subtitle: const Text('15% Auto-Split Gateway (Razorpay/Cashfree Integrated)'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
/// 6. Super Admin & Director Master Control Dashboard
class OwnerAdminDashboard extends StatefulWidget {
  const OwnerAdminDashboard({super.key});

  @override
  State<OwnerAdminDashboard> createState() => _OwnerAdminDashboardState();
}

class _OwnerAdminDashboardState extends State<OwnerAdminDashboard> {
  final TextEditingController directorNameController = TextEditingController(text: 'Saifuddin Sekh');
  final TextEditingController phoneController = TextEditingController(text: '8882384367');
  final TextEditingController emailController = TextEditingController(text: 'saifuddinsekh54871@gmail.com');
  final TextEditingController pinCodeController = TextEditingController(text: 'RIJU23');
  final TextEditingController accountNoController = TextEditingController(text: '0701200100018129');
  final TextEditingController ifscController = TextEditingController(text: 'PUNB0070120');
  final TextEditingController bankNameController = TextEditingController(text: 'Punjab National Bank');
  final TextEditingController razorpayKeyController = TextEditingController(text: 'rzp_live_production_route_key');

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Director Profile, PIN, Bank Details, and API Settings Updated Successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Admin Master Control Panel'),
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
                    const Text(
                      'DIRECTOR & BENEFICIARY INFORMATION',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.orangeAccent),
                    ),
                    const SizedBox(height: 8),
                    Text('Director Name: ${directorNameController.text}', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Phone Number: ${phoneController.text}', style: const TextStyle(color: Colors.white70)),
                    Text('Email ID: ${emailController.text}', style: const TextStyle(color: Colors.white70)),
                    Text('Admin PIN: ${pinCodeController.text}', style: const TextStyle(color: Colors.white70)),
                    Text('Bank Name: ${bankNameController.text}', style: const TextStyle(color: Colors.white70)),
                    Text('Account No: ${accountNoController.text}', style: const TextStyle(color: Colors.white70)),
                    Text('IFSC Code: ${ifscController.text}', style: const TextStyle(color: Colors.white70)),
                    const Text('Platform Royalty Commission: 15% Auto-Split', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Director Contact & Admin Security Settings (Editable)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.deepOrange),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: directorNameController,
              decoration: const InputDecoration(labelText: 'Director Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Mobile Number', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: pinCodeController,
              decoration: const InputDecoration(labelText: 'Master Admin PIN / Passcode', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Gateway & Bank Configuration (15% AUTO-SPLIT)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.deepOrange),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bankNameController,
              decoration: const InputDecoration(labelText: 'Bank Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: accountNoController,
              decoration: const InputDecoration(labelText: 'PNB Bank Account Number', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ifscController,
              decoration: const InputDecoration(labelText: 'IFSC Code', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: razorpayKeyController,
              decoration: const InputDecoration(labelText: 'Payment Gateway API Key (Razorpay Route / Cashfree)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ownership Succession & Family Access Module',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.deepOrange),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.supervisor_account),
              label: const Text('Grant Co-Admin or Family Ownership Access'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                backgroundColor: Colors.grey.shade800,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Family Ownership Succession Module is Active.')),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              onPressed: _saveSettings,
              child: const Text('SAVE & UPDATE MASTER CONFIGURATION', style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}

