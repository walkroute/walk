class EventsRepository {
  Map<DateTime, List<Map<String, dynamic>>> getEvents() {
    return {
      DateTime.utc(2024, 5, 22): [
        {
          'title': 'Morning Walk',
          'distance': 5, // km
          'time': 60, // minutes
          'photoCount': 3,
          'questCompleted': true,
        },
      ],
      DateTime.utc(2024, 5, 23): [
        {
          'title': 'Evening Jogging',
          'distance': 3,
          'time': 45,
          'photoCount': 1,
          'questCompleted': false,
        },
      ],
    };
  }
}
