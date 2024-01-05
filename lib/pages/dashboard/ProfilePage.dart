import 'package:flutter/material.dart';
import 'package:flutter_laporbook/components/styles.dart';
import 'package:flutter_laporbook/models/akun.dart';
import 'package:laporbook/components/styles.dart';

class Profile extends StatefulWidget {
  final Akun akun;

  const Profile({Key? key, required this.akun}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              widget.akun.nama,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Text(
              widget.akun.role,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            buildInfoContainer("No. Handphone", widget.akun.noHP),
            buildInfoContainer("Email", widget.akun.email),
          ],
        ),
      ),
    );
  }

  Widget buildInfoContainer(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: primaryColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
