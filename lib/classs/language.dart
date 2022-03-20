class Language {
  final int id;
  final String name;
  final String flag;
  final String langaugecode;

  Language({ required this.id, required this.name, 
  required this.flag, required this.langaugecode});


  static List<Language> languageList(){
    return <Language>[
      Language(id: 1, name: 'नेपाली', flag: '🇳🇵', langaugecode: 'ne'),
      Language(id: 2, name: 'United State', flag: '🇺🇸', langaugecode: 'en'),
      Language(id: 3, name: 'Türkiye', flag: '🇹🇷', langaugecode: 'tr'),
    ];
  }
  
}