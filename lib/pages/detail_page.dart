import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final Map<String, Map<String, String>> details = {
      'Nasi Goreng': {
        'desc': 'Nasi goreng dengan ayam, telur, dan sayuran segar. Disajikan dengan kerupuk dan acar.',
        'calories': '520 kkal',
        'time': '15 menit'
      },
      'Ayam Bakar': {
        'desc': 'Ayam panggang dengan bumbu khas Nusantara. Dilengkapi sambal dan lalapan.',
        'calories': '610 kkal',
        'time': '20 menit'
      },
      'Mie Goreng': {
        'desc': 'Mie goreng tradisional Jawa dengan telur, sawi, dan kerupuk udang.',
        'calories': '480 kkal',
        'time': '10 menit'
      },
      'Sate Ayam': {
        'desc': 'Tusukan ayam panggang disiram saus kacang kental dan lontong.',
        'calories': '540 kkal',
        'time': '18 menit'
      },
      'Soto Ayam': {
        'desc': 'Soto ayam bening dengan suwiran ayam, telur, kentang, dan nasi.',
        'calories': '450 kkal',
        'time': '12 menit'
      },
    };

    final info = details[data['name']] ?? {};

    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text(data['name']!),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(data['image']!, height: 250, width: double.infinity, fit: BoxFit.cover),
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['name']!,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    info['desc'] ?? '',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.attach_money, color: Colors.deepOrange),
                    title: Text('Harga'),
                    trailing: Text('Rp ${data['price']!}'),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_fire_department, color: Colors.deepOrange),
                    title: Text('Kalori'),
                    trailing: Text(info['calories'] ?? ''),
                  ),
                  ListTile(
                    leading: Icon(Icons.timer, color: Colors.deepOrange),
                    title: Text('Waktu Masak'),
                    trailing: Text(info['time'] ?? ''),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                      label: Text("Kembali ke Menu"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
