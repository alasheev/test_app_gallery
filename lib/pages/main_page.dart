import 'package:flutter/material.dart';
import 'package:test_app_gallery/widgets/new_tab.dart';
import 'package:test_app_gallery/widgets/popular_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                indicatorColor: const Color(0xFFED5992),
                labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  _buildCustomTab('New'),
                  _buildCustomTab('Popular'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  NewTab(),
                  PopularTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTab(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(text),
    );
  }
}

