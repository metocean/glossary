title: dBZ
units: decibel relative to Z
description: Radar reflectivity

# Decibel relative to Z

*dBZ* is a technical, dimensionless unit used mostly in weather radar to compare the equivalent reflectivity (*Z*) of a radar signal reflected off a remote object (in $$ mm^{6}m^{-3} $$) to the return of a droplet of rain with a diameter of 1 millimetre. **It is used to estimate the intensity of rain or snow.**

The radar reflectivity (*Z*) of a cloud is dependent on the number (*N*) and size (*D*) of reflectors, including rain, hail, snow, and graupel. dBZ values can be converted to rainfall rates in millimetres per hour using the Marshall-Palmer formula:

$$ \frac{mm}{hour} = (\frac{10^{(dBZ/10)}}{200})^{5/8} $$

| dBZ | mm/h  | in/h   | Intensity               |
|-----|-------|--------|-------------------------|
| 5   | 0.07  | < 0.01 | Hardly noticeable       |
| 10  | 0.15  | < 0.01 | Light mist              |
| 15  | 0.3   | 0.01   | Mist                    |
| 20  | 0.6   | 0.02   | Very light              |
| 25  | 1.3   | 0.05   | Light                   |
| 30  | 1.7   | 0.10   | Light to moderate       |
| 35  | 5.6   | 0.22   | Moderate rain           |
| 40  | 11.53 | 0.45   | Moderate rain           |
| 45  | 23.7  | 0.92   | Moderate to heavy rain  |
| 50  | 48.6  | 1.90   | Heavy rain              |
| 55  | 100   | 4      | Very heavy rain / small hail |
| 60  | 205   | 8      | Extreme / moderate hail |
| 65  | 421   | 16.6   | Extreme / large hail    |

## Caveats

Because a large number of small reflectors will have a similar signal to one large reflector, a reflectivty image alone cannot be used to determine with certainty what type of precipitation is present. Other factors that can affect reflectivity include the width of the radar beam, or ground returns from anomalous propagation due to downward bending of the radar beam in unusual atmospheric conditions.
