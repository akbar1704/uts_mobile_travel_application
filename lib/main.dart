import 'package:flutter/material.dart';
import 'package:uts_mobile_travel_application/destination_detail.dart';
import 'package:uts_mobile_travel_application/destination_model.dart';
import 'package:uts_mobile_travel_application/splash_screen.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<DestinationModel> destinations = [
    DestinationModel(
      name: 'Candi Borobudur',
      description:
          'Candi Borobudur adalah candi Buddha terbesar di dunia yang terletak di Magelang, Jawa Tengah.',
      location: 'Magelang, Jawa Tengah',
      imageUrl: 'assets/images/borobudur.jpg',
      price: 50000,
      rating: 4.8,
      activities: 'Tur Candi, Fotografi',
      weather: 'Cerah',
      transportation: 'Bus, Taksi',
      accommodation: 'Hotel, Homestay',
      contact: '+62812345678',
    ),
    DestinationModel(
      name: 'Gunung Bromo',
      description:
          'Gunung Bromo adalah gunung berapi aktif yang terkenal dengan pemandangan matahari terbitnya yang menakjubkan.',
      location: 'Probolinggo, Jawa Timur',
      imageUrl: 'assets/images/bromo.jpg',
      price: 220000,
      rating: 4.7,
      activities: 'Pendakian, Fotografi, Tur Jeep',
      weather: 'Dingin',
      transportation: 'Jeep, Motor',
      accommodation: 'Hotel, Guest House',
      contact: '+62818765432',
    ),
    DestinationModel(
      name: 'Taman Mini Indonesia Indah (TMII)',
      description:
          'TMII adalah taman rekreasi yang menampilkan kebudayaan Indonesia dari Sabang sampai Merauke.',
      location: 'Jakarta Timur, DKI Jakarta',
      imageUrl: 'assets/images/tmii.jpg',
      price: 50000,
      rating: 4.5,
      activities: 'Tur Budaya, Fotografi, Rekreasi',
      weather: 'Cerah',
      transportation: 'Bus, Taksi',
      accommodation: 'Hotel, Apartemen',
      contact: '+62815623478',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel : Explore Destinations",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenPage(destinations: destinations),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  final List<DestinationModel> destinations;

  SplashScreenPage({required this.destinations});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(destinations: widget.destinations),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

class HomePage extends StatelessWidget {
  final List<DestinationModel> destinations;

  HomePage({required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destination List"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            final destination = destinations[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => destination_details(),
                    settings: RouteSettings(
                      arguments: destination,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        destination.imageUrl,
                        width: 50,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              destination.location,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rating: ${destination.rating}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
