enum ELanguage {
  english('https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg'),
  french('https://www.countryflags.com/wp-content/uploads/france-flag-png-large.png'),
  german('https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/800px-Flag_of_Germany.svg.png'),
  chinese('https://cdn.britannica.com/90/7490-050-5D33348F/Flag-China.jpg?w=400&h=235&c=crop'),
  japanese('https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Flag_of_Japan.svg/1200px-Flag_of_Japan.svg.png'),
  turkish('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/800px-Flag_of_Turkey.svg.png');

  const ELanguage(this.link);
  final String link;

}