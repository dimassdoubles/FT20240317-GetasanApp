import 'package:flutter/material.dart';

class DateTimeHelper {
  DateTimeHelper._();
  static const months = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  static String displasyTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, "0");
    final minute = time.minute.toString().padLeft(2, "0");

    return "$hour:$minute";
  }

  static String displayDate(DateTime date) {
    final day = date.day.toString().padLeft(2, "0");
    final month = date.month.toString().padLeft(2, "0");
    final year = date.year;

    return "$day/$month/$year";
  }

  static int monthToInt(String month) {
    int monthInt = 1;
    for (var m in months) {
      if (m == month.toLowerCase()) {
        return monthInt;
      }
      monthInt++;
    }

    throw ("Nama bulan tidak terdaftar: $month");
  }
}
