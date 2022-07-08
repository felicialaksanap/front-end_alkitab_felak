class dataAlkitab {
  final String dId;
  final int dBookId;
  final String dAbbreviation;
  final String dBook;
  final int dChapter;
  final int dVerse;
  final String dContent;
  final String dType;

  dataAlkitab({
    required this.dId,
    required this.dBookId,
    required this.dAbbreviation,
    required this.dBook,
    required this.dChapter,
    required this.dVerse,
    required this.dContent,
    required this.dType
  });

  factory dataAlkitab.fromJson(Map<String, dynamic> json) {
    return dataAlkitab(
      dId: json['ID'], 
      dBookId: json['bookID'], 
      dAbbreviation: json['abbreviation'], 
      dBook: json['book'], 
      dChapter: json['chapter'], 
      dVerse: json['verse'], 
      dContent: json['content'], 
      dType: json['type']
    );
  }
}