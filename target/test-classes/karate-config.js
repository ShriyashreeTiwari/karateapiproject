function fn() {
  var config = {};
  config.baseUrl = "http://localhost:3100"
  config.uniqueId = Math.floor(Math.random() * 10000).toString();
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}