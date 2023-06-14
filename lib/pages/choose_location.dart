import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  void getData() async {
    //simulate network request for a username
    String username = await Future.delayed(const Duration(seconds: 3), (){
      return 'yosan';
    });

    // simulate network request to get bio of the username
    String bio = await Future.delayed(const Duration(seconds: 2), (){
      return 'Meat eaters, gamers & bug collector';
    });
    // print('$username - $bio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(onPressed: (){
        setState(() {
          counter += 1;
        });
      }, 
      child: Text('Counter is $counter',),
      ),
    );
  }
}