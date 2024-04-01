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
