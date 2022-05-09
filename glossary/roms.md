title: ROMS

# ROMS

ROMS is a 3D primitive equations ocean model using hydrostatic and Boussinesq approximations.
The model is forced in the surface by winds, heat and water fluxes, and sea level pressure from the ECMWF forecast model.
Boundary conditions are provided by the Copernicus global operational forecast.
The contributions to the circulation from the tides and the inverse barometer effect - important when under influence of frontal systems - are determinant for the local circulation and will be included in the simulation.
11 constituents obtained from the Oregon State University TOPEX/Poseidon Global Inverse Solution (TPXO) will be introduced to our simulation as a separate spectral forcing at the boundaries to the free surface and barotropic velocity.
The inverse barometer effect is internally calculated in circulation model using the sea level pressure provided by the atmospheric model.

A full description of the ROMS model can be found in Shchepetkin and McWilliams (2005) and McWilliams (2009), and the ROMS website (www.myroms.org).
