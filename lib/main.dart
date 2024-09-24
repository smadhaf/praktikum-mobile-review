import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian atas (Hello, Nama Pengguna)
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            "Jerome Bell",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('dandadan.jpeg'),
                      ),
                    ],
                  ),
                ),

                // Kontainer utama dengan gambar dan teks
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 222, 167, 86),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'dokter.jpeg',
                          width: 140,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "How do you feel?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              "Fill out your medical card right now",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Get Started'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Pencarian
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'How can we help you?',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 222, 167, 86),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Tombol kategori (Dentist, Inpatient, etc.)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryButton(
                          icon: Icons.medical_services, label: 'Dentist'),
                      CategoryButton(
                          icon: Icons.local_hospital, label: 'Inpatient'),
                      CategoryButton(icon: Icons.healing, label: 'Surgery'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Daftar dokter
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Doctor list",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style:
                            TextStyle(fontSize: 16, color: Colors.pinkAccent),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Grid list of doctors
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: const [
                      DoctorCard(
                        name: 'Dr. Arline McCoy',
                        location: 'Philadelphia, 27 y.o.',
                        rating: 4.5,
                        image: 'dokter_cewe.jpeg',
                      ),
                      DoctorCard(
                        name: 'Dr. Jhonny Sins',
                        location: 'Washington, 23 y.o.',
                        rating: 5.0,
                        image: 'dokter_cowo.jpeg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor:
            const Color.fromARGB(255, 220, 207, 94), // Warna latar belakang
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.pinkAccent,
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String image;

  const DoctorCard({
    super.key,
    required this.name,
    required this.location,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 222, 167, 86),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(location,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow[700], size: 16),
              const SizedBox(width: 5),
              Text(rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
