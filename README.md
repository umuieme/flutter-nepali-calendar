# nepali_calendar

A plugin to convert AD to BS and vice versa. There is also Nepali Date Picker.
## Getting Started

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## How to use?

### Get NepaliDate from AD
Create instance using `NepaliDate.fromAd([dateTime])`

```
DateTime dateTime = DateTime(2019,1,1);
NepaliDate bsDate = NepaliDate.fromAD(dateTime);
print(bsDate.toString()); // 2075 - 9 - 17
```

You can also access individual year day month as
`bsDate.year`, `bsDate.month`, `bsDate.day`

### Get AD from BS
Create instance using `NepaliDate.fromBS(year, month, day)`

#### Example
```
NepaliDate nepaliDate = NepaliDate.fromBS(2076,1,1);
print("${nepaliDate.dateTime.year} - ${nepaliDate.dateTime.month} - ${nepaliDate.dateTime.day}")
// 2019 - 4 - 14
```

### DatePicker

```
 NepaliDatePicker(context, currentDate: pickedNepaliDate,
        onSelected: (nepalidate) {
          print(nepalidate);
    }).showDatePicker();
```

![Date Picker Image](https://github.com/umuieme/flutter-nepali-calendar/blob/master/screenshots/date_picker_1.png)
