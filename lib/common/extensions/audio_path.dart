extension RemoveDuplicatePath on String {
  String get audioPath => replaceAll('assets/audio/', '');
}
