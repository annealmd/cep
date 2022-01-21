import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 10,
      shadowColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Encontre o Endereço'),
            const SizedBox(
              height: 40,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.house_outlined),
                labelText: 'CEP',
                hintText: '00000000',
                hintStyle: TextStyle(color: Colors.black45, fontSize: 12),
              ),
              textAlign: TextAlign.center,
              maxLength: 8,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Enter'),
            )
          ],
        ),
      ),
    );
  }
}
