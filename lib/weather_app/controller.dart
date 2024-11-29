import 'package:get/get.dart';
import 'package:getxstatepractice/weather_app/weather_model.dart';
import 'package:getxstatepractice/weather_app/weather_service.dart';

// TODO:
// 1. Save Weather of any location.
// 2. Display on another screen.

class WeatherController extends GetxController {
  var weatherData = WeatherModel(
          temperature: 0.0,
          highestTemp: 0.0,
          lowestTemp: 0.0,
          humidity: 0,
          precipitation: 0.0,
          pressure: 0,
          windSpeed: 0.0,
          mainCondition: '')
      .obs;

  var isLoading = false.obs; // Boolean variable to track loading state

  final WeatherService weatherService = WeatherService();

  @override
  void onInit() {
    super.onInit();
    fetchWeather(33.6844, 73.0479);
  }

  Future<void> fetchWeather(double lat, double lon) async {
    try {
      isLoading.value = true;
      WeatherModel fetchedWeather =
          await weatherService.fetchWeatherData(lat, lon);
      weatherData.value = fetchedWeather; // Assign to weatherData
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch weather data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchWeatherFromCity(double lat, double lon) async {
    try {
      isLoading.value = true;
      WeatherModel fetchedWeather =
          await weatherService.fetchWeatherData(lat, lon);
      weatherData.value = fetchedWeather; // Assign to weatherData
      Get.snackbar("Success", "Weather Fetched from given coordinates.");
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch weather data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshWeather(double lat, double lon) async {
    await fetchWeather(lat, lon);
    Get.snackbar("Success", "Weather data refreshed");
  }
}
