String colorMode(String arg) {
  var input = arg.toLowerCase();
  if (input == 'clear') {
    return 'sun';
  } else if (input == 'clouds') {
    return 'cloud';
  } else if (input == 'rain' ||
      input == 'drizzle' ||
      input == 'mist' ||
      input == 'haze' ||
      input == 'smoke' ||
      input == 'dust') {
    return 'rain';
  } else if (input == 'snow') {
    return 'snow';
  } else if (input == 'tornado' ||
      input == 'thunderstorm' ||
      input == 'squall') {
    return 'wind';
  } else {
    return 'sun';
  }
}
