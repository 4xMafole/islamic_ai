// ignore_for_file: constant_identifier_names, public_member_api_docs

enum Book {
  QuranInEnglish,
  SahihAlBukhari,
  SahihMuslim,
  SunanAbuDawud,
  AlMuwatta,
}

extension BookExtension on Book {
  String get name {
    switch (this) {
      case Book.QuranInEnglish:
        return 'The Quran - in English';
      case Book.SahihAlBukhari:
        return 'Sahih al-Bukhari';
      case Book.SahihMuslim:
        return 'Sahih Muslim';
      case Book.SunanAbuDawud:
        return 'Sunan Abu Dawud';
      case Book.AlMuwatta:
        return 'Al-Muwatta';
    }
  }

  static Book? fromName(String name) {
    for (final book in Book.values) {
      if (book.name == name) {
        return book;
      }
    }
    return null;
  }
}
