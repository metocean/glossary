title: SCHISM

# SCHISM

## Not coupled

SCHISM (Semi-implicit Cross-scale Hydroscience Integrated System Model).
The benefit of using open-source science models is the full transparency of the code and numerical schemes, and the ability for other researchers to replicate and enhance any previous modelling efforts for a given environment.

SCHISM is a prognostic finite-element unstructured-grid model designed to simulate 3D baroclinic, 3D barotropic or 2D barotropic circulation.
The barotropic mode equations employ a semi-implicit finite-element Eulerian-Lagrangian algorithm to solve the shallow-water equations, forced by relevant physical processes (atmospheric, oceanic and fluvial forcing).
A detailed description of the SCHISM model formulation, governing equations and numeric, can be found in (Zhang and Baptista 2008).
The SCHISM model is physically realistic, in that well-understood laws of motion and mass conservation are implemented.
Therefore, water mass is generally conserved within the model, although it can be added or removed at open boundaries (e.g. through tidal motion at the ocean boundaries) and water is redistributed by incorporating aspects of the real-world systems (e.g. bathymetric information, forcing by tides and wind).
The model transports water and other constituents (e.g.  salt, temperature, turbulence) through the use of triangular volumes (connected 3-D polyhedrons).
The finite-element triangular grid structure used by SCHISM has resolution and scale benefits over other regular or curvilinear based hydrodynamic models.

SCHISM is computationally efficient in the way it resolves the shape and complex bathymetry associated with estuaries, and the governing equations are similar to other open-source models such as Delft3D and ROMS.
SCHISM has been used extensively within the scientific community, where it forms the backbone of operational systems used to nowcast and forecast estuarine water levels, storm surges, velocities, water temperature and salinity.


## Coupled

SCHISM (Semi-implicit Cross-scale Hydroscience Integrated System Model) and the Wind Wave Model III (WWM-III).
This state-of-the-art open-source ocean modelling system is widely used by the scientific community and industry for a range of regional and coastal scale applications including storm surges, hurricanes (Ye, 2019; Zhang et al., 2019), and typhoons (Babanin et al., 2011).
The benefit of using open-source science models is the full transparency of the code and numerical schemes, and the ability for other researchers to replicate and enhance any previous modelling efforts for a given environment.

SCHISM is a prognostic finite-element unstructured-grid model designed to simulate 3D baroclinic, 3D barotropic or 2D barotropic circulation.
The barotropic mode equations employ a semi-implicit finite-element Eulerian-Lagrangian algorithm to solve the shallow-water equations, forced by relevant physical processes (atmospheric, oceanic and fluvial forcing).
The SCHISM model is physically realistic, in that well-understood laws of motion and mass conservation are implemented.
Therefore, water mass is generally conserved within the model, although it can be added or removed at open boundaries (e.g. through tidal motion at the ocean boundaries) and water is redistributed by incorporating aspects of the real-world systems (e.g. bathymetric information, forcing by tides and wind).
The model transports water and other constituents (e.g. salt, temperature, turbulence) using triangular volumes (connected 3-D polyhedrons).
SCHISM has been used extensively within the scientific community, where it forms the backbone of operational systems used to nowcast and forecast estuarine water levels, storm surges, velocities, water temperature and salinity.
The finite-element triangular grid structure used by SCHISM/WWM has resolution and scale benefits over other regular or curvilinear based hydrodynamic models.
A detailed description of the model formulation, governing equations and numeric are presented in (Zhang and Baptista, 2008) and (Zhang et al., 2016) for SCHISM.

The wave model (WWM-III) is present as an internal module, sharing the same sub-domain grid partitions as specified for the SCHISM model.
This architecture provides enhanced computational efficiency, over alternative coupling methods, as it eliminates the need for interpolation, and simplifies the exchange of information between the two models.
Wave and hydrodynamics are resolved using a one-way or two-way coupling approach to provide an accurate representation of wave-current interactions, crucial to the wave and circulation regime in estuaries and harbours.
The coupling mechanism is such that surface elevation, wet/dry lags and velocity are passed from SCHISM to WWM-III (one-way coupling), and the calculated total surface stresses and wave orbital velocity are returned to SCHISM (two-way coupling).
The two models adopt different time stepping schemes.
The time steps are kept different in order to take advantage of each model's efficiency.
Information exchange between both takes place at regular pre-defined intervals.

A detailed description of the model formulation, governing equations and numeric are presented in (Y. Zhang and Baptista 2008) and (Y. J. Zhang et al. 2016) for SCHISM and (Roland et al. 2012) for WWM-III.
