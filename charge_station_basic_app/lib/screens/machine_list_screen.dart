import 'package:flutter/material.dart';
import '../models/machine.dart'; // Makine model sınıfı
// ignore: unused_import
import '../services/api_service.dart'; // API servis sınıfı
import 'machine_detail_screen.dart'; // Detay ekranı

class MachineListScreen extends StatefulWidget {
  const MachineListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MachineListScreenState createState() => _MachineListScreenState();
}

class _MachineListScreenState extends State<MachineListScreen> {
  List<Machine> machines = []; // machines listesini boş olarak başlatıyoruz
  bool isLoading = false;

  //ApiService _apiService = ApiService(); // API servisini kullanmak için

  @override
  void initState() {
    super.initState();
    _fetchMachines(); // Makineleri yükleme işlemi başlatılıyor
  }

  Future<void> _fetchMachines() async {
    setState(() {
      isLoading = true;
    });

    try {
      // API'den makineleri getirmek yerine, örnek verileri kullanıyoruz
      List<Machine> exampleMachines = Machine.getExampleMachines();
      setState(() {
        machines = exampleMachines;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Hata durumunda kullanıcıya bildirim gösterilebilir
      print('Error fetching machines: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('İstasyonlar' , style: TextStyle(color: Colors.white),),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : machines.isEmpty
              ? const Center(child: Text('No machines found.'))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // İki sütunlu bir grid
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8, // Kartların en-boy oranı
                  ),
                  itemCount: machines.length,
                  itemBuilder: (context, index) {
                    return _buildMachineCard(machines[index]);
                  },
                ),
    );
  }

  Widget _buildMachineCard(Machine machine) {
    return GestureDetector(
      onTap: () {
        // Makineye tıklandığında detay sayfasına git
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => MachineDetailScreen(machine: machine),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.asset(
                  machine.imageUrl ?? "lib/assets/images/image0.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    machine.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    machine.type,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Status: ${machine.status}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
