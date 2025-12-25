// Package weather provides weather-related information and forecasting.
package weather

// CurrentCondition describes the current weather condition, e.g., "sunny", "cloudy", "rainy".
var CurrentCondition string

// CurrentLocation describes the current location for which the weather is being reported.
var CurrentLocation string

// Forecast updates the current wheater location and condition, and returns a formatted string.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
