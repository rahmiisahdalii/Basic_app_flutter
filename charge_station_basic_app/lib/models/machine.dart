// lib/models/machine.dart

class Machine {
  final int id;
  final String name;
  final String type;
  final String status;
  final String? imageUrl; // Makineye ait fotoğraf URL'si

  Machine({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    this.imageUrl,
  });

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      status: json['status'],
      imageUrl: json['imageUrl'], // API'den gelen fotoğraf URL'si
    );
  }

  // Örnek veriler
  static List<Machine> getExampleMachines() {
    return [
      Machine(
        id: 1,
        name: 'Merkez İstasyon ',
        type: 'Type A',
        status: 'Active',
        imageUrl: "lib/assets/images/image1.jpg",
      ),
      Machine(
        id: 2,
        name: 'Kumburgaz İstasyon',
        type: 'Type B',
        status: 'Inactive',
        imageUrl: "lib/assets/images/image2.jpg",
      ),
      Machine(
        id: 3,
        name: 'Lüleburgaz İstasyon',
        type: 'Type C',
        status: 'Active',
        imageUrl: "lib/assets/images/image3.jpg",
      ),
      Machine(
        id: 4,
        name: 'Yakacık İstasyon',
        type: 'Type A',
        status: 'Inactive',
        imageUrl: "lib/assets/images/image4.jpg",
      ),
      Machine(
        id: 5,
        name: 'Kuyucak İstasyon',
        type: 'Type B',
        status: 'Active',
        imageUrl: "lib/assets/images/image5.jpg",
      ),
    ];
  }
}
