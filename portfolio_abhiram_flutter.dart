import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFAFAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4750AC),
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  int _pageIndex = 0;

  static const Color primary = Color(0xFF4750AC);
  static const Color heading = Color(0xFF3B3F9C);

  void _showPage(int index) {
    setState(() => _pageIndex = index);
    // Equivalent to window.scrollTo(0, 0) in the original HTML.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Scrollable.ensureVisible(
          context,
          alignment: 0,
          duration: const Duration(milliseconds: 100),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black26,
        leading: _pageIndex == 0
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => _showPage(0),
              ),
        title: Text(
          _pageIndex == 0
              ? 'My Portfolio'
              : _pageIndex == 1
                  ? 'About Me'
                  : 'My Projects',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        child: _pageIndex == 0
            ? _buildHome()
            : _pageIndex == 1
                ? _buildAbout()
                : _buildProjects(),
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      key: const ValueKey('home'),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 40),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(bottom: 28),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE6DFFB),
                  ),
                ),
                const Text(
                  'P. ABHIRAM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: heading,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'B.Tech 3rd Year • Computer Science',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 36),
                _portfolioButton(
                  label: 'About Me',
                  onPressed: () => _showPage(1),
                ),
                const SizedBox(height: 16),
                _portfolioButton(
                  label: 'Projects',
                  onPressed: () => _showPage(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAbout() {
    return SingleChildScrollView(
      key: const ValueKey('about'),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 36,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE9E8F8),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 14,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.person,
                    size: 56,
                    color: primary,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Hello! I'm P. Abhiram, a passionate Computer Science "
                    'Engineering student from CR Rao AIMSCS. '
                    'I love exploring modern technologies and building '
                    'creative digital projects that solve real-world problems.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Skills & Areas of Expertise',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: heading,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _SkillChip('Python'),
                      _SkillChip('Java'),
                      _SkillChip('C'),
                      _SkillChip('DBMS'),
                      _SkillChip('Operating Systems'),
                      _SkillChip('Computer Networks'),
                      _SkillChip('Machine Learning'),
                      _SkillChip('DSA'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _portfolioButton(
                    label: 'Back to Home',
                    onPressed: () => _showPage(0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjects() {
    return SingleChildScrollView(
      key: const ValueKey('projects'),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            child: Column(
              children: [
                _projectCard(
                  title: 'Content Moderation System',
                  description:
                      'A Python-based intelligent tool for video content '
                      'filtering and analysis.',
                ),
                const SizedBox(height: 22),
                _projectCard(
                  title: 'Weather Forecast App',
                  description:
                      'A dynamic app built using Node.js and Java to display '
                      'real-time weather data.',
                ),
                const SizedBox(height: 10),
                _portfolioButton(
                  label: 'Back to Home',
                  onPressed: () => _showPage(0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _projectCard({
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: heading,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Color(0xFF444444),
            ),
          ),
        ],
      ),
    );
  }

  Widget _portfolioButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: const Color(0x594750AC),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFF4750AC),
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      side: BorderSide.none,
    );
  }
}
