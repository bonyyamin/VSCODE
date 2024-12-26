import 'package:flutter/material.dart';
import 'add_new_address.dart';

class AddressBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Address'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewAddress(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.blue),
              ),
              child: const Text(
                '+ Add address',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'MH Rashid',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Edit address action
                          },
                          child: const Text(
                            'Edit',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '1712691751',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bosundhara, Dhaka, Dhaka - North, Bashundhara R/A',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Chip(
                          label: const Text(
                            'HOME',
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(width: 8),
                        Chip(
                          label: const Text(
                            'DEFAULT SHIPPING & BILLING ADDRESS',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          backgroundColor: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
