import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  // late dynamic result;
  @override
  Widget build(BuildContext context) {
    //data from loading page
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String bgname = data["isDayTime"] ? "day.png" : "night.png";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 53, 63),
            image: DecorationImage(
                image: AssetImage("images/$bgname"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    print(result);
                    setState(() {
                      if (result == null) {
                        data = {
                          "time": ".....",
                          "zone": "Please Choose a Location 😊",
                          "isDayTime": true ,
                        };
                      } else {
                        data = {
                          "time": result["time"],
                          "zone": result["zone"],
                          "isDayTime": result["isDayTime"],
                        };
                      }
                    });
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text("Edit Location ")),
              const SizedBox(
                height: 450,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration:
                      const BoxDecoration(color: Color.fromARGB(100, 0, 0, 0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data["time"],
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        data["zone"],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
