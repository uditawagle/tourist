class Language {
  final int id;
  final String flag;
  final String name;
  final String langaugecode;

  Language({ required this.id, required this.name, 
  required this.flag, required this.langaugecode});


  static List<Language> languageList(){
    return <Language>[
      Language(id:1, flag: "🇦🇫", name: "فارسی", langaugecode:"fa"),
      Language(id:2, flag: "🇺🇸", name: "English", langaugecode:"en"),
      Language(id:3, flag: "🇸🇦", name: "اَلْعَرَبِيَّةُ", langaugecode:"ar"),
      Language(id:4, flag: "🇮🇳", name: "हिंदी", langaugecode:"hi"),
      // Language(id: 1, name: 'नेपाली', flag: '🇳🇵', langaugecode: 'ne'),
      // Language(id: 2, name: 'United State', flag: '🇺🇸', langaugecode: 'en'),
      // Language(id: 3, name: 'Türkiye', flag: '🇹🇷', langaugecode: 'tr'),
    ];
  }
  
}