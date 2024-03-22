import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Makanan',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        hintColor: Colors.orangeAccent,
      ),
      home: MenuMakanan(),
    );
  }
}

class MenuMakanan extends StatefulWidget {
  @override
  _MenuMakananState createState() => _MenuMakananState();
}

class _MenuMakananState extends State<MenuMakanan>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return FadeTransition(
            opacity: _animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 0.2),
                end: Offset.zero,
              ).animate(_animation),
              child: child,
            ),
          );
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Makanan Utama',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _buildMenuCard(
                    'Nasi Goreng',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR39CiUalSn50P2eXCsGSj8ec2JULutPqqncCRIKgTaNifHHfnzujqru9uWzdXd',
                    'Rp 25.000',
                  ),
                  _buildMenuCard(
                    'Ayam Bakar',
                    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQpdqJghJ2Wdra3-3aQqtfVU1UsAZjLs37A61cJ6eCHYcpl2y7FRrfqr1iJES0i',
                    'Rp 30.000',
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Minuman',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  _buildMenuCard(
                    'Es Teh Manis',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTUHc3j_KqCywhibwfmnJ4feUcdZBeROKy50-3uhLahQw8RpmWY5Hx804CcjOw',
                    'Rp 10.000',
                  ),
                  _buildMenuCard(
                    'Jus Alpukat',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1bGLIaIUe_4XTOJO003rGzTAKaVjUySn_YA&usqp=CAU',
                    'Rp 15.000',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(String title, String imageUrl, String price) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text('Tambahkan'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
