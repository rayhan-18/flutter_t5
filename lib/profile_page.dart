
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final String userName = 'Muhamad Rayhan';
  final String role = 'Junior Front End Developer';

  final List<String> experiences = [
    'Junior Kost Gacor',
    'Solo Project E-Commerce',
    'Personal Portfolio Website',
    'Website Company Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            Column(
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur edit belum aktif pada modul statis.',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
            ),

            const SizedBox(height: 24),

            const ProfileStats(),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pengalaman Kerja',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return ExperienceCard(
                    title: experiences[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ExperienceCard extends StatelessWidget {
  final String title;

  const ExperienceCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(
              Icons.work,
              color: Colors.blueAccent,
              size: 30,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatItem(count: '20', label: 'Proyek'),
          StatItem(count: '1,5M', label: 'Followers'),
          StatItem(count: '1', label: 'Following'),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
