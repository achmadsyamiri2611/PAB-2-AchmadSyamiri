import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NFCReaderScreen(),
    );
  }
}

class NFCReaderScreen extends StatefulWidget{
  const NFCReaderScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => NFCReaderScreenState();
}

class _NFCReaderScreenState extends State<NFCReaderScreen> {
  final List<String> _nfcIds = [];       // Daftar history NFC yang terbaca
  bool _isScanning = false;              // Status apakah sedang scanning
  double _progressValue = 0.0;           // Progress bar (0.0 - 1.0)
  Color _statusColor = Colors.blue;      // Warna indikator status
  String _statusText = "Tekan tombol untuk memulai pemindaian";
  
  @override
  void initState() {
    super.initState();
    _checkNFCAvailability();
  }
}
