import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _tinggiBadan = TextEditingController();
  final TextEditingController _beratBadan = TextEditingController();

  double _hasil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Kalkulator BMI')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _tinggiBadan,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Badan (cm)',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _beratBadan,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat Badan Badan (kg)',
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 15),
            Text(
              _hasil == null ? "" : "${_hasil.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Text(
              _hasil == null
                  ? ""
                  : _hasil >= 30
                      ? "Obesitas \nHasil perhitungan menunjukkan bahwa Anda tergolong obesitas. Hasil ini berdasarkan angka BMI Anda lebih dari 30. Perlu diketahui bahwa obesitas lebih parah daripada gemuk. Seseorang yang gemuk belum tentu obesitas, sedangkan seseorang yang obesitas sudah dipastikan gemuk. Jika dibiarkan, bisa berisiko menderita berbagai penyakit serius."
                      : _hasil >= 25
                          ? "Gemuk \nHasil perhitungan menunjukkan bahwa Anda memiliki berat badan berlebih atau gemuk. Hasil ini berdasarkan angka BMI Anda yang ada di antara angka 25 sampai 29.9. Sebagai solusinya, Anda harus mengurangi asupan asupan kalori harian sekitar 300-500 kkal. Mulai sekarang coba lebih perhatikan kalori dari makanan dan minuman yang Anda konsumsi."
                          : _hasil >= 18.5
                              ? "Normal \nHasil perhitungan menunjukkan bahwa Anda memliki berat badan normal. Hasil ini berdasarkan angka BMI Anda yang ada di antara angka 18.5 sampai 24.9. Memiliki berat badan ideal bisa menjadi salah satu cara untuk menjaga kesehatan tubuh secara keseluruhan. Anda juga bisa terhindar dari berbagai risiko penyakit berbahaya."
                              : "Kurus \nHasil perhitungan menunjukkan bahwa Anda memiliki berat badan kurang atau tergolong kurus. Hasil ini berdasarkan angka BMI Anda yang berada di bawah 18.5. Sebagai solusinya, Anda membutuhkan asupan kalori tambahan sebanyak 300-500 kkal per hari. Perbaiki juga pola makan dan pola hidup untuk mendapatkan berat badan ideal.",
              style: TextStyle(
                fontSize: 19.4,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double tinggi = double.parse(_tinggiBadan.text) / 100;
    double weight = double.parse(_beratBadan.text);

    double tinggiSquare = tinggi * tinggi;
    double hasil = weight / tinggiSquare;

    _hasil = hasil;

    setState(() {});
  }
}
