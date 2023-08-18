import 'package:flutter/material.dart';

class ContainerDetail extends StatefulWidget {
  const ContainerDetail({super.key});

  @override
  State<ContainerDetail> createState() => _ContainerDetailState();
}

class _ContainerDetailState extends State<ContainerDetail> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Row(
          children: [
            Icon(Icons.arrow_right,),
            SizedBox(width: 10,),
            Text('Container Tracking Detail')
        ],),
        
      ],
    );
  }
}