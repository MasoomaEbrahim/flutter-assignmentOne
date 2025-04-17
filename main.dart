import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Laptop {
  String brand;
  String cpu;
  int ram;
  double weight;
  double screen;
  bool storage;
  bool os;
  DateTime manuDate;

  Laptop({
    required this.brand,
    required this.cpu,
    required this.ram,
    required this.weight,
    required this.screen,
    required this.storage,
    required this.os,
    required this.manuDate,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laptop App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Laptop> laptops = [];
  String brand = '';
  String selectedCpu = 'intel i7';
  String selectedGpu = 'Apple M2 Pro';
  int ram = 0;
  double weight = 0.0;
  double screenSize = 13.0;
  bool isHDD = false;
  bool isOS = false;
  DateTime manuDate = DateTime.now();

  void addLaptop() {
    setState(() {
      laptops.add(
        Laptop(
          brand: brand,
          cpu: selectedCpu,
          ram: ram,
          weight: weight,
          screen: screenSize,
          storage: isHDD,
          os: isOS,
          manuDate: manuDate,
        ),
      );
    });
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirmation'),
            content: const Text('Laptop added successfully!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void deleteLaptop(int index) {
    setState(() {
      laptops.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Laptops'),
          bottom: const TabBar(tabs: [Tab(text: 'Form'), Tab(text: 'List')]),
        ),
        body: TabBarView(children: [buildForm(), buildList()]),
      ),
    );
  }

  Widget buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Brand Name'),
            onChanged: (value) {
              brand = value;
            },
          ),

          // CPU Selection in ListTile
          ListTile(
            title: const Text('CPU: '),
            subtitle: DropdownButton<String>(
              value: selectedCpu,
              items: const [
                DropdownMenuItem(value: 'intel i7', child: Text('Intel i7')),
                DropdownMenuItem(value: 'intel i5', child: Text('Intel i5')),
                DropdownMenuItem(value: 'intel i3', child: Text('Intel i3')),
                DropdownMenuItem(value: 'AMD', child: Text('AMD')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCpu = value!;
                });
              },
              hint: const Text('Select CPU'),
            ),
          ),

          // GPU Dropdown
          ListTile(
            title: const Text('GPU: '),
            subtitle: DropdownButton<String>(
              value: selectedGpu,
              items: const [
                DropdownMenuItem(
                  value: 'Apple M2 Pro',
                  child: Text('Apple M2 Pro'),
                ),
                DropdownMenuItem(
                  value: 'intel Iris',
                  child: Text('Intel Iris'),
                ),
                DropdownMenuItem(
                  value: 'AMD Radeon',
                  child: Text('AMD Radeon'),
                ),
                DropdownMenuItem(
                  value: 'NVidia GeForce',
                  child: Text('Nvidia GeForce'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGpu = value!;
                });
              },
              hint: const Text('Select GPU'),
            ),
          ),

          // RAM Slider
          ListTile(
            title: const Text('RAM:'),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$ram GB'),
                Expanded(
                  child: Slider(
                    value: ram.toDouble(),
                    min: 0,
                    max: 16,
                    divisions: 16,
                    onChanged: (value) {
                      setState(() {
                        ram = value.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Weight Slider
          ListTile(
            title: const Text('Weight:'),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${weight.toStringAsFixed(1)} kg'),
                Expanded(
                  child: Slider(
                    value: weight,
                    min: 0,
                    max: 3,
                    divisions: 30,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Screen Size Radio Buttons
          ListTile(
            title: const Text('Screen Size'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<double>(
                  title: const Text('13 inch'),
                  value: 13.0,
                  groupValue: screenSize,
                  onChanged: (value) {
                    setState(() {
                      screenSize = value!;
                    });
                  },
                ),
                RadioListTile<double>(
                  title: const Text('14 inch'),
                  value: 14.0,
                  groupValue: screenSize,
                  onChanged: (value) {
                    setState(() {
                      screenSize = value!;
                    });
                  },
                ),
                RadioListTile<double>(
                  title: const Text('15 inch'),
                  value: 15.0,
                  groupValue: screenSize,
                  onChanged: (value) {
                    setState(() {
                      screenSize = value!;
                    });
                  },
                ),
              ],
            ),
          ),

          SwitchListTile(
            title: const Text('Enable HDD'),
            value: isHDD,
            onChanged: (value) {
              setState(() {
                isHDD = value;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Enable OS'),
            value: isOS,
            onChanged: (value) {
              setState(() {
                isOS = value!;
              });
            },
          ),
          ListTile(
            leading: const Text('Manufacturing Date'),
            title: Text(
              '${'${manuDate.toLocal()}'.split(' ')[0]} ${manuDate.hour}:${manuDate.minute.toString().padLeft(2, '0')}',
            ), // Show date and time in one line
            trailing: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: manuDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null && pickedDate != manuDate) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(manuDate),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      manuDate = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
            ),
          ),
          SizedBox(
            width: double.infinity, // Makes the button fill the available width
            child: ElevatedButton(
              onPressed: addLaptop,
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: laptops.length,
      itemBuilder: (context, index) {
        final laptop = laptops[index];
        return ListTile(
          title: Text(laptop.brand), // Display only the brand name
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteLaptop(index), // Remove button
          ),
        );
      },
    );
  }
}
