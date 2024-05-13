import 'package:flutter/material.dart';

import '../getAllCountry.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<GatAllCountry> allCountry = [
    GatAllCountry(link: 'Asia/Aden',name: "Yemen - Aden", flag: 'images/yemen.png'),
    GatAllCountry(link: 'Africa/Cairo', name: 'Egypt - Cairo', flag: 'images/egypt.png'),
    GatAllCountry(link: 'Africa/Tunis', name: 'Tunisia - Tunis', flag: 'images/tunisia.png'),
    GatAllCountry(link: 'Africa/Algiers',name: 'Algeria - Algiers', flag: 'images/algeria.png'),
    GatAllCountry(link: 'Australia/Sydney', name: 'Australia - Sydney', flag: 'images/australia.png'),
    GatAllCountry(link: 'America/Toronto', name: 'Canada - Toronto',flag: 'images/canada.png'),
    GatAllCountry(link: 'Asia/Riyadh', name: '	Saudi Arabia - Riyadh', flag: 'images/sa.png'),
  ];
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor:const  Color.fromARGB(255, 191, 191, 199),
      appBar: AppBar(title: const Text("Choose Location"), elevation: 5, automaticallyImplyLeading: false,),
      body: ListView.builder(
          itemCount: allCountry.length,
          itemBuilder: (context , index){
        return  Card(
          child: ListTile(
            onTap: ()async{
              GatAllCountry clickedCountry = allCountry[index];
              await clickedCountry.getData();


              Navigator.pop(context , {
                "time": clickedCountry.timeNow,
                "zone": clickedCountry.name,
                "isDayTime": clickedCountry.isDayTime,
              });
            },
            title: Text(allCountry[index].name , style:const TextStyle(fontSize: 25),),
            leading: CircleAvatar(backgroundImage: AssetImage(allCountry[index].flag),),
          ),
        );
      }),

    );
  }
}
