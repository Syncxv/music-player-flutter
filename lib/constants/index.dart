class Constants {
  final libraryConstnats = LibraryScreenConstnats();
}

class LibraryScreenConstnats {
  final double padding = 20.0;
  double get tabBorderPadding {
    return padding - 10.0;
  }

  double get playlistPadding {
    return padding - 6.0;
  }
}

final constants = Constants();
