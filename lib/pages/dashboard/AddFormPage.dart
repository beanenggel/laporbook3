import 'package:flutter/material.dart';
import '../../components/input_widget.dart';
import 'package:laporbook/components/styles.dart';
import 'package:laporbook/components/validators.dart';

class AddFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddFormState();
}

class AddFormState extends State<AddFormPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:
            Text('Tambah Laporan', style: headerStyle(level: 3, dark: false)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Form(
                  child: Container(
                    margin: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        InputLayout(
                          'Judul Laporan',
                          TextFormField(
                            onChanged: (value) {
                              // Implementasi fungsi onChanged
                            },
                            validator: notEmptyValidator,
                            decoration:
                                customInputDecoration("Masukkan judul laporan"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              // Implementasi fungsi onPressed
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.photo_camera),
                                Text(' Foto Pendukung',
                                    style: headerStyle(level: 3)),
                              ],
                            ),
                          ),
                        ),
                        InputLayout(
                          'Instansi',
                          DropdownButtonFormField<String>(
                            key: UniqueKey(), // Menambahkan kunci unik
                            decoration: customInputDecoration('Pilih Instansi'),
                            items: [], // Isi item sesuai kebutuhan
                            onChanged: (value) {
                              // Implementasi fungsi onChanged
                            },
                          ),
                        ),
                        InputLayout(
                          "Deskripsi laporan",
                          TextFormField(
                            onChanged: (value) {
                              // Implementasi fungsi onChanged
                            },
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: 5,
                            decoration: customInputDecoration(
                                'Deskripsikan semua di sini'),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          child: FilledButton(
                            style: buttonStyle,
                            onPressed: () {
                              // Implementasi fungsi onPressed
                            },
                            child: Text(
                              'Kirim Laporan',
                              style: headerStyle(level: 3, dark: false),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
