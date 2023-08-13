
import 'package:flutter/material.dart';

class SinglePet extends StatefulWidget {
  const SinglePet({Key? key}) : super(key: key);

  @override
  State<SinglePet> createState() => _SinglePetState();
}

class _SinglePetState extends State<SinglePet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}
