import 'dart:core';

class NepaliDate {
  Map<int, List<int>> _bsYears = {
    1975: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    1976: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    1977: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    1978: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    1979: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    1980: [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    1981: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    1982: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    1983: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    1984: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    1985: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    1986: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    1987: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    1988: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    1989: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    1990: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
    1991: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    1992: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    1993: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    1994: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    1995: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    1996: [31, 31, 32, 32, 31, 30, 29, 30, 30, 29, 30, 30],
    1997: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    1998: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    1999: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2000: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2001: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2002: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2003: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2004: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2005: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2006: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2007: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2008: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
    2009: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2010: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2011: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2012: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    2013: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2014: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2015: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2016: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    2017: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2018: [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2019: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2020: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    2021: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2022: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    2023: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2024: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    2025: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2026: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2027: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2028: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2029: [31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30],
    2030: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2031: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2032: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2033: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2034: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2035: [30, 32, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
    2036: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2037: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2038: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2039: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    2040: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2041: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2042: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2043: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    2044: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2045: [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2046: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2047: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    2048: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2049: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    2050: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2051: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    2052: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2053: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    2054: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2055: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2056: [31, 31, 32, 31, 32, 30, 30, 29, 30, 29, 30, 30],
    2057: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2058: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2059: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2060: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2061: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2062: [30, 32, 31, 32, 31, 31, 29, 30, 29, 30, 29, 31],
    2063: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2064: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2065: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2066: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 29, 31],
    2067: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2068: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2069: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2070: [31, 31, 31, 32, 31, 31, 29, 30, 30, 29, 30, 30],
    2071: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2072: [31, 32, 31, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2073: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 31],
    2074: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    2075: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2076: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    2077: [31, 32, 31, 32, 31, 30, 30, 30, 29, 30, 29, 31],
    2078: [31, 31, 31, 32, 31, 31, 30, 29, 30, 29, 30, 30],
    2079: [31, 31, 32, 31, 31, 31, 30, 29, 30, 29, 30, 30],
    2080: [31, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    2081: [31, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30],
    2082: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
    2083: [31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30],
    2084: [31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30],
    2085: [31, 32, 31, 32, 30, 31, 30, 30, 29, 30, 30, 30],
    2086: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
    2087: [31, 31, 32, 31, 31, 31, 30, 30, 29, 30, 30, 30],
    2088: [30, 31, 32, 32, 30, 31, 30, 30, 29, 30, 30, 30],
    2089: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
    2090: [30, 32, 31, 32, 31, 30, 30, 30, 29, 30, 30, 30],
    2091: [31, 31, 32, 32, 31, 30, 30, 29, 30, 29, 30, 30],
    2092: [30, 31, 32, 32, 31, 30, 30, 30, 29, 30, 30, 30],
    2093: [30, 32, 31, 32, 31, 30, 30, 30, 29, 29, 30, 30],
    2094: [31, 31, 32, 31, 31, 30, 30, 30, 29, 30, 30, 30],
    2095: [31, 31, 32, 31, 31, 31, 30, 29, 30, 30, 30, 30],
  };

  var _config = {
    'ad_firstDay': '1918-04-13',
    'bs_start': 1975,
    'ad_start': 1918,
    'bs_end': 2095,
    'ad_end': 2038,
  };

  DateTime dateTime;

  int year;
  int month;
  int day;
  NepaliDate._internal() {
    print(dateTime);
  }

// throws invalid range error if provided date cannot be converted
  factory NepaliDate.fromBS(int year, int month, int day) {
    var nepDate = NepaliDate._internal();
    nepDate.year = year;
    nepDate.month = month;
    nepDate.day = day;
    nepDate._validateBS();
    nepDate.toAD();
    print(nepDate.dateTime);
    return nepDate;
  }

  factory NepaliDate.fromAD(DateTime dateTime) {
    var nepDate = NepaliDate._internal();
    nepDate.dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day);
    print(dateTime);
    nepDate._validateAD();
    nepDate.toBS();
    print(nepDate);
    return nepDate;
  }

  @override
  String toString() {
    return "$year - $month - $day";
  }

  toBS() {
    DateTime startAdDate = _getStartDate();
    var duration = dateTime.difference(startAdDate);
    // var difference = (duration.inSeconds / (60 * 60 *24)).toInt();
    var totalDays = (duration.inSeconds / (60 * 60 *24)).ceilToDouble().toInt();

    print("totalDays ==== $totalDays");
    print("totalDays ==== ${duration.inSeconds / (60 * 60 *24)}");
    print(duration.inDays);
    year = _config['bs_start'];
    month = 0;
    day = 0;
    while (totalDays >= 0) {
      List<int> dayInYear = _bsYears[year];
      for (int i = 0; i < 12; i++) {
        var dayInMonth = dayInYear[i];
        // if(totalDays == dayInMonth){
        // }
        if (totalDays < dayInMonth) {
          // print("dayInMonth === $i === $dayInMonth === $totalDays");

          month = i + 1;
          day = totalDays+1;
          return;
        }
        totalDays -= dayInMonth;
      }
      ++year;
      // print(
      //     "year === $year ===${_bsYears[year].reduce((a, b) => a + b)} ===== $totalDays");
    }
  }

  toAD() {
    var dayCount = 0;
    int i;

    for (i = _config['bs_start']; i < year; i++) {
      dayCount += _bsYears[i].reduce((value, item) => value + item);
    }
    for (int j = 0; j < month - 1; j++) {
      dayCount += _bsYears[i][j];
    }
    dayCount += day - 1;
    dateTime = _getStartDate().add(Duration(days: dayCount));
  }

  DateTime _getStartDate() {
    var firstAdDay = _config['ad_firstDay'].toString().split("-");
    return DateTime(int.parse(firstAdDay[0]), int.parse(firstAdDay[1]),
        int.parse(firstAdDay[2]));
  }

  _validateBS(){
    if(!_bsYears.containsKey(year)){
      throw RangeError.range(year, _config['bs_start'], _config['bs_end'], "The provided year is outside the scope.");
    }
    if(month >12 || month <1){
      throw RangeError.range(month, 1, 12, "DateConversion Error","The provided month is not valid");
    }
    if(day <1 || day > _bsYears[year][month-1]){
      throw RangeError.range(day, 1, _bsYears[year][month-1], "DateConversion Error","The given day does not exist");
    }
  }

  _validateAD(){
    if(dateTime.compareTo(_getStartDate()) <0 || dateTime.year > _config['ad_end']){
        throw RangeError("The provided date is outside the scope of this library");
    }
  }
}
