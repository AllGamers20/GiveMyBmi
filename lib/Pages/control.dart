import 'package:flutter/material.dart';
import 'package:newbmi/Pages/result.dart';

class Control extends StatefulWidget {
  bool isman;
  Control({super.key, required this.isman});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int wNum = 25;
  int hNum = 100;
  @override
  Widget build(BuildContext context) {
    Color kMain = widget.isman ? Colors.blue : Colors.red;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 36,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: kMain,
                                ),
                              ),
                              Text(
                                'BMI',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: kMain,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.isman ? 'Male' : 'female',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                widget.isman ? Icons.male : Icons.female,
                                color: kMain,
                                size: 150,
                              ),
                              const Text(
                                'Weight (KG)',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 150,
                            itemBuilder: (context, index) {
                              int i = index + 1;
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      wNum = i;
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      '$i',
                                      style: TextStyle(
                                        color: wNum == i ? kMain : Colors.black,
                                        fontSize: wNum == i ? 42 : 25,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: kMain,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 48,
                        ),
                        const Text(
                          'Height \n(CM)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 200,
                            itemBuilder: (context, index) {
                              int i = index + 1;
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      hNum = i;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: hNum == i ? Colors.white : kMain,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$i',
                                        style: TextStyle(
                                          color:
                                              hNum == i ? kMain : Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: MediaQuery.sizeOf(context).width * 2 / 3 - 30,
            bottom: 10,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      height: hNum,
                      weight: wNum,
                      isMale: widget.isman,
                    ),
                  ),
                );
              },
              label: const Text('Result'),
              icon: const Icon(Icons.calculate),
            ),
          )
        ],
      ),
    );
  }
}
