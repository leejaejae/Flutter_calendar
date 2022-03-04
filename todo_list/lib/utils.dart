import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

/// Example events.
/// map 객체를 linkedhashmap 객체로 한번 더 변형
/// linkedhasmap == 비교나 hash 값 불러오는 등의 기능을 사용자 정의할 수 있게 해주는 map
final kEvents = LinkedHashMap<DateTime, List<dynamic>>(
  equals: isSameDay,  // isSameDay 함수 실행으로 equal 여부를 판단하도록 사용자 정의
  hashCode: getHashCode,  // 같은 객체 있는 지 확인하고
)..addAll(_events);  // 객체 생성과 동시에 addAll 메소드 실행

// 여기를 바꾸면 됨! 여기가 데이터야
final Map<DateTime, List> _events = {
  DateTime.utc(2022, 1, 31): ['Event 1', 'Event2'],
  DateTime.utc(2022, 1, 30): ['Event2'],
  DateTime.utc(2022, 2, 3): ['Event 1'],
  DateTime.utc(2022, 2, 13): ['Event 1'],
  DateTime.utc(2022, 2, 21): ['Event 1'],
  DateTime.utc(2022, 2, 28): ['Event 1'],
  // DateTime.utc(2022, 2, 31): ['Event 1'],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// double width = 180.w, // 숫자 뒤에 *.w를 쓰면, designSize 기준 가로 길이가 된다.
// double height = 300.h, // 숫자 뒤에 *.h를 쓰면, designSize 기준 세로 길이가 된다.
// double textSize = 18.sp, // 숫자 뒤에 *.sp를 쓰면, designSize 기준 폰트 크기가 설정된다.

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, 1,1);
final kLastDay = DateTime(kToday.year, 12, 31);
