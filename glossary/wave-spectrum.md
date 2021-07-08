title: Wave spectrum
units: m^2s/degree
description: The wave spectrum quantifies the amount of energy in different wave components in the sea state.

#Wave spectrum
Wave spectra are introduced as a standard method of describing the characteristics of waves along with the fact that waves can travel very large distances in oceans arriving at a given location from different directions.

A sea state can be thought of as the combination of many different wave components, each of which has its own frequency (the inverse of period) and direction. The ocean wave spectrum describes the relative amount of energy in each of these different wave components.

The wave spectrum is usually expressed as $$E(f,\theta)$$, with units $$m^2s/\theta$$.  From this quantity, a number of [spectra parameters](spectral-parameters) can be derived, such as [significant wave height](significant-wave-height), [peak period](peak-period) and [mean wave  direction](mean-wave-direction). These derived quantities summarise aspects of the sea state in terms of single numbers and are the values provided in metocean forecasts.

The wave spectrum can be devided into [spectral partitions](spectral-partitions) to represent different parts of the sea state, for example [sea](sea) and [swell](swell). Individual [spectral parameters](spectral-parameters) can then be derived for each partition to describe (for example) the significant wave height of swell.

Most [wave models](wave-models) calculate the quantity $$E(f,\theta)$$ at each grid point for each time, thereby providing a complete description of the evolving sea state throughout the model domain.
