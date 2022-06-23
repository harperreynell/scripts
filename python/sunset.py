from astral import Astral
from datetime import date
import python_weather
import asyncio

city_name = 'Kiev'
a = Astral()
a.solar_depression = 'civil'
city = a[city_name]
sun = city.sun(date=date.today(), local=True)
print(sun['sunset'])

async def getweather():
    client = python_weather.Client(format=python_weather.METRIC)

    weather = await client.find("Kyiv")

    print(weather.current.temperature)

    for forecast in weather.forecasts:
        print(str(forecast.date), forecast.sky_text, forecast.temperature)

    await client.close()

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(getweather())
