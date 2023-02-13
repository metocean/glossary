title: WAVEWATCH III (WW3)

# WAVEWATCH III (WW3)

WAVEWATCH III is a third generation wind-wave model initially developed at NOAA/NCEP, now developed and maintained by a number of scientists around the world. WAVEWATCH III resolves the evolution of the directional wave spectra in time and space, and not individual waves as in a phase-resolving model. While individual waves can change in a time-scale of a few seconds, the wave spectra evolves much more slowly, which allows the spectral wave models (such as WW3 and SWAN) to be run every hour for example. 

From the wave spectrum, integrated wave parameters can be derived, such as significant wave height, mean wave period and wave direction. These are representative of the mean wave conditions.  

<img src="https://user-images.githubusercontent.com/36142422/167741608-b16ead7a-895b-45e6-b5e7-e221931850df.png" width="60%">

WW3 therefore models the propagation of waves as well as the physical processes that add, remove or distribute energy in the spectrum. For example, wind blowing on the surface of the ocean will generate waves and therefore add energy to the wave spectrum, whereas bottom friction or wave breaking will remove (dissipate) wave energy, and interactions between waves of different frequencies might re-distribute the energy inside the spectrum.

WAVEWATCH III is normally used to simulate waves in deep waters, and SWAN is designed for wave modelling in coastal areas. At MetOcean, we combine both: we run global WW3 wave simulations, which generate boundary conditions and "feed" the coastal high-resolution SWAN nests.