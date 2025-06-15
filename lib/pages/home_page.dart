import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {
      'name': 'Nasi Goreng',
      'image': 'https://media.istockphoto.com/id/1345298910/photo/special-fried-rice-or-nasi-goreng-special.webp?a=1&b=1&s=612x612&w=0&k=20&c=DGZ_z81WgvIeScQtiS2EpPsy3zsThSVeMLbRB0e4i2A=',
      'price': '25.000'
    },
    {
      'name': 'Ayam Bakar',
      'image': 'https://images.unsplash.com/photo-1666239308347-4292ea2ff777?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YXlhbSUyMGJha2FyfGVufDB8fDB8fHww',
      'price': '30.000'
    },
    {
      'name': 'Mie Goreng',
      'image': 'https://images.unsplash.com/photo-1612929633738-8fe44f7ec841?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWllJTIwZ29yZW5nfGVufDB8fDB8fHww',
      'price': '22.000'
    },
    {
      'name': 'Sate Ayam',
      'image': 'https://media.istockphoto.com/id/467528630/photo/chicken-satay-on-a-banana-leaf-with-purple-orchids.webp?a=1&b=1&s=612x612&w=0&k=20&c=xDmME4GTNs7EjJT-BzyRVjgldC_PWPKHn0umPUYzVCA=',
      'price': '28.000'
    },
    {
      'name': 'Soto Ayam',
      'image': 'https://media.istockphoto.com/id/1463818181/photo/soto-ayam-indonesian-food.webp?a=1&b=1&s=612x612&w=0&k=20&c=_-cL8zS5fF6aevNXEP1sjDC5wDTLHEOZEHGwhSKB0jQ=',
      'price': '24.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Menu Restoran'),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: item);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      item['image']!,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name']!,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text('Rp ${item['price']!}',
                                style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.deepOrange),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
