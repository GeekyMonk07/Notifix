class Notice {
  final String time;
  final String title;
  final String description;
  final int timestamp;

  const Notice({
    required this.time,
    required this.description,
    required this.title,
    required this.timestamp,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        time: json['time'],
    description: json['description'],
        title: json['title'],
    timestamp: json['timestamp'],
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'title': title,
        'description': description,
        'timestamp': timestamp,
      };
}
